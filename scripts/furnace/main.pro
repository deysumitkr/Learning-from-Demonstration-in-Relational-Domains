
:- dynamic
        action/3,
	bowl/1,
	done/0,
	fork/1,
	near/2,
	not_bowl/1,
	not_fork/1,
	not_near/2,
	not_plate/1,
	not_spoon/1,
	object/1,
	plate/1,
	spoon/1.

:- initialization(main).
 
main:-
        class(X), 
        pops(X).
 
pops([]):- nl.  
pops([H|T]):-   
        write(H),
        pops(T). 

fork(1).
fork(3).
plate(4).
plate(5).
near(1, 5).
near(3, 4).
near(4, 3).
near(5, 1).
done.


class([0.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,plate(C),near(C,A),not(C==A), !.
% 15.0 examples.
class([0.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,fork(C),near(C,B),not(C==B), !.
% 2.0 examples.
class([0.964705882352941]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,fork(C),plate(D),near(C,D),not(C==D), !.
% 85.0 examples.
class([0.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,spoon(C),not_near(C,B),not(C==B), !.
% 2.0 examples.
class([0.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,spoon(C),not_near(C,A),not(C==A), !.
% 1.0 examples.
class([0.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,plate(C),not_near(C,B),not(C==B),near(B,D),not(B==D), !.
% 4.0 examples.
class([0.891891891891892]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B,plate(C),not_near(C,B),not(C==B), !.
% 37.0 examples.
class([1.0]) :- fork(A),plate(B),not_near(A,B),action(near,A,B),A\==B, !.
% 29.0 examples.
class([0.0]) :- fork(A),plate(B),near(A,B),done,A\==B,fork(C),fork(D),near(C,D),not(C==D), !.
% 1.0 examples.
class([0.970588235294118]) :- fork(A),plate(B),near(A,B),done,A\==B, !.
% 68.0 examples.
class([0.0]).
% 175.0 examples.


object(X) :- fork(X).
not_fork(X) :- object(x), not(fork(X)).
object(X) :- plate(X).
not_plate(X) :- object(x), not(plate(X)).
object(X) :- spoon(X).
not_spoon(X) :- object(x), not(spoon(X)).
object(X) :- bowl(X).
not_bowl(X) :- object(x), not(bowl(X)).
not_near(X,Y) :- object(X), object(Y), not(near(X,Y)).
isValid(X,Y) :- object(X), object(Y), not(near(X,Y)).

