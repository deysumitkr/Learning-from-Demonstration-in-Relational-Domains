
:- dynamic
        action/3,
	bowl/1,
	cup/1,
	done/0,
	east/2,
	fork/1,
	near/2,
	north/2,
	not_bowl/1,
	not_cup/1,
	not_east/2,
	not_fork/1,
	not_near/2,
	not_north/2,
	not_plate/1,
	not_south/2,
	not_west/2,
	object/1,
	plate/1,
	south/2,
	west/2.

:- initialization(main).
 
main:-
        class(X), 
        pops(X).
 
pops([]):- nl.  
pops([H|T]):-   
        write(H),
        pops(T). 

fork(1).
plate(4).
not_near(1, 4).
not_north(1, 4).
not_east(1, 4).
west(1, 4).
not_south(1, 4).
not_near(4, 1).
not_north(4, 1).
east(4, 1).
not_west(4, 1).
not_south(4, 1).
done.


class([0.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,fork(C),near(C,B),not(C==B), !.
% 14.0 examples.
class([0.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,plate(C),near(C,A),not(C==A), !.
% 4.0 examples.
class([0.947368421052632]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,fork(C),fork(D),near(C,D),not(C==D),action(near,D,B),not(D==B),near(B,E),not(B==E), !.
% 38.0 examples.
class([0.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,fork(C),fork(D),near(C,D),not(C==D),action(near,D,B),not(D==B), !.
% 2.0 examples.
class([0.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,fork(C),fork(D),near(C,D),not(C==D), !.
% 3.0 examples.
class([0.972602739726027]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B, !.
% 146.0 examples.
class([0.986842105263158]) :- fork(A),plate(B),near(A,B),done,A\==B,bowl(C),not_near(C,B),not(C==B), !.
% 76.0 examples.
class([0.0]) :- fork(A),plate(B),near(A,B),done,A\==B,bowl(C), !.
% 2.0 examples.
class([1.0]) :- fork(A),plate(B),near(A,B),done,A\==B, !.
% 2.0 examples.
class([0.0]).
% 220.0 examples.


object(X) :- fork(X).
not_fork(X) :- object(x), not(fork(X)).
object(X) :- plate(X).
not_plate(X) :- object(x), not(plate(X)).
object(X) :- bowl(X).
not_bowl(X) :- object(x), not(bowl(X)).
object(X) :- cup(X).
not_cup(X) :- object(x), not(cup(X)).
not_near(X,Y) :- object(X), object(Y), not(near(X,Y)).
isValid(X,Y) :- object(X), object(Y), not(near(X,Y)).

