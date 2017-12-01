:- module('minimaxAI', []).
:- use_module('gameover').
:- use_module('init').
:- use_module('game').
:- use_module('greedyAI').


playMiniMaxIAvsHuman(_,WinPlayer):-  over(Winner), !, write('Game is Over. Winner: '), writeln(Winner),WinPlayer = Winner, greedyAI: displayBoard, !.
playMiniMaxIAvsHuman(Player,WinPlayer):-
        init: board(Board), % instanciate the board from the knowledge base
        greedyAI: displayBoard, % print it
        write('New turn for MiniMax IA : '), writeln(Player),
        ia(Board, Player,2, IndexCol),
        greedyAI: isMoveValid(IndexCol, IndexRow, Board),
        greedyAI: playMove(Board, IndexCol, IndexRow, NewBoard, Player),
        game: applyIt(Board, NewBoard),
		greedyAI: displayBoard,
        game: changePlayer(Player,NextPlayer),
		write('It is your turn : '),write(NextPlayer),write(' choose a column number : '), init: readChoice(X, 0, 8),X1 is X-1,
		init: board(Board2),
		greedyAI: isMoveValid(X1, IndexRow1, Board2),
        greedyAI: playMove(Board2, X1, IndexRow1, NewBoard2, NextPlayer),
        game: applyIt(Board2, NewBoard2),
        playMiniMaxIAvsHuman(Player,WinPlayer). % next turn!

playMiniMaxIAvsRandomIA(_,WinPlayer):-  over(Winner), !, write('Game is Over. Winner: '), writeln(Winner),WinPlayer = Winner, greedyAI: displayBoard, !.
playMiniMaxIAvsRandomIA(Player,WinPlayer):-
        init: board(Board), % instanciate the board from the knowledge base
        greedyAI: displayBoard, % print it
        write('New turn for MiniMax IA : '), writeln(Player),
        ia(Board, Player,2, IndexCol),
        greedyAI: isMoveValid(IndexCol, IndexRow, Board),
        greedyAI: playMove(Board, IndexCol, IndexRow, NewBoard, Player),
        game: applyIt(Board, NewBoard),
		greedyAI: displayBoard,
        game: changePlayer(Player,NextPlayer),
		write('It is the turn for Random IA : '),writeln(NextPlayer),
		init: board(Board2),
		ia2(Board, NextPlayer, X1),
		greedyAI: isMoveValid(X1, IndexRow1, Board2),
        greedyAI: playMove(Board2, X1, IndexRow1, NewBoard2, NextPlayer),
        game: applyIt(Board2, NewBoard2),
        playMiniMaxIAvsRandomIA(Player,WinPlayer). % next turn!
		
ia2(Board, 'O', Col):-
         repeat, 
		 Col is random(7), 
		 greedyAI: isMoveValid(Col, _, Board),!.
		 					
%Heuristique
heuristiqueScore(Board, Player, Profondeur, ReScore) :-
    V is Profondeur mod 2,
    V == 0,
    heuristique(Board, Player, Score),
    game: changePlayer(Player, NextPlayer),
    heuristique(Board, NextPlayer, ScoreAdversaire),
    ReScore is (Score - ScoreAdversaire).

heuristiqueScore(Board, Adversaire, Profondeur, ReScore) :-
    V is Profondeur mod 2,
    V == 1,
    heuristique(Board, Adversaire, ScoreAdversaire),
    game: changePlayer(Adversaire, NextPlayer),
    heuristique(Board, NextPlayer, Score),
    ReScore is (Score - ScoreAdversaire).

over(Winner) :- init: board(Board), greedyAI: check4Pion(Board,Winner), !. 
over('Draw') :- init: board(Board), gameover: isBoardFull(Board). 
                         
iaImaginaire(Board, Player, Profondeur, ProfondeurMax, ReScore) :-
    Profondeur >= ProfondeurMax,
    heuristiqueScore(Board, Player, Profondeur, ReScore).

