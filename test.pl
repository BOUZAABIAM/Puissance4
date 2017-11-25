:-["display.pl","game.pl", "gameover.pl", "utilsAIvsAi.pl", "utilsAIvsH.pl", "utilsHvsAi.pl", "utilsHvsH.pl", "init.pl"].

testSameLine :- write('sameLine'), gameover : sameLine(1,2),gameover : sameLine(40,41),not(gameover : sameLine(6,7)),not(gameover : sameLine(1,41)),writeln(' : check').

testSameItem :-  write('sameItem'), gameover : sameItem(39,40,41,42,
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,_18,_19,_20,_21,
 _22,_23,_24,_25,_26,_27,_28,
 _29,_30,_31,_32,_33,_34,_35,
 _36,_37,_38,'O','O','O','O'],
'O'),
gameover : sameItem(39,33,27,21,
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,_18,_19,_20,'O',
 _22,_23,_24,_25,_26,'O',_28,
 _29,_30,_31,_32,'O',_34,_35,
 _36,_37,_38,'O',_40,_41,_42],
'O'),
not(gameover : sameItem(39,40,41,42,
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,_18,_19,_20,_21,
 _22,_23,_24,_25,_26,_27,_28,
 _29,_30,_31,_32,_33,_34,_35,
 _36,_37,_38,'O','X','O','X'],
'O')), writeln(' : check').

testWinnerHorizontal :-  write('winnerHorizontal'), gameover : winnerHorizontal(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','X','X','X','X','a','a']
, 'X', 1),
gameover : winnerHorizontal(
['a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','O','O','O','O','a','a']
, 'O', 1),
 not(gameover : winnerHorizontal(
['X','X','X','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a']
, 'X', 1)),
 not(gameover : winnerHorizontal(
['a','a','a','a','a','X','X',
'X','X','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a',
'a','a','a','a','a','a','a']
, 'X', 1)), writeln(' : check').

testWinnerVertical :- write('winnerVertical'), gameover : winnerVertical(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 'X',_16,_17,_18,_19,_20,_21,
 'X',_23,_24,_25,_26,_27,_28,
 'X',_30,_31,_32,_33,_34,_35,
 'X',_37,_38,_39,_40,_41,_42]
, 'X', 1),
not(gameover : winnerVertical(
[_01,_02,_03,_04,_05,_06,_07,
 _08,'O',_10,_11,_12,_13,_14,
 _15,'O',_17,_18,_19,_20,_21,
 'O',_23,_24,_25,_26,_27,_28,
 'O',_30,_31,_32,_33,_34,_35,
 'O',_37,_38,_39,_40,_41,_42]
, 'O', 1)), writeln(' : check').

testWinnerDiagonale1 :-  write('winnerDiagonale1'), gameover : winnerDiagonale1(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,'X',_19,_20,_21,
 _22,_23,'X',_25,'X',_27,_28,
 _29,'X',_31,_32,_33,'X',_35,
 'X',_37,_38,_39,_40,_41,'X']
, 'X', 1),
gameover : winnerDiagonale1(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,'X',_19,_20,_21,
 _22,_23,_24,_25,'X',_27,_28,
 _29,_30,_31,_32,_33,'X',_35,
 _36,_37,_38,_39,_40,_41,'X']
, 'X', 1),
not(gameover : winnerDiagonale1(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,'O',_19,_20,_21,
 _22,_23,_24,_25,'X',_27,_28,
 _29,_30,_31,_32,_33,'O',_35,
 _36,_37,_38,_39,_40,_41,'X']
, 'X', 1)), writeln(' : check').

testWinnerDiagonale2 :-  write('winnerDiagonale2'), gameover : winnerDiagonale2(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,'X',_19,_20,_21,
 _22,_23,'X',_25,'X',_27,_28,
 _29,'X',_31,_32,_33,'X',_35,
 'X',_37,_38,_39,_40,_41,'X']
, 'X', 1),
gameover : winnerDiagonale2(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,'X',_19,_20,_21,
 _22,_23,'X',_25,_26,_27,_28,
 _29,'X',_31,_32,_33,_34,_35,
 'X',_37,_38,_39,_40,_41,_42]
, 'X', 1),
not(gameover : winnerDiagonale2(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,'X',_19,_20,_21,
 _22,_23,'X',_25,_26,_27,_28,
 _29,'O',_31,_32,_33,_34,_35,
 'X',_37,_38,_39,_40,_41,_42]
, 'O', 1)), writeln(' : check').

testWinner :-  write('winner'), gameover : winner(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,_18,_19,_20,_21,
 _22,_23,_24,_25,_26,_27,_28,
 _29,_30,_31,_32,_33,_34,_35,
 _36,'X','X','X','X',_41,_42]
, 'X'),
gameover : winner(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 'X',_16,_17,_18,_19,_20,_21,
 'X',_23,_24,_25,_26,_27,_28,
 'X',_30,_31,_32,_33,_34,_35,
 'X',_37,_38,_39,_40,_41,_42]
, 'X'),
gameover : winner(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,'X',_19,_20,_21,
 _22,_23,'X',_25,_26,_27,_28,
 _29,'X',_31,_32,_33,_34,_35,
 'X',_37,_38,_39,_40,_41,_42]
, 'X'),
gameover : winner(
[_01,_02,_03,_04,_05,_06,_07,
 _08,_09,_10,_11,_12,_13,_14,
 _15,_16,_17,'X',_19,_20,_21,
 _22,_23,_24,_25,'X',_27,_28,
 _29,_30,_31,_32,_33,'X',_35,
 _36,_37,_38,_39,_40,_41,'X']
, 'X'),
not(gameover : winner(
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
    gameover : gameover('Draw'),
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
    gameover : gameover('O'),
    retractall(gameover : board(_)),
    writeln(' : check').

testIsBoardFull :-  write('isBoardFull'),gameover : isBoardFull([]),
   gameover : isBoardFull(
            ['O','O','O','X','O','O','X',
            'O','X','X','O','X','X','O',
            'X','O','O','X','O','X','O',
            'X','X','O','X','O','X','X',
            'O','O','X','X','O','O','O',
            'O','O','X','O','X','X','X']),
   not(gameover : isBoardFull(
            ['O','O','O',_12,'O','O','X',
            'O','X','X','O','X','X','O',
            'X','O','O','X','O','X','O',
            'X','X','O','X','O','X','X',
            'O','O','X','X','O','O','O',
            'O','O','X','O','X','X','X'])),
   writeln(' : check').

testgameOver :- testIsBoardFull, testGameOverDraw, testGameOverWin.

testInv :-  write('inv'),utilsAIvsAI : inv([],[]), utilsAIvsAI : inv([1,2],[2,1]), utilsAIvsAI : inv([1,2,3,4],[4,3,2,1]),
 writeln(' : check').

testPlayIAvsIA :-  write('playIAvsIA'),
     writeln(' : check').


testPlay :- testPlayIAvsIA.


allTests :- testWinners, testgameOver, testInv, testPlay.
