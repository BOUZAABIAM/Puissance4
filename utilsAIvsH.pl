:- module('utilsAIvsH', []).
:- use_module('init').
:- use_module('game').
:- use_module('display').
:- use_module('gameover').
:- use_module('utilsHvsH').
:- use_module('utilsAIvsAI').





%%%%% fonction play for an AI vs human %%%%%%
playIAVsHuman(_):- gameover: gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner), display: displayBoard, !.
playIAVsHuman(Player):-
        init: board(Board), % instanciate the board from the knowledge base
        display: displayBoard, % print it
        write('New turn for IA : '), writeln(Player),
        utilsAIvsAI: ia(Board, Move,Player),
        game: playMove(Board,Move,NewBoard,Player),
        game: applyIt(Board, NewBoard),
        display: displayBoard,
        game: changePlayer(Player,NextPlayer),
        write('It is your turn : '),write(NextPlayer),write(' choose a column number : '), init: readChoice(X, 0, 8),X1 is X-1,
        init: board(Board2),
        utilsHvsH: human(Board2,X1, MoveH,NextPlayer),
        game: playMove(Board2,MoveH,NewBoard2,NextPlayer),
        game: applyIt(Board2, NewBoard2),
        game: changePlayer(NextPlayer,Player),
        playIAVsHuman(Player). % next turn!