iaImaginaire(Board, Player, Profondeur, _, ReScore) :-
    greedyAI: check4Pion(Board, _),
    heuristiqueScore(Board, Player, Profondeur, ReScore).

iaImaginaire(Board, Player, Profondeur, ProfondeurMax, ReScore) :-
    V is Profondeur mod 2,
    V == 0,
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 0, Score0),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 1, Score1),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 2, Score2),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 3, Score3),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 4, Score4),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 5, Score5),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 6, Score6),

    
    ScoreList = [Score0, Score1, Score2, Score3, Score4, Score5, Score6],
    max_list(ScoreList, ReScore).    

iaImaginaire(Board, Player, Profondeur, ProfondeurMax, ReScore) :-
    V is Profondeur mod 2,
    V == 1,
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 0, Score0),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 1, Score1),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 2, Score2),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 3, Score3),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 4, Score4),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 5, Score5),
    essayerCoup(Board, Player, Profondeur, ProfondeurMax, 6, Score6),

    
    ScoreList = [Score0, Score1, Score2, Score3, Score4, Score5, Score6],
    min_list(ScoreList, ReScore).    
	
%%%  Donne le score si on essaye de jouer dans cette case %%%	   
essayerCoup(Board, Player, Profondeur, ProfondeurMax, C, Score) :-
    greedyAI: isMoveValid(C, R, Board), 
    copy_term(Board, NewBoard),
    greedyAI: playMove(NewBoard, C, R, BoardTest, Player),
    NewProfondeur is Profondeur + 1,
    game: changePlayer(Player, NextPlayer),
   	iaImaginaire(BoardTest, NextPlayer, NewProfondeur, ProfondeurMax, Score).
	
essayerCoup(_, _, Profondeur, _, _, Score) :-
    V is Profondeur mod 2,
    V == 0,
    Score = (-1000).

essayerCoup(_, _, Profondeur, _, _, Score) :-
    V is Profondeur mod 2,
    V == 1,
    Score = 1000.

	
	
%%%% Greedy IA %%%%
%%% ia greedy attaque %%%
ia(Board,'O',_,Col):-
         greedyAI: isMoveValid(Col,Row,Board), 
		 copy_term(Board, NewBoard), %%%%Create a version of In with renamed (fresh) variables and unify it to Out.
		 greedyAI: playMove(NewBoard,Col,Row,NewBoard2,'O'), 
		 greedyAI: check4Pion(NewBoard2,'O'),!.

%%% ia greedy defense %%%%
ia(Board,'O',_,Col):-
         greedyAI: isMoveValid(Col,Row,Board),
		 copy_term(Board, NewBoard), 
		 game: changePlayer('O',NextPlayer), 
		 greedyAI: playMove(NewBoard,Col,Row,NewBoard2,NextPlayer), 
		 greedyAI: check4Pion(NewBoard2,NextPlayer),!.

%%% ia greedy aléatoire %%%
ia(Board, 'O',_, Col):-
         repeat, 
		 Col is random(7), 
		 greedyAI: isMoveValid(Col, _, Board),!.


%%%%% MiniMax IA %%%%%
ia(Board, 'X', Profondeur, Column) :-

    essayerCoup(Board, Player, 0, Profondeur, 0, Score0),  %%%% recuperer le score si on joue dans la colonne 0 %%%%%
    essayerCoup(Board, Player, 0, Profondeur, 1, Score1),  %%%% recuperer le score si on joue dans la colonne 1 %%%%%
    essayerCoup(Board, Player, 0, Profondeur, 2, Score2),  %%%% recuperer le score si on joue dans la colonne 2 %%%%%
    essayerCoup(Board, Player, 0, Profondeur, 3, Score3),  %%%% recuperer le score si on joue dans la colonne 3 %%%%%
    essayerCoup(Board, Player, 0, Profondeur, 4, Score4),  %%%% recuperer le score si on joue dans la colonne 4 %%%%%
    essayerCoup(Board, Player, 0, Profondeur, 5, Score5),  %%%% recuperer le score si on joue dans la colonne 5 %%%%%
    essayerCoup(Board, Player, 0, Profondeur, 6, Score6),  %%%% recuperer le score si on joue dans la colonne 6 %%%%%
    
    ScoreList = [Score0, Score1, Score2, Score3, Score4, Score5, Score6],
    max_list(ScoreList, MaxScore),
    nth0(Column, ScoreList, MaxScore).

