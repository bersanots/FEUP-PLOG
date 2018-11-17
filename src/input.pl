retrieve_line(Line) :-
  get_char(Letter),
  peek_char(NextLineChar),
  skip_line, !,
  NextLineChar=='\n',
  letter(Line, Letter).
  
retrieve_column(Column) :-
  get_char(ColChar),
  char_code(ColChar, ColCode), !,
  (between(49,57,ColCode), !,						%Column between 1-9
  (number_chars(Column, [ColChar]),
   peek_char(NextColChar),
   skip_line);
  skip_line),
  NextColChar=='\n'.
   
retrieve_option(Option, Min, Max) :-
  get_char(Char),
  char_code(Char, Code),
  number_codes(Min, CodeMin), CodeMin = [CMin|_],
  number_codes(Max, CodeMax), CodeMax = [CMax|_], !,
  (between(CMin,CMax,Code), !,				
  (number_chars(Option, [Char]),
   peek_char(NextChar),
   skip_line);
  skip_line),
  NextChar=='\n'.