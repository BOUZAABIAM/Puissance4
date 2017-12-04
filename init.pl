:- module('init', []).
:- use_module('game').
:- use_module('greedyAI').
:- use_module('minimaxAI').

:- dynamic board/1.



%%%%% Start the game!
init :-
        retractall(board(_)),
        length(Board,42),
        assert(board(Board)),
        writeln('What is the type of the first player which will use the symbol X ?'),
        writeln('  - 0 : for a human player .'),writeln('  - 1 : for a RandomAI player .'),writeln('  - 2 : for a GreedyAI player .'),writeln('  - 3 : for a MiniMaxAI player .'),
        readChoice(Player1, -1, 4),
        writeln('What is the type of the second player which will use the symbol O ?'),
        writeln('  - 0 : for a human player .'),writeln('  - 1 : for a RandomAI player .'),writeln('  - 2 : for a GreedyAI player .'),
        readChoice(Player2, -1, 3),
        game: playerType(Player1,Player2).
        
%%%%% lancer n parties et donner les statistics à la fin %%%%%
nParties:-		
        retractall(board(_)),
        length(Board,42),
        assert(board(Board)),
        writeln('You will start N parties, Choose a numbre N : '),
		readChoice(N, -1, 31),
		writeln('Which type of parties you want to start : '),
		writeln('  - 1 : GreedyIA vs RandomIA .'),writeln('  - 2 : MinimaxIA vs GreedyIA .'),
		readChoice(Type, 0, 3),
		playNParties(0,N,0,Type).

%%%% If X wins, we increment the numbre of win else no %%%%		
winner('X',WinX, NewWin):-
	NewWin is WinX + 1.	
winner('O',WinX, NewWin):-
	NewWin is WinX.
%%%%% In case of draw %%%%
winner('Draw',WinX, NewWin):-
	NewWin is WinX.
	
%%%% Play N parties and do statistics %%%%%
playNParties(NActu,N,WinX,Type):-
    NActu>=N,!;
    NActu<N,
    NewNActu is NActu + 1,writeln(NewNActu),
    pl(Type,X),
    winner(X,WinX,NewWin),
	write('----> The first player wins '),write(NewWin),write('/'),write(N),writeln(' .'),
    write('----> Percentage : '),D is NewWin*100/N,write(D),writeln(' %'),
    playNParties(NewNActu,N,NewWin, Type).
		
	
pl(Type,Win):-
         retractall(board(_)),
         length(Board,42), assert(board(Board)), 
         (
		 Type=2, minimaxAI: playMinimaxIAvsGreedyIA('X',Win);
	     Type=1, greedyAI: playRandomIAVsGreedyIA('X',Win)
		 
         ).


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