%%%% si on a 4 pion --> score = 200 %%%%	
heuristique(Board, Player, Score) :- greedyAI: check4Pion(Board, Player), !, Score = 200.
%%%% on calcule le score de le board actuel %%%%

heuristique(Board,Player,Score):-
    aligne3PionsC1(Board,Player, Score1),
    aligne3PionsC2(Board,Player, Score2),
    aligne3PionsR1(Board,Player, Score3),
    aligne3PionsR2(Board,Player, Score4),
    aligne3PionsD11(Board,Player, Score5),
    aligne3PionsD12(Board,Player, Score6),
    aligne3PionsD21(Board,Player, Score7),
    aligne3PionsD22(Board,Player, Score8),
    Score is min(Score1 + Score2 + Score3 + Score4 + Score5 + Score6 + Score7 + Score8, 20).
	
heuristique(_, _, Score) :- Score = 1.

%%%%% des fonctions pour vérifier l'existence de trois pions alignés dans le board %%%%%%

aligne3PionsC1(Board, P, Score) :- 
                    greedyAI: caseBoard(C1, R, Board, E1),
                    nonvar(E1),
    				P = E1,
    				C1 =< 3,
                    C2 is C1+1,
                    greedyAI: caseBoard(C2, R, Board, E2),
                    E2 == P,
                    C3 is C2+1,
                    greedyAI: caseBoard(C3, R, Board, E3),
                    E3 == P,
                    C4 is C3+1,
                    greedyAI: isMoveValid(C4, R, Board),!, 
					Score = 10. 					
aligne3PionsC1(_, _, Score) :- Score = 0.


aligne3PionsC2(Board, P, Score) :- 
                    greedyAI: caseBoard(C1, R, Board, E1),
                    nonvar(E1),
    				P = E1,
    				C1 =< 4,
    				C1 >= 1,
                    C2 is C1+1,
                    greedyAI: caseBoard(C2, R, Board, E2),
                    E2 == P,
                    C3 is C2+1,
                    greedyAI: caseBoard(C3, R, Board, E3),
                    E3 == P,
                    C4 is C1-1,
                    greedyAI: isMoveValid(C4, R, Board),!,
					Score = 10. 
aligne3PionsC2(_, _, Score) :- Score = 0.



aligne3PionsR1(Board, P, Score) :- 
                    greedyAI: caseBoard(C, R1, Board, E1),
                    nonvar(E1),
    				P = E1,
    				R1 =< 2,
                    R2 is R1+1,
                    greedyAI: caseBoard(C, R2, Board, E2),
                    E2 == P,
                    R3 is R2+1,
                    greedyAI: caseBoard(C, R3, Board, E3),
                    E3 == P,
                    R4 is R3+1,
                    greedyAI: isMoveValid(C, R4, Board),!, 
					Score = 10.
aligne3PionsR1(_, _, Score) :- Score = 0.					



aligne3PionsR2(Board, P, Score) :- 
                    greedyAI: caseBoard(C, R1, Board, E1),
                    nonvar(E1),
    				P = E1,
    				R1 =< 3,
                    R2 is R1+1,
                    greedyAI: caseBoard(C, R2, Board, E2),
                    E2 == P,
                    R3 is R2+1,
                    greedyAI: caseBoard(C, R3, Board, E3),
                    E3 == P,
                    R4 is R3-1,
                    greedyAI: isMoveValid(C, R4, Board),
    				!, 
					Score = 10. 
aligne3PionsR2(_, _, Score) :- Score = 0.



