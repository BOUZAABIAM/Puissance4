:- module('init', []).
:- use_module('game').

:- dynamic board/1.



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

