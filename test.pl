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
['a','a','a','a','a','a','a',
'a','a','a','a','X','a','a',
'X','O','a','a','O','a','a',
'X','X','O','a','O','a','a',
'O','O','X','X','O','O','O',
'O','O','X','O','X','X','X']
, 'O')), writeln(' : check').

testWinners :- testSameLine, testSameItem, testWinnerHorizontal, testWinnerVertical, testWinnerDiagonale1, testWinnerDiagonale2, testWinner.

allTests :- testWinners.
