:-["Puissance4.pl"].

testWinnerHorizontal :- winnerHorizontal(
['X','X','X','X','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a']
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
, 'X', 1)), writeln('winnerHorizontal : check').


testWinnerVertical :- winnerVertical(
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
, 'O', 1)), writeln('winnerVertical : check').

testWinnerDiagonale1 :- winnerDiagonale1(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','X','a','a','a',
'a','a','X','a','X','a','a',
'a','X','a','a','a','X','a',
'X','a','a','a','a','a','X']
, 'X', 1), writeln('winnerDiagonale1 : check').


%testWinnerDiagonale2 :- winnerDiagonale2(Board, P, N).

testWinner :- testWinnerHorizontal, testWinnerVertical.

