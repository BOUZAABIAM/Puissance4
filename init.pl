:- module('init', []).
:- use_module('game').

:- dynamic board/1.



%%%%% Start the game! //TODO : replace displayBoard by play when it works
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



%%% Lire un choix qui doit Ãªtre un entier et entre le Min et le Max
readChoice(X, Min, Max) :-
    repeat,
    write('   The value must be between '), write(Min), write(' and '), write(Max), writeln(' (exclusive)'),
    readInt(X),
    X < Max,
    X > Min,
    !.
readInt(X) :-
    repeat, write('    Please enter an integer '), read(X), integer(X), !.

