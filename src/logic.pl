start_game :-
  initTab(InitialTab),
  display_game(InitialTab),
  game_cycle(InitialTab).
  
game_cycle(CurrentTab) :-
  playerX(CurrentTab, FirstNewTab),
  check_game_state(FirstNewTab),
  !,
  playerO(FirstNewTab, SecondNewTab),
  check_game_state(SecondNewTab),
  !,
  game_cycle(SecondNewTab).

game_cycle(_) :- write('End of the game'), nl.
  
playerX(CurrentTab, FirstNewTab) :-
  write('Choose an option:\n 1: Place a new piece\n 2: Move an existing piece\nOption: '),
  read(Option),
  moveX(CurrentTab, Option, FirstNewTab),
  display_game(FirstNewTab).
  
playerO(FirstNewTab, SecondNewTab) :-
  write('Choose an option:\n 1: Place a new piece\n 2: Move an existing piece\nOption: '),
  read(Option),
  moveO(FirstNewTab, Option, SecondNewTab),
  display_game(SecondNewTab).

moveX(Tab, 1, NewTab) :- 
  write('\nType the coordinates of an empty cell:\n'),
  write('Line: '),
  read(NewLine),
  write('Column: '),
  read(NewColumn),
  check_move(Tab, NewTab, 'X', NewLine, NewColumn).
  
moveX(Tab, 2, NewTab) :- 
  write('\nType the coordinates of the piece to move:\n'),
  write('Line: '),
  read(Line),
  write('Column: '),
  read(Column),
  check_move(Tab, NewTab, 'X', Line, Column),
  write('\nType the coordinates to where the piece should move:\n'),
  write('Line: '),
  read(NewLine),
  write('Column: '),
  read(NewColumn),
  check_move(Tab, NewTab, 'X', NewLine, NewColumn).
  
moveO(Tab, 1, NewTab) :- 
  write('\nType the coordinates of an empty cell:\n'),
  write('Line: '),
  read(NewLine),
  write('Column: '),
  read(NewColumn),
  check_move(Tab, NewTab, 'O', NewLine, NewColumn).
  
moveO(Tab, 2, NewTab) :- 
  write('\nType the coordinates of the piece to move:\n'),
  write('Line: '),
  read(Line),
  write('Column: '),
  read(Column),
  check_move(Tab, NewTab, 'O', Line, Column),
  write('\nType the coordinates to where the piece should move:\n'),
  write('Line: '),
  read(NewLine),
  write('Column: '),
  read(NewColumn),
  check_move(Tab, NewTab, 'O', NewLine, NewColumn).
  
check_game_state(Tab).	%ainda não está implementado

check_move(Tab, NewTab, Player, Line, Column).	%ainda não está implementado