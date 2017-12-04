:- module('greedyAI', []).
:- use_module('gameover').
:- use_module('init').
:- use_module('game').
:- use_module('display').

%%%% verifie si la case(Col,Row) est vide %%%%%
verifVar(Col,Row,Board):-caseBoard(Col, Row, Board, Elem),var(Elem).

%%%% Trouver la bonne place dans une colonne %%%%%
verifColumn(Col,Row,Board):-caseBoard(Col, Row-1, Board, ElemOver),nonvar(ElemOver).

%%%% colonne vide %%%%%
columnVide(_,0,_).

%%% On verifie si la case(Col,Row) est vide et si la case(Col,Row-1) est non vide %%%%%
isMoveValid(Col,Row,Board):-verifVar(Col,Row,Board),verifColumn(Col,Row,Board). 
isMoveValid(Col,Row,Board):-verifVar(Col,Row,Board),columnVide(Col,Row,Board).

% Retourne l'élément à la position [IndCol, IndRow]
caseBoard(IndCol, IndRow, Board, Elem) :- nonvar(IndCol), nonvar(IndRow), Index is IndCol + IndRow* 7, var(Elem), !, nth0(Index, Board, Elem).
% Retourne IndCol et IndRow pour un élément Elem
caseBoard(IndCol, IndRow, Board, Elem) :- nth0(Index, Board, Elem), IndRow is div(Index, 7), IndCol is mod(Index, 7).

playMove(Board,Col,Row,NewBoard,Player) :- Board=NewBoard, caseBoard(Col,Row,NewBoard,Player).

%%%%% Check row  %%%%%%
check4Pion(Board, P) :- caseBoard(C1, R, Board, E1),
                    nonvar(E1),
    				P = E1,
    				C1 =< 3,
                    C2 is C1+1,
                    caseBoard(C2, R, Board, E2),
                    E2 == P,
                    C3 is C2+1,
                    caseBoard(C3, R, Board, E3),
                    E3 == P,
                    C4 is C3+1,
                    caseBoard(C4, R, Board, E4),
                    E4 == P, !. 
%%%%% Check column  %%%%%%
check4Pion(Board, P) :- caseBoard(C, R1, Board, E1),
                    nonvar(E1),
    				P = E1,
    				R1 =< 2,
                    R2 is R1+1,
                    caseBoard(C, R2, Board, E2),
                    E2 == P,
                    R3 is R2+1,
                    caseBoard(C, R3, Board, E3),
                    E3 == P,
                    R4 is R3+1,
                    caseBoard(C, R4, Board, E4),
                    E4 == P, !. 

%%%%% Check Diag 1  %%%%%%
check4Pion(Board, P) :- caseBoard(C1, R1, Board, E1),
                    nonvar(E1),
    				P = E1,
                    C1 =< 3,
                    R1 =< 2,
                    C2 is C1+1,
                    R2 is R1+1,
                    caseBoard(C2, R2, Board, E2),
                    E2 == P,
                    C3 is C2+1,
                    R3 is R2+1,
                    caseBoard(C3, R3, Board, E3),
                    E3 == P,
                    C4 is C3+1,
                    R4 is R3+1,
                    caseBoard(C4, R4, Board, E4),
                    E4 == P, !. 

%%%%% Check Diag2  %%%%%%
check4Pion(Board, P) :- caseBoard(C1, R1, Board, E1),
                    nonvar(E1),
    				P = E1,
      				C1 =< 3,
    				R1 >= 3,
                    C2 is C1+1,
                    R2 is R1-1,
                    caseBoard(C2, R2, Board, E2),
                    E2 == P,
                    C3 is C2+1,
                    R3 is R2-1,
                    caseBoard(C3, R3, Board, E3),
                    E3 == P,
                    C4 is C3+1,
                    R4 is R3-1,
                    caseBoard(C4, R4, Board, E4),
                    E4 == P, !. 

ia(Board,'X',Col):-
         isMoveValid(Col,Row,Board), 
		 copy_term(Board, NewBoard), %%%%Create a version of In with renamed (fresh) variables and unify it to Out.
		 playMove(NewBoard,Col,Row,NewBoard2,'O'), 
		 check4Pion(NewBoard2,'O'),!.


