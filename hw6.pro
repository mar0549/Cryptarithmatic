go1:-
  puzzle1(Show,[0,1,2,3,4,5,6,7,8,9],_),
  Show,
  fail
; nl.

go2:-
  puzzle2(Show,[0,1,2,3,4,5,6,7,8,9],_),
  Show,
  fail
; nl.



/*

  T E X A S +
N E V A D A =
------------
A L A S K A


*/

% problem specific code

puzzle1(show(T,E,X,A,S,N,V,D,L,K))-->
  add_digits(0,S,A,A,  0,R1),
  add_digits(0,A,D,K, R1,R2),
  add_digits(0,X,A,S, R2,R3),
  add_digits(0,E,V,A, R3,R4),
  add_digits(0,T,E,L, R4,R5),
  add_digits(0,0,N,A, R5,R6),
  add_digits(0,0,0,R6, R6,R7),
  {N>0,A>0}.

show(T,E,X,A,S,N,V,D,L,K):-
( write('  '),
  write([T,E,X,A,S]),
  write('+'),nl,
  write([N,E,V,A,D,A]),
  write('='),nl,
  write([A,L,A,S,K,A]),nl,
  fail
; nl
).

/*

  C A R T E R +
  R E A G A N +
L I N C O L N =
----------------
C L I N T O N

*/

% problem specific code

puzzle2(show2(C,A,R,T,E,G,N,L,I,O))-->
  add_digits(R,N,N,N,  0,R1),
  add_digits(E,A,L,O, R1,R2),
  add_digits(T,G,O,T, R2,R3),
  add_digits(R,A,C,N, R3,R4),
  add_digits(A,E,N,I, R4,R5),
  add_digits(C,R,I,L, R5,R6),
  add_digits(0,0,L,C, R6,R7),
  {L>0,C>0}.

show2(C,A,R,T,E,G,N,L,I,O):-
( write('  '),
  write([C,A,R,T,E,R]),
  write('+'),nl,
  write('  '),
  write([R,E,A,G,A,N]),
  write('+'),nl,
  write([L,I,N,C,O,L,N]),
  write('='),nl,
  write([C,L,I,N,T,O,N]),nl,
  fail
; nl
).



% reusable code

digit(X)-->{integer(X)},!.
digit(X)-->sel(X).

add_digits(C1,C2,C3,Res,R1,R2)-->
   digit(C1),
   digit(C2),
   digit(C3),
   digit(Res),
   {add_with_carry(C1,C2,C3,R1, Res,R2)}.

add_with_carry(C1,C2,C3,R1, Res,R2):-
    S is (C1+C2+C3)+R1,
    Res is S mod 10,
    R2 is S // 10.

sel(X,[X|Xs],Xs).
sel(X,[Y|Xs],[Y|Ys]):-sel(X,Xs,Ys).
