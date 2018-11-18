valid_moves(Board, Player, ListOfMoves) :-	
  findall(Line+Column,											%find all empty cells
			(between(1,3,Line), between(1,3,Column),
			 check_cell(Board, 0, Line, Column)), 					
		  PlacePiece),
  findall(Line+Column-To,										%find cells with Player's pieces
			(between(1,3,Line), between(1,3,Column),
			 check_cell(Board, Player, Line, Column), 					
			 surrounding_cells(Board, Line, Column, Cells, 6),
			 findall(Elem,											%find all empty cells surrounding the Player's piece
			         (length(Cells,Length),
			          between(1,Length,Index),
			          nth1(Index,Cells,Elem),
			          Elem = A+B,
			          check_cell(Board, 0, A, B)),
			         To)),
		  MovePiece),
  maplist(distribute_moves, MovePiece, MovePieceDistributed),
  ((MovePieceDistributed = [H|_T],
   append(PlacePiece, H, ListOfMoves));
   append(PlacePiece, [], ListOfMoves)).
  
distribute_moves(_Move-[], []).  

/*create moves from the format Move-[List of Moves]*/
distribute_moves(Move-[H|T], Result) :-
  H=A+B,
  distribute_moves(Move-T, NewResult),
  append([Move-A+B], NewResult, Result).
  
best_move(Board, Player, Move) :-
  valid_moves(Board, Player, ListOfMoves),
  findall(Value,
        (length(ListOfMoves,Length),
		 between(1,Length,Index),
		 nth1(Index, ListOfMoves, Elem),
		 move(Elem, Board, Player, NewBoard),
		 value(NewBoard, Player, Value)),
	    MovesValues),
  max_member(MaxVal, MovesValues),
  nth1(Index, MovesValues, MaxVal),
  nth1(Index, ListOfMoves, Move).
  
value(Board, Player, Value) :-
  ((Player =:= 1,
   ((has_pieces_surrounded(Board, 1, 1, 1), Value is 0);		%lost	
    (has_pieces_surrounded(Board, 1, 1, 2), Value is 10)));		%won
  (Player =:= 2,
   ((has_pieces_surrounded(Board, 1, 1, 2), Value is 0);		%lost
    (has_pieces_surrounded(Board, 1, 1, 1), Value is 10))));	%won
  Value is 5.
  