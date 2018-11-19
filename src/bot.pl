valid_moves(Board, Player, ListOfMoves) :-	
  findall(Line+Column,											%find all empty cells
			(between(1,9,Line), between(1,9,Column),
			 check_cell(Board, 0, Line, Column)), 					
		  PlacePiece),
  findall(Line+Column-To,										%find cells with Player's pieces
			(between(1,9,Line), between(1,9,Column),
			 check_cell(Board, Player, Line, Column), 					
			 surrounding_cells(Board, Line, Column, Cells, 6),
			 findall(Elem,											%find all empty cells surrounding the Player's piece
			         (length(Cells,Length),
			          between(1,Length,Index),
			          nth1(Index,Cells,Elem),
			          Elem = A+B,
			          check_cell(Board, 0, A, B)),
			         To)),
		  SlidePiece),
  maplist(distribute_moves, SlidePiece, SlidePieceDistributed),
  concat(SlidePieceDistributed, SlidePieceConcat),
  append(PlacePiece, SlidePieceConcat, ListOfMoves).

/*create moves from the format Move-[List of Moves]*/
distribute_moves(_Move-[], []).
distribute_moves(Move-[H|T], Result) :-
  H=A+B,
  distribute_moves(Move-T, NewResult),
  append([Move-A+B], NewResult, Result).
  
/*concatenate lists inside a list*/
concat([],[]).
concat([H|T],L) :-
    concat(T,L2),
	append(H,L2,L).
  
best_move(Board, Player, Move) :-
  valid_moves(Board, Player, ListOfMoves),
  findall(Value,								%calculate values for each possible new board
        (length(ListOfMoves,Length),
		 between(1,Length,Index),
		 nth1(Index, ListOfMoves, Elem),
		 move(Elem, Board, Player, NewBoard),	%simulate the boards resulting of each possible move
		 value(NewBoard, Player, Value)),		
	    MovesValues),
  max_member(MaxVal, MovesValues),
  nth1(Index, MovesValues, MaxVal),
  nth1(Index, ListOfMoves, Move).
  
/*evaluate the board, depending on the opponent's piece that is the closest to being surrounded*/
value(Board, Player, Value) :-
  ((Player =:= 1, OtherPlayer is 2); OtherPlayer is 1),
   min_empty_surr_cells(Board, 1, 1, Player, N), ((N =:= 0, Value is 0);		%lost
  (min_empty_surr_cells(Board, 1, 1, OtherPlayer, N1), Value is 7 - N1)), !.		%value from 1-7	
  