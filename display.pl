:- module('display', []).
:- use_module('init').
:- use_module('game').
:- [color].



%%%% Print the value of the board at index N %%%%
%% if its a variable, print " " and X or O otherwise.
printVal(N) :- init: board(B), nth0(N,B,Val), var(Val), write('_'), write(' | '), !.
printVal(N) :- init: board(B), nth0(N,B,Val),Val='X',ansi_format([fg(red)], Val, []),  write(' | '),!.
printVal(N) :- init: board(B), nth0(N,B,Val),Val='O',ansi_format([fg(green)], Val, []),  write(' | ').

%%%% Display the board //DONE
displayBoard:-
    writeln('  1   2   3   4   5   6   7   '),
    writeln('  ---------------------------------'),
    write(' | '), printVal(0) , printVal(1) , printVal(2) , printVal(3) , printVal(4) , printVal(5) , printVal(6) , writeln(''),
    writeln('  ---------------------------------'),
    write(' | '), printVal(7) , printVal(8) , printVal(9), printVal(10), printVal(11), printVal(12), printVal(13), writeln(''),
    writeln('  ---------------------------------'),
    write(' | '), printVal(14), printVal(15), printVal(16), printVal(17), printVal(18), printVal(19), printVal(20), writeln(''),
    writeln('  ---------------------------------'),
    write(' | '), printVal(21), printVal(22), printVal(23), printVal(24), printVal(25), printVal(26), printVal(27), writeln(''),
    writeln('  ---------------------------------'),
    write(' | '), printVal(28), printVal(29), printVal(30), printVal(31), printVal(32), printVal(33), printVal(34), writeln(''),
    writeln('  ---------------------------------'),
    write(' | '), printVal(35), printVal(36), printVal(37), printVal(38), printVal(39), printVal(40), printVal(41), writeln(''),
    writeln('  ---------------------------------').
