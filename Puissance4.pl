:- dynamic board/1.

%%%% Print the value of the board at index N %%%%
%% if its a variable, print " " and X or O otherwise.
printVal(N) :- board(B), nth0(N,B,Val), var(Val), write('_'), write(' | '), !.
printVal(N) :- board(B), nth0(N,B,Val),Val='X',ansi_format([fg(red)], Val, []),  write(' | '),!.
printVal(N) :- board(B), nth0(N,B,Val),Val='O',ansi_format([fg(green)], Val, []),  write(' | ').

%%%% Display the board //DONE
displayBoard:-
    writeln('  1   2   3   4   5   6   7   '),
    writeln('  ----------------------------'),
    write(' | '), printVal(0) , printVal(1) , printVal(2) , printVal(3) , printVal(4) , printVal(5) , printVal(6) , writeln(''),
    writeln('  ----------------------------'),
    write(' | '), printVal(7) , printVal(8) , printVal(9), printVal(10), printVal(11), printVal(12), printVal(13), writeln(''),
    writeln('  ----------------------------'),
    write(' | '), printVal(14), printVal(15), printVal(16), printVal(17), printVal(18), printVal(19), printVal(20), writeln(''),
    writeln('  ----------------------------'),
    write(' | '), printVal(21), printVal(22), printVal(23), printVal(24), printVal(25), printVal(26), printVal(27), writeln(''),
    writeln('  ----------------------------'),
    write(' | '), printVal(28), printVal(29), printVal(30), printVal(31), printVal(32), printVal(33), printVal(34), writeln(''),
    writeln('  ----------------------------'),
    write(' | '), printVal(35), printVal(36), printVal(37), printVal(38), printVal(39), printVal(40), printVal(41), writeln(''),
    writeln('  ----------------------------').


%%% Depending of X and Y, use the right play %%%%%
playerType(X,Y):-
    (
    X=1, Y=0, playIAVsHuman('X');
    X=1, Y=1, playIAvsIA('X');
    X=0, Y=0, playHumanVsHuman('X');
    X=0, Y=1, playHumanVsIA('X')
    ).

%%%% Play a Move, the new Board will be the same, but one value will be instanciated with the Move
playMove(Board,Move,NewBoard,Player) :- Board=NewBoard,  nth0(Move,NewBoard,Player).

%%%% Remove old board/save new on in the knowledge base /
applyIt(Board,NewBoard) :- retract(board(Board)), assert(board(NewBoard)).

%%%% Predicate to get the next player
changePlayer('X','O').
changePlayer('O','X').

%%%% Test is the game is finished %%% 
gameover(Winner) :- board(Board), winner(Board,Winner), !.  % There exists a winning configuration: We cut!
gameover('Draw') :- board(Board), isBoardFull(Board). % the Board is fully instanciated (no free variable): Draw.

%%%true if index A and B are on the same line
sameLine(A, B) :- M1 is div(A, 7), M2 is div(B, 7), M1 =:= M2. 

%%%%sameItem : true if the elements at the A, B, C and D index of theboard are P
sameItem(A, B, C, D, Board, P):-  nth1(A, Board, Q), nth1(B, Board, R),nth1(C, Board, S),nth1(D, Board, P),nonvar(Q), nonvar(R), nonvar(S), Q == P, R == P, S == P.

%%%% Test if a Board is a winning configuration for the player P.
winnerHorizontal(Board, P, N):- N < 40, N1 is N+1, N2 is N+2, N3 is N+3, sameLine(N, N3), sameItem(N, N1, N2, N3, Board, P), !.
winnerHorizontal(Board, P, N):- N < 39,  N1 is N+1, winnerHorizontal(Board, P, N1).
winnerVertical(Board, P, N):- N < 22, N1 is N+7, N2 is N+14, N3 is N+21, sameItem(N, N1, N2, N3, Board, P), !.
winnerVertical(Board, P, N):- N < 21,  Next is N+1, winnerVertical(Board, P, Next).
winnerDiagonale1(Board, P, N):-  N < 19, N1 is N+8, N2 is N1+8, N3 is N2+8, sameItem(N, N1, N2, N3, Board, P),  !.
winnerDiagonale1(Board, P, N):- N < 18, Next is N+1, winnerDiagonale1(Board, P, Next).
winnerDiagonale2(Board, P, N):- N < 22, N1 is N+6, N2 is N1+6, N3 is N2+6,sameItem(N, N1, N2, N3, Board, P),!.
winnerDiagonale2(Board, P, N):- N < 21, Next is N+1, winnerDiagonale2(Board, P, Next).

winner(Board, P):- winnerHorizontal(Board, P, 1).
winner(Board, P):- winnerVertical(Board, P, 1).
winner(Board, P):- winnerDiagonale1(Board, P, 1).
winner(Board, P):- winnerDiagonale2(Board, P, 4).


%%%% Recursive predicate that checks if all the elements of the List (a board)
%%%% are instanciated: true e.g. for [x,x,o,o,x,o,x,x,o] false for [x,x,o,o,_G125,o,x,x,o]
isBoardFull([]).
isBoardFull([H|T]):- nonvar(H), isBoardFull(T).

%%%% fonction play Random AI vs Random AI %%%%
playIAvsIA(_):- gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner), displayBoard, !.
playIAvsIA(Player):-
        write('New turn for:'), writeln(Player),
        board(Board), % instanciate the board from the knowledge base
        ia(Board, Move,Player), % ask the AI for a move, that is, an index for the Player
        playMove(Board,Move,NewBoard,Player), % Play the move and get the result in a new Board
        applyIt(Board, NewBoard), % Remove the old board from the KB and store the new one
        displayBoard, % print it
        changePlayer(Player,NextPlayer), % Change the player before next turn
        playIAvsIA(NextPlayer). % next turn!

