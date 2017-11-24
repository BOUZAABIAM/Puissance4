:-["Puissance4.pl"].

testSameLine :- write('sameLine'), sameLine(1,2),sameLine(40,41),not(sameLine(6,7)),not(sameLine(1,41)),writeln(' : check').

testSameItem :-  write('sameItem'), sameItem(39,40,41,42,
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','O','O','O','O'],
'O'),
sameItem(39,33,27,21,
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','O',
'a','a','a','a','a','O','a',
'a','a','a','a','O','a','a',
'a','a','a','O','a','a','a'],
'O'),
not(sameItem(39,40,41,42,
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','O','X','O','X'],
'O')), writeln(' : check').

testWinnerHorizontal :-  write('winnerHorizontal'), winnerHorizontal(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','X','X','X','X','a','a']
, 'X', 1),
winnerHorizontal(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','O','O','O','O','a','a']
, 'O', 1),
 not(winnerHorizontal(
['X','X','X','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a']
, 'X', 1)),
 not(winnerHorizontal(
['a','a','a','a','a','X','X',
'X','X','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a']
, 'X', 1)), writeln(' : check').


testWinnerVertical :- write('winnerVertical'), winnerVertical(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'X','a','a','a','a','a','a',
'X','a','a','a','a','a','a',
'X','a','a','a','a','a','a',
'X','a','a','a','a','a','a']
, 'X', 1),
not(winnerVertical(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','O','a','a','a','a','a',
'O','O','a','a','a','a','a',
'O','a','a','a','a','a','a',
'O','a','a','a','a','a','a']
, 'O', 1)), writeln(' : check').

testWinnerDiagonale1 :-  write('winnerDiagonale1'), winnerDiagonale1(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','X','a','a','a',
'a','a','X','a','X','a','a',
'a','X','a','a','a','X','a',
'X','a','a','a','a','a','X']
, 'X', 1),
winnerDiagonale1(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','X','a','a','a',
'a','a','a','a','X','a','a',
'a','a','a','a','a','X','a',
'a','a','a','a','a','a','X']
, 'X', 1),
not(winnerDiagonale1(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','X','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','X']
, 'X', 1)), writeln(' : check').

testWinnerDiagonale2 :-  write('winnerDiagonale2'), winnerDiagonale2(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','X','a','a','a',
'a','a','X','a','X','a','a',
'a','X','a','a','a','X','a',
'X','a','a','a','a','a','X']
, 'X', 1),
winnerDiagonale2(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','X','a','a','a',
'a','a','X','a','a','a','a',
'a','X','a','a','a','a','a',
'X','a','a','a','a','a','a']
, 'X', 1),
not(winnerDiagonale2(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','X','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','X']
, 'X', 1)), writeln(' : check').

testWinner :-  write('winner'), winner(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','O','O','O','O','a','a']
, 'O'),
winner(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','O','a','a','a','a','a',
'a','O','a','a','a','a','a',
'a','O','a','a','a','a','a',
'a','O','a','a','a','a','a']
, 'O'),
winner(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','O','a','a',
'a','a','a','O','a','a','a',
'a','a','O','a','a','a','a',
'a','O','a','a','a','a','a']
, 'O'),
winner(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'O','O','a','a','a','a','a',
'a','O','a','a','a','a','a',
'a','a','O','a','a','a','a',
'a','O','a','O','a','a','a']
, 'O'),
not(winner(
[_12,_13,_14,_15,_16,_17,_18,
_19,_20,_21,_25,'X',_23,_24,
'X','O',_25,_26,'O',_27,_28,
'X','X','O',_29,'O',_30,_31,
'O','O','X','X','O','O','O',
'O','O','X','O','X','X','X']
, 'O')), writeln(' : check').

testWinners :- testSameLine, testSameItem, testWinnerHorizontal, testWinnerVertical, testWinnerDiagonale1, testWinnerDiagonale2, testWinner.


testGameOverDraw :-  write('gameover draw'),
    assert(board(
           ['O','O','O','X','O','O','X',
            'O','X','X','O','X','X','O',
            'X','O','O','X','O','X','O',
            'X','X','O','X','O','X','X',
            'O','O','X','X','O','O','O',
            'O','O','X','O','X','X','X']
           )),
    gameover('Draw'),
    retractall(board(_)),
    writeln(' : check').

testGameOverWin :-  write('gameover win'),
    assert(board(
           [_12,_13,_14,_15,_16,_17,_18,
            _19,_20,_21,_25,'O',_23,_24,
            'X','O',_25,_26,'O',_27,_28,
            'X','X','O',_29,'O',_30,_31,
            'O','O','X','X','O','O','O',
            'O','O','X','O','X','X','X']
           )),
    gameover('O'),
    retractall(board(_)),
    writeln(' : check').

testIsBoardFull :- isBoardFull([]),
    isBoardFull(
            ['O','O','O','X','O','O','X',
            'O','X','X','O','X','X','O',
            'X','O','O','X','O','X','O',
            'X','X','O','X','O','X','X',
            'O','O','X','X','O','O','O',
            'O','O','X','O','X','X','X']),
   not(isBoardFull(
            ['O','O','O',_12,'O','O','X',
            'O','X','X','O','X','X','O',
            'X','O','O','X','O','X','O',
            'X','X','O','X','O','X','X',
            'O','O','X','X','O','O','O',
            'O','O','X','O','X','X','X'])).

testGameOver :- testIsBoardFull, testGameOverDraw, testGameOverWin.


allTests :- testWinners, testGameOver.
