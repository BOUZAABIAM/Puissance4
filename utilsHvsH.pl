:- module('utilsHvsH', []).
:- use_module('init').
:- use_module('game').
:- use_module('display').
:- use_module('gameover').


%%%%% fonction play pour un human contre un human %%%%%%
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

%%%% fonction qui donne la bonne case vide dans la colonne choisie par le player human %%%%%
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

%%% Verifier si la case est vide ou non:
%%% si oui => on peut jouer dans cette case, %%% Move is 41-Index ==> rÃ©cupere le nÂ° correcte de la case
%%% sinon ==> on utilse le prÃ©dicat verif2 pour incrementer l'index par 7 et renfait verif1
verif1(Index,B,Move):- Index < 42, nth0(Index,B,Val),var(Val),Move is 41-Index;Index<42,verif2(Index,B,Move).
verif2(Index,B,Move):- Inde is Index+7, verif1(Inde,B,Move).
