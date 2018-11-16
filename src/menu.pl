/*funcoes 'porfazer' sao para depois se alterar para as funcoes esperadas das funcionalidades que faltam*/

display_menu :-
  write('--------------------- Welcome to Susan ----------------------'),
  nl,
  nl,
  write('   Menu:'), nl,nl,
  write('1. Player vs Player'), nl,
  write('2. Player vs Computer'), nl,
  write('3. Computer vs Computer'), nl,nl,
  write('0. Exit'), nl,nl,
  write('Choose the game mode you want to play:'),
  read(X),
  choose_mode(X).



choose_mode(X):-
  X == 1, pvp_game;
  X == 2, pvc_menu;
  X == 3, cvc_menu;
  X == 0, write('Exiting the game...').
  
pvp_game :-
  start_game.

pvc_menu :-
  nl,nl,
  write('Choose the computer level:'),nl,
  write('1) Easy'),nl,
  write('2) Hard'),nl,
  write('--> '),
  read(X),
  (X \= 1, X \= 2), display_menu;
  start_game.

cvc_menu :-
  nl,nl,
  write('Choose the computer level:'),nl,
  write('1) Easy'),nl,
  write('2) Hard'),nl,
  write('PC1 --> '),
  read(X1), nl,
  write('PC2 --> '),
  read(X2),nl,
  ((X1 =\= 1, X1 =\= 2) ; (X2 =\= 1, X2 =\= 2)), display_menu;
  start_game.


porfazer :- write('to be done').
