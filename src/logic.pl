start_game :-
  initTab(InitialTab),
  InitialTab = Tab-Player,
  display_game(Tab),
  traduz(Player, P),
  write('\nPLAYER'), write(P) , write(' TURN\n'),
  game_cycle(InitialTab).
												/*Ver casos de condicoes em que um dos casos tem so uma ou duas linhas e meter noutra func com o mesmo nome*/
game_cycle(CurrentTab) :-
  (choose_option(Option),
  CurrentTab = Tab-Player,
  choose_cells(Tab, Option, Move, Player),
  move(Move, Tab, Player, NewTab),!,
  display_game(NewTab), !,
  \+(game_over(NewTab-Player, Winner))) ->				/*FAZER CONDICAO DE EMPATE*/
   (((Player=:=1 -> NextPlayer is 2); NextPlayer is 1),
   traduz(NextPlayer, P),
   write('\nPLAYER'), write(P) , write(' TURN\n'),
   game_cycle(NewTab-NextPlayer));
  (write('End of the game. The winner is PLAYER '), traduz(Winner, W), write(W)).
  
choose_option(Option) :-
  write('\nChoose an option:\n 1: Place a new piece\n 2: Move an existing piece\nOption: '),
  get_char(Option),		%aqui, fazer get_char com peek, se o user meter 1.1, com o peek ve-se se a seguir ao primeiro char vem newline ou nao (se nao vier, dar a msg de erro)
  skip_line, write(Option),
  (Option==1;Option==2);
  (write('Choose a valid option!\n\n'),
  choose_option(Option)).
  
/*place new player piece*/
choose_cells(Tab, 1, Move, _Player) :- 
  write('\nType the coordinates of an empty cell:\n'),
  write('Line [A-I]: '),
  get_char(NewLetter),
  skip_line,
  letter(NewLine, NewLetter),
  write('Column [1-9]: '),
  get_char(NewColumn),
  skip_line,
  check_cell(Tab, 1, Move, 0, NewLine, NewColumn),		%check if cell is empty
  (Move = NewLine+NewColumn; Move = _X+_Y).				%check if move is already defined
  
/*move existing player piece*/
choose_cells(Tab, 2, Move, Player) :- 
  write('\nType the coordinates of the piece to move:\n'),
  write('Line [A-I]: '),
  get_char(Letter),
  skip_line,
  letter(Line, Letter),
  write('Column [1-9]: '),
  get_char(Column),
  skip_line,
  check_cell(Tab, 2, Move, Player, Line, Column),		%check if the piece on this cell belongs to the player
  write('\nType the coordinates to where the piece should move:\n'),
  write('Line [A-I]: '),
  get_char(NewLetter),
  skip_line,
  letter(NewLine, NewLetter),
  write('Column [1-9]: '),
  get_char(NewColumn),
  skip_line,
  check_cell(Tab, 2, Move, 0, NewLine, NewColumn),			%check if cell is empty
  neighbour_cell(Tab, Move, Line, Column, NewLine, NewColumn, Player),
  (Move = Line+Column-NewLine+NewColumn; Move = _X+_Y-_A+_B).	%check if move is already defined
  
move(Move, Board, Player, NewBoard) :-
  (Move = X+Y-A+B,										%move piece from X,Y to A,B
  insert_value(Board, AuxBoard, 0, X, Y),				%empty the original cell
  insert_value(AuxBoard, NewBoard, Player, A, B));		
  (Move = A+B,											%place new piece on cell A,B
  insert_value(Board, NewBoard, Player, A, B)).			
 
/*check is the player's move made him or the opponent lose*/ 
game_over(Board, Winner) :-
  Board = Tab-Player,
  (Player =:= 1,
   ((has_pieces_surrounded(Tab, 1, 1, 1) -> Winner is 2);
    (has_pieces_surrounded(Tab, 1, 1, 2) -> Winner is 1));
  (Player =:= 2,
    ((has_pieces_surrounded(Tab, 1, 1, 2) -> Winner is 1);
	 (has_pieces_surrounded(Tab, 1, 1, 1) -> Winner is 2)))).
  
/*check if a player has pieces that can't move*/
has_pieces_surrounded(Tab, Line, Column, Player) :-
  length(Tab, LineLength),
  Line =< LineLength,
  AuxColumn is Column + 1,
  (valid_cell(Tab, Line, AuxColumn) ->
   (NextLine is Line, NextColumn is Column + 1);
   (NextLine is Line + 1, NextColumn is 1)), !,
  (\+(valid_player_piece(Tab, Player, Line, Column)) ->		%if piece doesn't belong to the player, advance to next cell
   has_pieces_surrounded(Tab, NextLine, NextColumn, Player);
  ((surrounding_cells(Tab, Line, Column, Cells, 6), !,			
   \+(none_empty(Tab, Cells))) ->
    has_pieces_surrounded(Tab, NextLine, NextColumn, Player); true)).
  
