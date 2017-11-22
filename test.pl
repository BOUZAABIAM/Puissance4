:-["Puissance4.pl"].

%['a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a']

testWinnerHorizontal :- winnerHorizontal(
['X','X','X','X','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a']
, 'X', 1),
winnerHorizontal(
['a','a','a','a','a','a','a','a','X','X','X','X','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a']
, 'X', 1),
 not(winnerHorizontal(
['X','X','X','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a']
, 'X', 1)),
 not(winnerHorizontal(
['a','a','a','a','a','X','X','X','X','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a']
, 'X', 1)).
%testWinnerVertical :- winnerVertical(Board, P, N).
%testWinnerDiagonale1 :- winnerDiagonale1(Board, P, N).
%testWinnerDiagonale2 :- winnerDiagonale2(Board, P, N).