ia(Board,'X',Col):-
         isMoveValid(Col,Row,Board),
		 copy_term(Board, NewBoard), 
		 game: changePlayer('O',NextPlayer), 
		 playMove(NewBoard,Col,Row,NewBoard2,NextPlayer), 
		 check4Pion(NewBoard2,NextPlayer),!.


ia(Board, _, Col):-
         repeat, 
		 Col is random(7), 
		 isMoveValid(Col, _, Board),!.
		 
playRandomIAVsGreedyIA(_,WinPlayer):-  gameover: gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner),WinPlayer = Winner,  displayBoard, !.
playRandomIAVsGreedyIA(Player,WinPlayer):-
        init: board(Board), % instanciate the board from the knowledge base
        displayBoard, % print it
        write('New turn for IA : '), writeln(Player),
        ia(Board, Player, IndexCol),
        isMoveValid(IndexCol, IndexRow, Board),
        playMove(Board, IndexCol, IndexRow, NewBoard, Player),
        game: applyIt(Board, NewBoard),
        game: changePlayer(Player,NextPlayer),
		%sleep(2),
        playRandomIAVsGreedyIA(NextPlayer,WinPlayer). % next turn!
		

playGreedyIAvsHuman(_,WinPlayer):-  gameover: gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner),WinPlayer = Winner,  displayBoard, !.
playGreedyIAvsHuman(Player,WinPlayer):-
        init: board(Board), % instanciate the board from the knowledge base
        displayBoard, % print it
        write('New turn for Greedy IA : '), writeln(Player),
        ia(Board, Player, IndexCol),
        isMoveValid(IndexCol, IndexRow, Board),
        playMove(Board, IndexCol, IndexRow, NewBoard, Player),
        game: applyIt(Board, NewBoard),
		displayBoard,
        game: changePlayer(Player,NextPlayer),
		write('It is your turn : '),write(NextPlayer),write(' choose a column number : '), init: readChoice(X, 0, 8),X1 is X-1,
		init: board(Board2),
		isMoveValid(X1, IndexRow1, Board2),
        playMove(Board2, X1, IndexRow1, NewBoard2, NextPlayer),
        game: applyIt(Board2, NewBoard2),
        playGreedyIAvsHuman(Player,WinPlayer). % next turn!

		
%%%% Print the value of the board at index N %%%%
%% if its a variable, print " " and X or O otherwise.
printVal(N) :- init: board(B), nth0(N,B,Val), var(Val), write('_'), write(' | '), !.
printVal(N) :- init: board(B), nth0(N,B,Val),Val='X',ansi_format([fg(red)], Val, []),  write(' | '),!.
printVal(N) :- init: board(B), nth0(N,B,Val),Val='O',ansi_format([fg(green)], Val, []),  write(' | ').

displayBoard:-
    writeln('  1   2   3   4   5   6   7   '),
    writeln('  ----------------------------'),
	write(' | '), printVal(35), printVal(36), printVal(37), printVal(38), printVal(39), printVal(40), printVal(41), writeln(''),
    writeln('  ----------------------------'),
    write(' | '), printVal(28), printVal(29), printVal(30), printVal(31), printVal(32), printVal(33), printVal(34), writeln(''),
    writeln('  ----------------------------'),
    write(' | '), printVal(21), printVal(22), printVal(23), printVal(24), printVal(25), printVal(26), printVal(27), writeln(''),
    writeln('  ----------------------------'),
	write(' | '), printVal(14), printVal(15), printVal(16), printVal(17), printVal(18), printVal(19), printVal(20), writeln(''),
    writeln('  ----------------------------'),
	write(' | '), printVal(7) , printVal(8) , printVal(9), printVal(10), printVal(11), printVal(12), printVal(13), writeln(''),
    writeln('  ----------------------------'),
    write(' | '), printVal(0) , printVal(1) , printVal(2) , printVal(3) , printVal(4) , printVal(5) , printVal(6) , writeln(''),
    writeln('  ----------------------------').
