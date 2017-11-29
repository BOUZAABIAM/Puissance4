:- module('gameover', []).
:- use_module('init').


%%%% Test is the game is finished %%% //DONE
gameover(Winner) :- init: board(Board), winner(Board,Winner), !.  % There exists a winning configuration: We cut!
gameover('Draw') :- write(' 1 '),init: board(Board),write(' 2 '), isBoardFull(Board),write(' 1 '). % the Board is fully instanciated (no free variable): Draw.

%%%% Test if a Board is a winning configuration for the player P. //TODO

sameLine(A, B) :- M1 is div(A, 7), M2 is div(B, 7), M1 =:= M2. %true if index A and B are on the same line
%%%%sameItem : true if the elements at the A, B, C and D index of theboard are P

sameItem(A, B, C, D, Board, P):-  nth1(A, Board, Q), nth1(B, Board, R),nth1(C, Board, S),nth1(D, Board, P),nonvar(Q), nonvar(R), nonvar(S), Q == P, R == P, S == P.


winnerHorizontal(Board, P, N):- N < 40, N1 is N+1, N2 is N+2, N3 is N+3, sameLine(N, N3), sameItem(N, N1, N2, N3, Board, P), !.
winnerHorizontal(Board, P, N):- N < 39,  N1 is N+1, winnerHorizontal(Board, P, N1).
winnerVertical(Board, P, N):- N < 22, N1 is N+7, N2 is N+14, N3 is N+21, sameItem(N, N1, N2, N3, Board, P), !.
winnerVertical(Board, P, N):- N < 21,  Next is N+1, winnerVertical(Board, P, Next).
winnerDiagonale1(Board, P, N):-  N < 19, N1 is N+8, N2 is N1+8, N3 is N2+8, sameItem(N, N1, N2, N3, Board, P),  !.
winnerDiagonale1(Board, P, N):- N < 18, Next is N+1, winnerDiagonale1(Board, P, Next).
winnerDiagonale2(Board, P, N):- N < 22, N1 is N+6, N2 is N1+6, N3 is N2+6,sameItem(N, N1, N2, N3, Board, P),!.
winnerDiagonale2(Board, P, N):- N < 21, Next is N+1, winnerDiagonale2(Board, P, Next).

winner(Board, P):- winnerHorizontal(Board, P, 1).
winner(Board, P):- winnerVertical(Board, P, 1).
winner(Board, P):- winnerDiagonale1(Board, P, 1).
winner(Board, P):- winnerDiagonale2(Board, P, 4).


%%%% Recursive predicate that checks if all the elements of the List (a board)  //DONE
%%%% are instanciated: true e.g. for [x,x,o,o,x,o,x,x,o] false for [x,x,o,o,_G125,o,x,x,o]
isBoardFull([]).
isBoardFull([H|T]):- nonvar(H), isBoardFull(T).
