:- module('game', []).
:- use_module('init').
:- use_module('utilsAIvsAI').
:- use_module('utilsHvsH').
:- use_module('utilsHvsAI').
:- use_module('utilsAIvsH').
:- use_module('greedyAI').
:- use_module('minimaxAI').





%%% Depending of X and Y, use the right play %%%%%
playerType(X,Y):-
    (
    X=1, Y=0, utilsAIvsH: playIAVsHuman('X');
    X=1, Y=1, utilsAIvsAI: playIAvsIA('X');
    X=0, Y=0, utilsHvsH: playHumanVsHuman('X');
    X=0, Y=1, utilsHvsAI: playHumanVsIA('X');
    X=2, Y=1, greedyAI: playRandomIAVsGreedyIA('X',Win),writeln(''),write('Winner is '),writeln(Win);
	X=2, Y=0, greedyAI: playGreedyIAvsHuman('X',Win),writeln(''),write('Winner is '),writeln(Win);
	X=3, Y=2, minimaxAI: playMinimaxIAvsGreedyIA('X',Win),writeln(''),write('Winner is '),writeln(Win);
	X=3, Y=1, minimaxAI: playMiniMaxIAvsRandomIA('X',Win),writeln(''),write('Winner is '),writeln(Win);
	X=3, Y=0, minimaxAI: playMiniMaxIAvsHuman('X',Win),writeln(''),write('Winner is '),writeln(Win)
    ).

%%%% Play a Move, the new Board will be the same, but one value will be instanciated with the Move
playMove(Board,Move,NewBoard,Player) :- Board=NewBoard,  nth0(Move,NewBoard,Player).

%%%% Remove old board/save new on in the knowledge base/
applyIt(Board,NewBoard) :- retract(init: board(Board)), assert(init: board(NewBoard)).

%%%% Predicate to get the next player 
changePlayer('X','O').
changePlayer('O','X').