aligne3PionsD11(Board, P, Score) :- 
                    greedyAI: caseBoard(C1, R1, Board, E1),
                    nonvar(E1),
    				P = E1,
    				R1 =< 2,
    				C1 =< 3,
                    R2 is R1+1,
    				C2 is C1+1,
                    greedyAI: caseBoard(C2, R2, Board, E2),
                    E2 == P,
                    R3 is R2+1,
    				C3 is C2+1,
                    greedyAI: caseBoard(C3, R3, Board, E3),
                    E3 == P,
                    R4 is R3+1,
    				C4 is C3+1,
                    greedyAI: isMoveValid(C4, R4, Board),
    				!, 
					Score = 10.
aligne3PionsD11(_, _, Score) :- Score = 0. 					



aligne3PionsD12(Board, P, Score) :- 
                    greedyAI: caseBoard(C1, R1, Board, E1),
                    nonvar(E1),
    				P = E1,
    				R1 =< 3,
    				C1 =< 4,
                    R2 is R1+1,
    				C2 is C1+1,
                    greedyAI: caseBoard(C2, R2, Board, E2),
                    E2 == P,
                    R3 is R2+1,
    				C3 is C2+1,
                    greedyAI: caseBoard(C3, R3, Board, E3),
                    E3 == P,
                    R4 is R3-1,
    				C4 is C3-1,
                    greedyAI: isMoveValid(C4, R4, Board),
    				!, 
					Score = 10. 
aligne3PionsD12(_, _, Score) :- Score = 0.



aligne3PionsD21(Board, P, Score) :- 
                    greedyAI: caseBoard(C1, R1, Board, E1),
                    nonvar(E1),
    				P = E1,
    				R1 =< 2,
    				C1 >= 3,
                    R2 is R1+1,
    				C2 is C1-1,
                    greedyAI: caseBoard(C2, R2, Board, E2),
                    E2 == P,
                    R3 is R2+1,
    				C3 is C2-1,
                    greedyAI: caseBoard(C3, R3, Board, E3),
                    E3 == P,
                    R4 is R3+1,
    				C4 is C3-1,
                    greedyAI: isMoveValid(C4, R4, Board),
    				!, 
					Score = 10. 
aligne3PionsD21(_, _, Score) :- Score = 0.



aligne3PionsD22(Board, P, Score) :- 
                    greedyAI: caseBoard(C1, R1, Board, E1),
                    nonvar(E1),
    				P = E1,
    				R1 =< 3,
    				R1 >= 1,
    				C1 >= 2,
    				C1 =< 5,
                    R2 is R1+1,
    				C2 is C1-1,
                    greedyAI: caseBoard(C2, R2, Board, E2),
                    E2 == P,
                    R3 is R2+1,
    				C3 is C2-1,
                    greedyAI: caseBoard(C3, R3, Board, E3),
                    E3 == P,
                    R4 is R3-1,
    				C4 is C3+1,
                    greedyAI: isMoveValid(C4, R4, Board),
    				!, 
					Score = 10. 
aligne3PionsD22(_, _, Score) :- Score = 0.



playMinimaxIAvsGreedyIA(_,WinPlayer):-  over(Winner), !, write('Game is Over. Winner: '), writeln(Winner),WinPlayer = Winner, greedyAI: displayBoard, !.
playMinimaxIAvsGreedyIA(Player,WinPlayer):-
        init: board(Board), % instanciate the board from the knowledge base
        greedyAI: displayBoard, % print it
        write('New turn for IA : '), writeln(Player),
        ia(Board, Player,2,IndexCol),
        greedyAI: isMoveValid(IndexCol, IndexRow, Board),
        greedyAI: playMove(Board, IndexCol, IndexRow, NewBoard, Player),
        game: applyIt(Board, NewBoard),
        game: changePlayer(Player,NextPlayer),
		%sleep(2),
        playMinimaxIAvsGreedyIA(NextPlayer,WinPlayer).  
        
		




		

		 
