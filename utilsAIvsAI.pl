:- module('utilsAIvsAI', []).
:- use_module('init').
:- use_module('game').
:- use_module('display').
:- use_module('gameover').


%%%% fonction play Random AI contre Random AI %%%%
playIAvsIA(_):- gameover: gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner), display: displayBoard, !.
playIAvsIA(Player):-
        write('New turn for:'), writeln(Player),
        init: board(Board), % instanciate the board from the knowledge base
        ia(Board, Move,Player), % ask the AI for a move, that is, an index for the Player
        game: playMove(Board,Move,NewBoard,Player), % Play the move and get the result in a new Board
        game: applyIt(Board, NewBoard), % Remove the old board from the KB and store the new one
        display: displayBoard, % print it
        game: changePlayer(Player,NextPlayer), % Change the player before next turn
        playIAvsIA(NextPlayer). % next turn!



%%% Verifier si la case est vide ou non:
%%% si oui => on peut jouer dans cette case,
%%% Move is 41-Index ==>
%%% r�cupere le n� correcte de la case sinon ==> on utilse le
%%% pr�dicat verif2 pour incrementer l'index par 7 et renfait verif1
verif1(Index,B,Move):- Index < 42, nth0(Index,B,Val),var(Val),Move is 41-Index;Index<42,verif2(Index,B,Move).
verif2(Index,B,Move):- Inde is Index+7, verif1(Inde,B,Move).
ia(B,Move,_) :-
        repeat,
        inv(B,R), %%% On va parcourir le board dans le sens contraire
                  %%% pour trouver la case vide qui appartient à la ligne la plus basse.
        Index1 is random(7),  % Attribution d'un numéro alétoire de colonne
        Index is 6-Index1,    % Adaptation du n°de colonne avec le board inversé.
        verif1(Index,R,Move);
        (nonvar(Move)->!).

%%%%% Inverse the board %%%%%%
append([],L,L).
append([H|T],L,[H|B]) :- append(T,L,B).
inv([],[]) :- !.
inv([A|B],R) :- inv(B,X),append(X,[A],R).
