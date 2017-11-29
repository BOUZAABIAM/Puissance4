:- module('utilsHvsH', []).
:- use_module('init').
:- use_module('game').
:- use_module('display').
:- use_module('gameover').


%%%%% fonction play for an human vs an human %%%%%%
playHumanVsHuman(_):- gameover: gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner), display: displayBoard, !.
playHumanVsHuman(Player):-
        init: board(Board), % instanciate the board from the knowledge base
        display: displayBoard, % print it
        write('It the turn for: '),write(Player),write(' choose a column number : '), init: readChoice(X, 0, 8),X1 is X-1,
        human(Board,X1, MoveH1,Player),
        game: playMove(Board,MoveH1,NewBoard,Player),
        game: applyIt(Board, NewBoard),
        display: displayBoard,
        game: changePlayer(Player,NextPlayer),
        write('It the turn for: '),write(NextPlayer),write(' choose a column number : '), init: readChoice(X2, 0, 8),X3 is X2-1,
        init: board(Board2),
        human(Board2,X3, MoveH2,NextPlayer),
        game: playMove(Board2,MoveH2,NewBoard2,NextPlayer),
        game: applyIt(Board2, NewBoard2),
        game: changePlayer(NextPlayer,Player),
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