none_empty(_Tab, []).  
  
/*check if all the cells in the list have a piece*/
none_empty(Tab, [H|T]) :-
  H = Line+Column,
  \+(valid_player_piece(Tab, 0, Line, Column)),		%not empty
  none_empty(Tab, T).

/*check if a cell is neighbour of another cell*/
neighbour_cell(Tab, Move, Line, Column, NewLine, NewColumn, Player) :-
  (surrounding_cells(Tab, Line, Column, Cells, 6),					%get a list of the surrounding cells, maximum of 6
  select(NewLine+NewColumn, Cells, _Residue));						%check if the cell on (NewLine,NewColumn) belongs to the calculated list
  (write('This cell is not a neighbour of the previous one!\n'),
  choose_cells(Tab, 2, Move, Player)).
  
surrounding_cells(_Tab, _Line, _Column, _Cells, 0).
  
/*calculate and save on a list the coordinates (format X+Y) of the cells surrounding a certain cell*/
surrounding_cells(Tab, Line, Column, Cells, MaxCells) :-
  ((MaxCells =:= 6,				%test the cell on the left
    TestLine is Line,
    TestColumn is Column - 1);
   (MaxCells =:= 5,				%test the cell on the right
    TestLine is Line,
    TestColumn is Column + 1);
   (MaxCells =:= 4,				%test one cell on the top
    TestLine is Line - 1,
    TestColumn is Column);
   (MaxCells =:= 3,				%test one cell on the bottom
    TestLine is Line + 1,
    TestColumn is Column);
   (MaxCells < 3,				%test the other cells (another top, another bottom)
    ((Line =:= 5,
     ((MaxCells =:= 2,
       TestLine is Line - 1,
       TestColumn is Column - 1);
      (MaxCells =:= 1,
       TestLine is Line + 1,
       TestColumn is Column - 1)));
	(Line < 5,
     ((MaxCells =:= 2,
       TestLine is Line - 1,
       TestColumn is Column - 1);
      (MaxCells =:= 1,
       TestLine is Line + 1,
       TestColumn is Column + 1))); 
	(Line > 5,
      ((MaxCells =:= 2,
       TestLine is Line - 1,
       TestColumn is Column + 1);
      (MaxCells =:= 1,
       TestLine is Line + 1,
       TestColumn is Column - 1)))))),
  NextMax is MaxCells - 1,
  ((valid_cell(Tab, TestLine, TestColumn) ->
   surrounding_cells(Tab, Line, Column, AddCells, NextMax),
   append(AddCells, [TestLine+TestColumn], Cells));
  (surrounding_cells(Tab, Line, Column, AddCells, NextMax),
   append(AddCells, [], Cells))).

/*check if cell exists and is available*/
check_cell(Tab, Option, Move, Player, Line, Column) :- 
  (valid_cell(Tab, Line, Column)
  ->
  (valid_player_piece(Tab, Player, Line, Column);							
  (write('The piece in this cell does not belong to this player!\n'),
  choose_cells(Tab, Option, Move, Player))));
  (write('Invalid cell position!\n'),
  choose_cells(Tab, Option, Move, Player)).

/*cell within the limits of the board*/  
valid_cell(Tab, Line, Column) :-  
  valid_line(Tab, Line, LineList),
  !,
  valid_column(LineList, Column).
  
valid_line(Tab, Line, LineList) :-
  length(Tab, Value),
  Line >= 1,
  Line =< Value,
  !,
  get_line_list(Tab, Line, LineList).
  
valid_column(LineList, Column) :-
  length(LineList, Value),
  Column >= 1,
  Column =< Value.
  
/*check if piece in (Line, Column) belongs to Player*/
valid_player_piece(Tab, Player, Line, Column) :-
  get_line_list(Tab, Line, LineList),
  get_value(LineList, Column, Value),
  Value =:= Player.
  
/*get list from matrix*/
get_line_list([H|_T], 1, H).

get_line_list([_H|T], Line, LineList) :-
  Line > 1,
  NextLine is Line - 1,
  get_line_list(T, NextLine, LineList).

/*get value from list*/
get_value([H|_T], 1, Value) :-
    Value = H.
	
get_value([_H|T], Index, Value) :-
  Index > 1,
  NextIndex is Index - 1,
  get_value(T, NextIndex, Value).

/*insert player symbol on the board*/
insert_value([H|T], [NewH|T], Player, 1, Column) :-
  insert_in_list(H, NewH, Player, Column).

insert_value([H|T], [H|NewT], Player, Line, Column) :-
  Line > 1,
  NextLine is Line - 1,
  insert_value(T, NewT, Player, NextLine, Column).
  
/*insert value in a list*/
insert_in_list([_H|T], [Player|T], Player, 1).
insert_in_list([H|T], [H|NewT], Player, Index) :-
    Index > 1,
    NextIndex is Index - 1,
    insert_in_list(T, NewT, Player, NextIndex).
	