ia(B,Move,_) :-
        repeat,
        inv(B,R), %%% On va parcourir le board dans le sens contraire
                  %%% pour trouver la case vide qui appartient à la ligne la plus basse.
        Index1 is random(7),  % Attribution d'un numéro alétoire de colonne
        Index is 6-Index1,    % Adaptation du n°de colonne avec le board inversé.
        verif1(Index,R,Move);
        (nonvar(Move)->!).

%%%%% fonction play for an AI vs human %%%%%%
playIAVsHuman(_):- gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner), displayBoard, !.
playIAVsHuman(Player):-
        board(Board), % instanciate the board from the knowledge base
        displayBoard, % print it
        write('New turn for IA : '), writeln(Player),
        ia(Board, Move,Player),
        playMove(Board,Move,NewBoard,Player),
        applyIt(Board, NewBoard),
        displayBoard,
        changePlayer(Player,NextPlayer),
        write('It is your turn : '),write(NextPlayer),write(' choose a column number : '), readChoice(X, 0, 8),X1 is X-1,
        board(Board2),
        human(Board2,X1, MoveH,NextPlayer),
        playMove(Board2,MoveH,NewBoard2,NextPlayer),
        applyIt(Board2, NewBoard2),
        changePlayer(NextPlayer,Player),
        playIAVsHuman(Player). % next turn!


%%%%% fonction play for an human vs Random AI %%%%%%
playHumanVsIA(_):- gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner), displayBoard, !.
playHumanVsIA(Player):-
        board(Board), % instanciate the board from the knowledge base
        displayBoard, % print it
        write('It is your turn : '),write(Player),write(' choose a column number : '), readChoice(X, 0, 8),X1 is X-1,
        human(Board,X1, MoveH,Player),
        playMove(Board,MoveH,NewBoard,Player),
        applyIt(Board, NewBoard),
        displayBoard,
        changePlayer(Player,NextPlayer),
        write('New turn for IA : '), writeln(NextPlayer),
        board(Board2),
        ia(Board2, Move,NextPlayer),
        playMove(Board2,Move,NewBoard2,NextPlayer),
        applyIt(Board2, NewBoard2),
        changePlayer(NextPlayer,Player),
        playHumanVsIA(Player). % next turn!

%%%%% fonction play for an human vs an human %%%%%%
playHumanVsHuman(_):- gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner), displayBoard, !.
playHumanVsHuman(Player):-
        board(Board), % instanciate the board from the knowledge base
        displayBoard, % print it
        write('It the turn for: '),write(Player),write(' choose a column number : '), readChoice(X, 0, 8),X1 is X-1,
        human(Board,X1, MoveH1,Player),
        playMove(Board,MoveH1,NewBoard,Player),
        applyIt(Board, NewBoard),
        displayBoard,
        changePlayer(Player,NextPlayer),
        write('It the turn for: '),write(NextPlayer),write(' choose a column number : '), readChoice(X2, 0, 8),X3 is X2-1,
        board(Board2),
        human(Board2,X3, MoveH2,NextPlayer),
        playMove(Board2,MoveH2,NewBoard2,NextPlayer),
        applyIt(Board2, NewBoard2),
        changePlayer(NextPlayer,Player),
        playHumanVsHuman(Player).

%%%% return the right empty case in the column choosen by the human player %%%%%
human(B,X,Move,_) :-
          inv(B,R), %%% On va parcourir le board dans le sens contraire
                    %%% pour trouver la case vide qui appartient � la ligne la plus basse.
          Index is 6-X,    % Adaptation du n�de colonne avec le board invers�.
          verif1(Index,R,Move).



%%%%% Inverse the board %%%%%%
append([],L,L).
append([H|T],L,[H|B]) :- append(T,L,B).
inv([],[]) :- !.
inv([A|B],R) :- inv(B,X),append(X,[A],R).

%%% Check weither the case is empty
%%% if true => you can play in that case, 
%%% Move is 41-Index ==> get the correct case number
%%% else ==> we use verif2 to increment the index by 7 and do verif1 again
verif1(Index,B,Move):- Index < 42, nth0(Index,B,Val),var(Val),Move is 41-Index;Index<42,verif2(Index,B,Move).
verif2(Index,B,Move):- Inde is Index+7, verif1(Inde,B,Move).


%%%%% Start the game!
init :-
        retractall(board(_)),
        length(Board,42),
        assert(board(Board)),
        writeln('What is the type of the first player which will use the symbol X ?'),
        writeln('  - 0 : for a human player .'),writeln('  - 1 : for a RandomAI player .'),
        readChoice(Player1, -1, 2),
        writeln('What is the type of the second player which will use the symbol O ?'),
        writeln('  - 0 : for a human player .'),writeln('  - 1 : for a RandomAI player .'),
        readChoice(Player2, -1, 2),
        game: playerType(Player1,Player2).



%%% Read the choice, must be an Integer between Min and Max
readChoice(X, Min, Max) :-
    repeat,
    write('   The value must be between '), write(Min), write(' and '), write(Max), writeln(' (exclusive)'),
    readInt(X),
    X < Max,
    X > Min,
    !.
readInt(X) :-
    repeat, write('    Please enter an integer '), read(X), integer(X), !.