/*---------Representacao do jogo-------------------
a     1 2 3 4 5
b    1 2 3 4 5 6
c   1 2 3 4 5 6 7
d  1 2 3 4 5 6 7 8
e 1 2 3 4 5 6 7 8 9
f  1 2 3 4 5 6 7 8
g   1 2 3 4 5 6 7
h    1 2 3 4 5 6
i     1 2 3 4 5
*/

initTab([[0,0,0,0,0],
         [0,0,0,0,0,0],
         [0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0],
         [0,0,0,0,0,0],
         [0,0,0,0,0]
]).

 midTab([[0,0,0,0,0],
         [0,0,0,0,0,0],
         [0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0],
         [0,0,0,2,2,1,0,0,0],
         [0,0,2,0,2,1,0,0],
         [0,0,0,1,1,0,0],
         [0,0,0,0,0,0],
         [0,0,0,0,0]
]).

endTab([[0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0],
        [0,0,0,2,2,1,0,0,0],
        [0,0,2,1,2,1,0,0],
        [0,0,0,1,1,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0]
]).



/*---------Display jogo-------------------*/
display_game(X):- 
  nl,
  write('             | 1 | 2 | 3 | 4 | 5 |'),
  nl,
  write('             |   |   |   |   |   |'),
  nl,
  print_board(X,1),
  write('---         \\ / \\ / \\ / \\ / \\ /'),
  nl, nl.

print_board([],10).
print_board([H|T],N):-
  hexagon(N),
  nl,
  letter(N,L),
  write(L),
  write('  |'),
  line_space(N),
  print_line(H),
  num(N),
  nl,
  N1 is N + 1,
  print_board(T,N1).

print_line([]).
print_line([C|L]):-
  print_cell(C),
  write(' |'),
  print_line(L).

print_cell(C):-
  traduz(C,V),
  write(V).

traduz(0,'  ').
traduz(1,' X').
traduz(2,' O').
traduz(X,X).

/*letras no lado esquerdo*/
letter(1, 'A').
letter(2, 'B').
letter(3, 'C').
letter(4, 'D').
letter(5, 'E').
letter(6, 'F').
letter(7, 'G').
letter(8, 'H').
letter(9, 'I').
letter(0, _).

/*numeros em cima e do lado direito*/
num(N) :- N < 5, !, N1 is N+5, write('  '), write(N1).
num(_).


/*limites superior e inferior de cada celula em forma de hexagono*/
hexagon(1) :- write('---         / \\ / \\ / \\ / \\ / \\ /').
hexagon(2) :- write('---       / \\ / \\ / \\ / \\ / \\ / \\ /').
hexagon(3) :- write('---     / \\ / \\ / \\ / \\ / \\ / \\ / \\ /').
hexagon(4) :- write('---   / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ /').
hexagon(5) :- write('--- / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ /').
hexagon(6) :- write('--- \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ /').
hexagon(7) :- write('---   \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ /').
hexagon(8) :- write('---     \\ / \\ / \\ / \\ / \\ / \\ / \\ /').
hexagon(9) :- write('---       \\ / \\ / \\ / \\ / \\ / \\ /').

/*espaços entre as letras e o tabuleiro*/
line_space(1) :- write('       |').
line_space(2) :- write('     |').
line_space(3) :- write('   |').
line_space(4) :- write(' |').
line_space(5).
line_space(6) :- write(' |').
line_space(7) :- write('   |').
line_space(8) :- write('     |').
line_space(9) :- write('       |').
