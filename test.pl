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
, 'X', 1)).


testWinnerVertical :- winnerVertical(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'X','a','a','a','a','a','a',
'X','a','a','a','a','a','a',
'X','a','a','a','a','a','a',
'X','a','a','a','a','a','a']
, 'X', 1),not(winnerVertical(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','O','a','a','a','a','a',
'O','O','a','a','a','a','a',
'O','a','a','a','a','a','a',
'O','a','a','a','a','a','a']
, 'O', 1))
.

%testWinnerDiagonale1 :- winnerDiagonale1(Board, P, N).
%testWinnerDiagonale2 :- winnerDiagonale2(Board, P, N).