start_game :-
  display_menu.


pvp_game:-
  initTab(InitialTab),
  display_game(InitialTab),
  game_cycle(InitialTab).

game_cycle(CurrentTab) :-
  ((playerX(CurrentTab, FirstNewTab),
  check_game_state(FirstNewTab),
  !,
  ((playerO(FirstNewTab, SecondNewTab),
  check_game_state(SecondNewTab),
  !,
  game_cycle(SecondNewTab));
  write('End of the game\n')));
  write('End of the game\n')).

/*Player X turn*/
playerX(CurrentTab, FirstNewTab) :-
  write('Choose an option:\n 1: Place a new piece\n 2: Move an existing piece\nOption: '),
  read(Option),
  moveX(CurrentTab, Option, FirstNewTab),
  display_game(FirstNewTab).

/*Player O turn*/
playerO(FirstNewTab, SecondNewTab) :-
  write('Choose an option:\n 1: Place a new piece\n 2: Move an existing piece\nOption: '),
  read(Option),
  moveO(FirstNewTab, Option, SecondNewTab),
  display_game(SecondNewTab).

/*place new player X piece*/
moveX(Tab, 1, NewTab) :-
  write('\nType the coordinates of an empty cell:\n'),
  write('Line [A-I]: '),
  read(NewLetter),
  letter(NewLine, NewLetter),
  write('Column [1-9]: '),
  read(NewColumn),
  (place_piece(Tab, NewTab, 1, NewLine, NewColumn);		/*MUDAR ESTE "OU"*/
  moveX(Tab, 1, NewTab)).

/*move existing player X piece*/
moveX(Tab, 2, NewTab) :-
  write('\nType the coordinates of the piece to move:\n'),
  write('Line [A-I]: '),
  read(Letter),
  letter(Line, Letter),
  write('Column [1-9]: '),
  read(Column),
  (choose_piece(Tab, NewTab, 1, Line, Column);
  moveX(Tab, 2, NewTab)),
  !,
  write('\nType the coordinates to where the piece should move:\n'),
  write('Line [A-I]: '),
  read(NewLetter),
  letter(NewLine, NewLetter),
  write('Column [1-9]: '),
  read(NewColumn),
  (place_piece(Tab, NewTab, 1, NewLine, NewColumn);
  moveX(Tab, 2, NewTab)).

/*place new player O piece*/
moveO(Tab, 1, NewTab) :-
  write('\nType the coordinates of an empty cell:\n'),
  write('Line [A-I]: '),
  read(NewLetter),
  letter(NewLine, NewLetter),
  write('Column [1-9]: '),
  read(NewColumn),
  (place_piece(Tab, NewTab, 2, NewLine, NewColumn);
  moveO(Tab, 1, NewTab)).

/*move existing player O piece*/
moveO(Tab, 2, NewTab) :-
  write('\nType the coordinates of the piece to move:\n'),
  write('Line [A-I]: '),
  read(Letter),           %só aceita a letra entre plicas
  letter(Line, Letter),
  write('Column [1-9]: '),
  read(Column),
  (choose_piece(Tab, NewTab, 2, Line, Column);
  moveO(Tab, 2, NewTab)),
  !,
  write('\nType the coordinates to where the piece should move:\n'),
  write('Line [A-I]: '),
  read(NewLetter),
  letter(NewLine, NewLetter),
  write('Column [1-9]: '),
  read(NewColumn),
  (place_piece(Tab, NewTab, 2, NewLine, NewColumn);
  moveO(Tab, 2, NewTab)).

check_game_state(Tab).	%ainda não está implementado

/*place piece in new place*/
place_piece(Tab, NewTab, Player, Line, Column) :-
  ((valid_cell(Tab, Line, Column),
  !,
  ((valid_player_piece(Tab, 0, Line, Column),	%check if cell is empty
  !,
  insert_value(Tab, NewTab, Player, Line, Column));
  write('Invalid cell position!\n')));
  write('This cell is not empty!\n')).
												/*DA PARA JUNTAR ESTAS DUAS?*/
/*choose existing piece*/
choose_piece(Tab, NewTab, Player, Line, Column) :-
  ((valid_cell(Tab, Line, Column),
  !,
  ((valid_player_piece(Tab, Player, Line, Column),
  !,
  insert_value(Tab, NewTab, 0, Line, Column));
  write('Invalid cell position!\n')));
  write('The piece in this cell does not belong to this player!\n')).

/*cell within the limits of the board*/
valid_cell(Tab, Line, Column) :-
  valid_line(Tab, Line, LineList),
  !,
  valid_column(LineList, Column).

valid_line(Tab, Line, LineList) :-
  length(Tab, Value),
  Line =< Value,
  !,
  get_line_list(Tab, Line, LineList).

valid_column(LineList, Column) :-
  length(LineList, Value),
  Column =< Value.

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

get_value([_H|T], Column, Value) :-
  Column > 1,
  NextColumn is Column - 1,
  get_value(T, NextColumn, Value).

/*insert player symbol on the board*/
insert_value([H|T], [NewH|T], Player, 1, Column) :-
  insert_in_list(H, NewH, Player, Column).

insert_value([H|T], [H|NewT], Player, Line, Column) :-
  Line > 1,
  NextLine is Line - 1,
  insert_value(T, NewT, Player, NextLine, Column).

/*insert value in a list*/
insert_in_list([_H|T], [Player|T], Player, 1).
insert_in_list([H|T], [H|NewT], Player, Column) :-
    Column > 1,
    NextColumn is Column - 1,
    insert_in_list(T, NewT, Player, NextColumn).
