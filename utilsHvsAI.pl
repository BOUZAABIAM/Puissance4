:- module('utilsHvsAI', []).
:- use_module('init').
:- use_module('game').
:- use_module('display').
:- use_module('gameover').
:- use_module('utilsHvsH').
:- use_module('utilsAIvsAI').

%%%%% fonction play pour un human contre Random AI %%%%%%
playHumanVsIA(_):- gameover: gameover(Winner), !, write('Game is Over. Winner: '), writeln(Winner), display: displayBoard, !.
playHumanVsIA(Player):-
        init: board(Board), % instanciate the board from the knowledge base
        display: displayBoard, % print it
        write('It is your turn : '),write(Player),write(' choose a column number : '), init: readChoice(X, 0, 8),X1 is X-1,
        utilsHvsH: human(Board,X1, MoveH,Player),
        game: playMove(Board,MoveH,NewBoard,Player),
        game: applyIt(Board, NewBoard),
        display: displayBoard,
        game: changePlayer(Player,NextPlayer),
        write('New turn for IA : '), writeln(NextPlayer),
        init: board(Board2),
        utilsAIvsAI: ia(Board2, Move,NextPlayer),
        game: playMove(Board2,Move,NewBoard2,NextPlayer),
        game: applyIt(Board2, NewBoard2),
        game: changePlayer(NextPlayer,Player),
        playHumanVsIA(Player). % next turn!
