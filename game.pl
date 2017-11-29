:- module('game', []).
:- use_module('utilsAIvsAI').
:- use_module('utilsHvsH').
:- use_module('utilsHvsAI').
:- use_module('utilsAIvsH').





%%% Depending of X and Y, use the right play %%%%%
playerType(X,Y):-
    (
    X=1, Y=0, utilsAIvsH: playIAVsHuman('X');
    X=1, Y=1, utilsAIvsAI: playIAvsIA('X');
    X=0, Y=0, utilsHvsH: playHumanVsHuman('X');
    X=0, Y=1, utilsHvsAI: playHumanVsIA('X')
    ).

%%%% Play a Move, the new Board will be the same, but one value will be instanciated with the Move //DONE
playMove(Board,Move,NewBoard,Player) :- Board=NewBoard,  nth0(Move,NewBoard,Player).

%%%% Remove old board/save new on in the knowledge base //DONE
applyIt(Board,NewBoard) :- retract(init: board(Board)), assert(init: board(NewBoard)).

%%%% Predicate to get the next player //DONE
changePlayer('X','O').
changePlayer('O','X').
