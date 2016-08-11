use_package(query).
load(models).

talking(2).
tilde_mode(classify).
classes([pos,neg]).

accuracy(1).
minimal_cases(1).

pruning(vsb).
random_validation_set(0.15).
random_test_set(0.15).

typed_language(yes).
type(fork(number)).
type(not_fork(number)).
type(plate(number)).
type(not_plate(number)).
type(bowl(number)).
type(not_bowl(number)).
type(cup(number)).
type(not_cup(number)).
type(near(number, number)).
type(not_near(number, number)).
type(action(string, number, number)).
type(object(number)).
type(isValid(number, number)).
type(action(string, number, number)).
type(number == number).
type(number \== number).
type(not(number == number)).

rmode((action(#[near], +-X, +-Y), not(X==Y))).
rmode((bowl(+-X))).
rmode((bowl(+-X), action(#[near], X, +-Y), X\==Y)).
rmode((bowl(+-X), bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), bowl(+-Y), done, X\==Y)).
rmode((bowl(+-X), bowl(+-Y), near(X, Y), not(X==Y))).
rmode((bowl(+-X), bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((bowl(+-X), bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((bowl(+-X), bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((bowl(+-X), cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), cup(+-Y), done, X\==Y)).
rmode((bowl(+-X), cup(+-Y), near(X, Y), not(X==Y))).
rmode((bowl(+-X), cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), cup(+-Y), near(X,Y), done, X\==Y)).
rmode((bowl(+-X), cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((bowl(+-X), cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((bowl(+-X), done)).
rmode((bowl(+-X), fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), fork(+-Y), done, X\==Y)).
rmode((bowl(+-X), fork(+-Y), near(X, Y), not(X==Y))).
rmode((bowl(+-X), fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), fork(+-Y), near(X,Y), done, X\==Y)).
rmode((bowl(+-X), fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((bowl(+-X), fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((bowl(+-X), near(X, +-Y), not(X==Y))).
rmode((bowl(+-X), near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), near(X,+-Y), done, X\==Y)).
rmode((bowl(+-X), not_bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_bowl(+-Y), done, X\==Y)).
rmode((bowl(+-X), not_bowl(+-Y), near(X, Y), not(X==Y))).
rmode((bowl(+-X), not_bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), not_bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((bowl(+-X), not_bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((bowl(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), not_bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((bowl(+-X), not_cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_cup(+-Y), done, X\==Y)).
rmode((bowl(+-X), not_cup(+-Y), near(X, Y), not(X==Y))).
rmode((bowl(+-X), not_cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), not_cup(+-Y), near(X,Y), done, X\==Y)).
rmode((bowl(+-X), not_cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((bowl(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), not_cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((bowl(+-X), not_fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_fork(+-Y), done, X\==Y)).
rmode((bowl(+-X), not_fork(+-Y), near(X, Y), not(X==Y))).
rmode((bowl(+-X), not_fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), not_fork(+-Y), near(X,Y), done, X\==Y)).
rmode((bowl(+-X), not_fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((bowl(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), not_fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((bowl(+-X), not_near(X, +-Y), not(X==Y))).
rmode((bowl(+-X), not_near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), not_near(X,+-Y), done, X\==Y)).
rmode((bowl(+-X), not_plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_plate(+-Y), done, X\==Y)).
rmode((bowl(+-X), not_plate(+-Y), near(X, Y), not(X==Y))).
rmode((bowl(+-X), not_plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), not_plate(+-Y), near(X,Y), done, X\==Y)).
rmode((bowl(+-X), not_plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((bowl(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), not_plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((bowl(+-X), plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), plate(+-Y), done, X\==Y)).
rmode((bowl(+-X), plate(+-Y), near(X, Y), not(X==Y))).
rmode((bowl(+-X), plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), plate(+-Y), near(X,Y), done, X\==Y)).
rmode((bowl(+-X), plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((bowl(+-X), plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-X), plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-X), plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((bowl(+-Y), action(#[near], +-X, Y), X\==Y)).
rmode((bowl(+-Y), near(+-X, Y), not(X==Y))).
rmode((bowl(+-Y), near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-Y), near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-Y), near(+-X,Y), done, X\==Y)).
rmode((bowl(+-Y), not_near(+-X, Y), not(X==Y))).
rmode((bowl(+-Y), not_near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((bowl(+-Y), not_near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((bowl(+-Y), not_near(+-X,Y), done, X\==Y)).
rmode((cup(+-X))).
rmode((cup(+-X), action(#[near], X, +-Y), X\==Y)).
rmode((cup(+-X), bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), bowl(+-Y), done, X\==Y)).
rmode((cup(+-X), bowl(+-Y), near(X, Y), not(X==Y))).
rmode((cup(+-X), bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((cup(+-X), bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((cup(+-X), bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((cup(+-X), cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), cup(+-Y), done, X\==Y)).
rmode((cup(+-X), cup(+-Y), near(X, Y), not(X==Y))).
rmode((cup(+-X), cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), cup(+-Y), near(X,Y), done, X\==Y)).
rmode((cup(+-X), cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((cup(+-X), cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((cup(+-X), done)).
rmode((cup(+-X), fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), fork(+-Y), done, X\==Y)).
rmode((cup(+-X), fork(+-Y), near(X, Y), not(X==Y))).
rmode((cup(+-X), fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), fork(+-Y), near(X,Y), done, X\==Y)).
rmode((cup(+-X), fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((cup(+-X), fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((cup(+-X), near(X, +-Y), not(X==Y))).
rmode((cup(+-X), near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), near(X,+-Y), done, X\==Y)).
rmode((cup(+-X), not_bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_bowl(+-Y), done, X\==Y)).
rmode((cup(+-X), not_bowl(+-Y), near(X, Y), not(X==Y))).
rmode((cup(+-X), not_bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), not_bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((cup(+-X), not_bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((cup(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), not_bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((cup(+-X), not_cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_cup(+-Y), done, X\==Y)).
rmode((cup(+-X), not_cup(+-Y), near(X, Y), not(X==Y))).
rmode((cup(+-X), not_cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), not_cup(+-Y), near(X,Y), done, X\==Y)).
rmode((cup(+-X), not_cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((cup(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), not_cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((cup(+-X), not_fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_fork(+-Y), done, X\==Y)).
rmode((cup(+-X), not_fork(+-Y), near(X, Y), not(X==Y))).
rmode((cup(+-X), not_fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), not_fork(+-Y), near(X,Y), done, X\==Y)).
rmode((cup(+-X), not_fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((cup(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), not_fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((cup(+-X), not_near(X, +-Y), not(X==Y))).
rmode((cup(+-X), not_near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), not_near(X,+-Y), done, X\==Y)).
rmode((cup(+-X), not_plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_plate(+-Y), done, X\==Y)).
rmode((cup(+-X), not_plate(+-Y), near(X, Y), not(X==Y))).
rmode((cup(+-X), not_plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), not_plate(+-Y), near(X,Y), done, X\==Y)).
rmode((cup(+-X), not_plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((cup(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), not_plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((cup(+-X), plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), plate(+-Y), done, X\==Y)).
rmode((cup(+-X), plate(+-Y), near(X, Y), not(X==Y))).
rmode((cup(+-X), plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), plate(+-Y), near(X,Y), done, X\==Y)).
rmode((cup(+-X), plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((cup(+-X), plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-X), plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-X), plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((cup(+-Y), action(#[near], +-X, Y), X\==Y)).
rmode((cup(+-Y), near(+-X, Y), not(X==Y))).
rmode((cup(+-Y), near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-Y), near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-Y), near(+-X,Y), done, X\==Y)).
rmode((cup(+-Y), not_near(+-X, Y), not(X==Y))).
rmode((cup(+-Y), not_near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((cup(+-Y), not_near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((cup(+-Y), not_near(+-X,Y), done, X\==Y)).
rmode((done)).
rmode((fork(+-X))).
rmode((fork(+-X), action(#[near], X, +-Y), X\==Y)).
rmode((fork(+-X), bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), bowl(+-Y), done, X\==Y)).
rmode((fork(+-X), bowl(+-Y), near(X, Y), not(X==Y))).
rmode((fork(+-X), bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((fork(+-X), bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((fork(+-X), bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((fork(+-X), cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), cup(+-Y), done, X\==Y)).
rmode((fork(+-X), cup(+-Y), near(X, Y), not(X==Y))).
rmode((fork(+-X), cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), cup(+-Y), near(X,Y), done, X\==Y)).
rmode((fork(+-X), cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((fork(+-X), cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((fork(+-X), done)).
rmode((fork(+-X), fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), fork(+-Y), done, X\==Y)).
rmode((fork(+-X), fork(+-Y), near(X, Y), not(X==Y))).
rmode((fork(+-X), fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), fork(+-Y), near(X,Y), done, X\==Y)).
rmode((fork(+-X), fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((fork(+-X), fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((fork(+-X), near(X, +-Y), not(X==Y))).
rmode((fork(+-X), near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), near(X,+-Y), done, X\==Y)).
rmode((fork(+-X), not_bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_bowl(+-Y), done, X\==Y)).
rmode((fork(+-X), not_bowl(+-Y), near(X, Y), not(X==Y))).
rmode((fork(+-X), not_bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), not_bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((fork(+-X), not_bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((fork(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), not_bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((fork(+-X), not_cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_cup(+-Y), done, X\==Y)).
rmode((fork(+-X), not_cup(+-Y), near(X, Y), not(X==Y))).
rmode((fork(+-X), not_cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), not_cup(+-Y), near(X,Y), done, X\==Y)).
rmode((fork(+-X), not_cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((fork(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), not_cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((fork(+-X), not_fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_fork(+-Y), done, X\==Y)).
rmode((fork(+-X), not_fork(+-Y), near(X, Y), not(X==Y))).
rmode((fork(+-X), not_fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), not_fork(+-Y), near(X,Y), done, X\==Y)).
rmode((fork(+-X), not_fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((fork(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), not_fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((fork(+-X), not_near(X, +-Y), not(X==Y))).
rmode((fork(+-X), not_near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), not_near(X,+-Y), done, X\==Y)).
rmode((fork(+-X), not_plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_plate(+-Y), done, X\==Y)).
rmode((fork(+-X), not_plate(+-Y), near(X, Y), not(X==Y))).
rmode((fork(+-X), not_plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), not_plate(+-Y), near(X,Y), done, X\==Y)).
rmode((fork(+-X), not_plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((fork(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), not_plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((fork(+-X), plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), plate(+-Y), done, X\==Y)).
rmode((fork(+-X), plate(+-Y), near(X, Y), not(X==Y))).
rmode((fork(+-X), plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), plate(+-Y), near(X,Y), done, X\==Y)).
rmode((fork(+-X), plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((fork(+-X), plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-X), plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-X), plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((fork(+-Y), action(#[near], +-X, Y), X\==Y)).
rmode((fork(+-Y), near(+-X, Y), not(X==Y))).
rmode((fork(+-Y), near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-Y), near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-Y), near(+-X,Y), done, X\==Y)).
rmode((fork(+-Y), not_near(+-X, Y), not(X==Y))).
rmode((fork(+-Y), not_near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((fork(+-Y), not_near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((fork(+-Y), not_near(+-X,Y), done, X\==Y)).
rmode((near(+-X, +-Y), not(X==Y))).
rmode((not_bowl(+-X))).
rmode((not_bowl(+-X), action(#[near], X, +-Y), X\==Y)).
rmode((not_bowl(+-X), bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), bowl(+-Y), done, X\==Y)).
rmode((not_bowl(+-X), bowl(+-Y), near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), cup(+-Y), done, X\==Y)).
rmode((not_bowl(+-X), cup(+-Y), near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), cup(+-Y), near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), done)).
rmode((not_bowl(+-X), fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), fork(+-Y), done, X\==Y)).
rmode((not_bowl(+-X), fork(+-Y), near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), fork(+-Y), near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), near(X, +-Y), not(X==Y))).
rmode((not_bowl(+-X), near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), near(X,+-Y), done, X\==Y)).
rmode((not_bowl(+-X), not_bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_bowl(+-Y), done, X\==Y)).
rmode((not_bowl(+-X), not_bowl(+-Y), near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), not_bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), not_bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), not_bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), not_bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), not_cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_cup(+-Y), done, X\==Y)).
rmode((not_bowl(+-X), not_cup(+-Y), near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), not_cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), not_cup(+-Y), near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), not_cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), not_cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), not_fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_fork(+-Y), done, X\==Y)).
rmode((not_bowl(+-X), not_fork(+-Y), near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), not_fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), not_fork(+-Y), near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), not_fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), not_fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), not_near(X, +-Y), not(X==Y))).
rmode((not_bowl(+-X), not_near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), not_near(X,+-Y), done, X\==Y)).
rmode((not_bowl(+-X), not_plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_plate(+-Y), done, X\==Y)).
rmode((not_bowl(+-X), not_plate(+-Y), near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), not_plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), not_plate(+-Y), near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), not_plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), not_plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), plate(+-Y), done, X\==Y)).
rmode((not_bowl(+-X), plate(+-Y), near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), plate(+-Y), near(X,Y), done, X\==Y)).
rmode((not_bowl(+-X), plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_bowl(+-X), plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-X), plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-X), plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_bowl(+-Y), action(#[near], +-X, Y), X\==Y)).
rmode((not_bowl(+-Y), near(+-X, Y), not(X==Y))).
rmode((not_bowl(+-Y), near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-Y), near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-Y), near(+-X,Y), done, X\==Y)).
rmode((not_bowl(+-Y), not_near(+-X, Y), not(X==Y))).
rmode((not_bowl(+-Y), not_near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_bowl(+-Y), not_near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_bowl(+-Y), not_near(+-X,Y), done, X\==Y)).
rmode((not_cup(+-X))).
rmode((not_cup(+-X), action(#[near], X, +-Y), X\==Y)).
rmode((not_cup(+-X), bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), bowl(+-Y), done, X\==Y)).
rmode((not_cup(+-X), bowl(+-Y), near(X, Y), not(X==Y))).
rmode((not_cup(+-X), bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_cup(+-X), bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), cup(+-Y), done, X\==Y)).
rmode((not_cup(+-X), cup(+-Y), near(X, Y), not(X==Y))).
rmode((not_cup(+-X), cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), cup(+-Y), near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_cup(+-X), cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), done)).
rmode((not_cup(+-X), fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), fork(+-Y), done, X\==Y)).
rmode((not_cup(+-X), fork(+-Y), near(X, Y), not(X==Y))).
rmode((not_cup(+-X), fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), fork(+-Y), near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_cup(+-X), fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), near(X, +-Y), not(X==Y))).
rmode((not_cup(+-X), near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), near(X,+-Y), done, X\==Y)).
rmode((not_cup(+-X), not_bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_bowl(+-Y), done, X\==Y)).
rmode((not_cup(+-X), not_bowl(+-Y), near(X, Y), not(X==Y))).
rmode((not_cup(+-X), not_bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), not_bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), not_bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_cup(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), not_bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), not_cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_cup(+-Y), done, X\==Y)).
rmode((not_cup(+-X), not_cup(+-Y), near(X, Y), not(X==Y))).
rmode((not_cup(+-X), not_cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), not_cup(+-Y), near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), not_cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_cup(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), not_cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), not_fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_fork(+-Y), done, X\==Y)).
rmode((not_cup(+-X), not_fork(+-Y), near(X, Y), not(X==Y))).
rmode((not_cup(+-X), not_fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), not_fork(+-Y), near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), not_fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_cup(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), not_fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), not_near(X, +-Y), not(X==Y))).
rmode((not_cup(+-X), not_near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), not_near(X,+-Y), done, X\==Y)).
rmode((not_cup(+-X), not_plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_plate(+-Y), done, X\==Y)).
rmode((not_cup(+-X), not_plate(+-Y), near(X, Y), not(X==Y))).
rmode((not_cup(+-X), not_plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), not_plate(+-Y), near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), not_plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_cup(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), not_plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), plate(+-Y), done, X\==Y)).
rmode((not_cup(+-X), plate(+-Y), near(X, Y), not(X==Y))).
rmode((not_cup(+-X), plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), plate(+-Y), near(X,Y), done, X\==Y)).
rmode((not_cup(+-X), plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_cup(+-X), plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-X), plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-X), plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_cup(+-Y), action(#[near], +-X, Y), X\==Y)).
rmode((not_cup(+-Y), near(+-X, Y), not(X==Y))).
rmode((not_cup(+-Y), near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-Y), near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-Y), near(+-X,Y), done, X\==Y)).
rmode((not_cup(+-Y), not_near(+-X, Y), not(X==Y))).
rmode((not_cup(+-Y), not_near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_cup(+-Y), not_near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_cup(+-Y), not_near(+-X,Y), done, X\==Y)).
rmode((not_fork(+-X))).
rmode((not_fork(+-X), action(#[near], X, +-Y), X\==Y)).
rmode((not_fork(+-X), bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), bowl(+-Y), done, X\==Y)).
rmode((not_fork(+-X), bowl(+-Y), near(X, Y), not(X==Y))).
rmode((not_fork(+-X), bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_fork(+-X), bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), cup(+-Y), done, X\==Y)).
rmode((not_fork(+-X), cup(+-Y), near(X, Y), not(X==Y))).
rmode((not_fork(+-X), cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), cup(+-Y), near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_fork(+-X), cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), done)).
rmode((not_fork(+-X), fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), fork(+-Y), done, X\==Y)).
rmode((not_fork(+-X), fork(+-Y), near(X, Y), not(X==Y))).
rmode((not_fork(+-X), fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), fork(+-Y), near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_fork(+-X), fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), near(X, +-Y), not(X==Y))).
rmode((not_fork(+-X), near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), near(X,+-Y), done, X\==Y)).
rmode((not_fork(+-X), not_bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_bowl(+-Y), done, X\==Y)).
rmode((not_fork(+-X), not_bowl(+-Y), near(X, Y), not(X==Y))).
rmode((not_fork(+-X), not_bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), not_bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), not_bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_fork(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), not_bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), not_cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_cup(+-Y), done, X\==Y)).
rmode((not_fork(+-X), not_cup(+-Y), near(X, Y), not(X==Y))).
rmode((not_fork(+-X), not_cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), not_cup(+-Y), near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), not_cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_fork(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), not_cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), not_fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_fork(+-Y), done, X\==Y)).
rmode((not_fork(+-X), not_fork(+-Y), near(X, Y), not(X==Y))).
rmode((not_fork(+-X), not_fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), not_fork(+-Y), near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), not_fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_fork(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), not_fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), not_near(X, +-Y), not(X==Y))).
rmode((not_fork(+-X), not_near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), not_near(X,+-Y), done, X\==Y)).
rmode((not_fork(+-X), not_plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_plate(+-Y), done, X\==Y)).
rmode((not_fork(+-X), not_plate(+-Y), near(X, Y), not(X==Y))).
rmode((not_fork(+-X), not_plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), not_plate(+-Y), near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), not_plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_fork(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), not_plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), plate(+-Y), done, X\==Y)).
rmode((not_fork(+-X), plate(+-Y), near(X, Y), not(X==Y))).
rmode((not_fork(+-X), plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), plate(+-Y), near(X,Y), done, X\==Y)).
rmode((not_fork(+-X), plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_fork(+-X), plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-X), plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-X), plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_fork(+-Y), action(#[near], +-X, Y), X\==Y)).
rmode((not_fork(+-Y), near(+-X, Y), not(X==Y))).
rmode((not_fork(+-Y), near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-Y), near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-Y), near(+-X,Y), done, X\==Y)).
rmode((not_fork(+-Y), not_near(+-X, Y), not(X==Y))).
rmode((not_fork(+-Y), not_near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_fork(+-Y), not_near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_fork(+-Y), not_near(+-X,Y), done, X\==Y)).
rmode((not_near(+-X, +-Y), not(X==Y))).
rmode((not_plate(+-X))).
rmode((not_plate(+-X), action(#[near], X, +-Y), X\==Y)).
rmode((not_plate(+-X), bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), bowl(+-Y), done, X\==Y)).
rmode((not_plate(+-X), bowl(+-Y), near(X, Y), not(X==Y))).
rmode((not_plate(+-X), bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_plate(+-X), bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), cup(+-Y), done, X\==Y)).
rmode((not_plate(+-X), cup(+-Y), near(X, Y), not(X==Y))).
rmode((not_plate(+-X), cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), cup(+-Y), near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_plate(+-X), cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), done)).
rmode((not_plate(+-X), fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), fork(+-Y), done, X\==Y)).
rmode((not_plate(+-X), fork(+-Y), near(X, Y), not(X==Y))).
rmode((not_plate(+-X), fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), fork(+-Y), near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_plate(+-X), fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), near(X, +-Y), not(X==Y))).
rmode((not_plate(+-X), near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), near(X,+-Y), done, X\==Y)).
rmode((not_plate(+-X), not_bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_bowl(+-Y), done, X\==Y)).
rmode((not_plate(+-X), not_bowl(+-Y), near(X, Y), not(X==Y))).
rmode((not_plate(+-X), not_bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), not_bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), not_bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_plate(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), not_bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), not_cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_cup(+-Y), done, X\==Y)).
rmode((not_plate(+-X), not_cup(+-Y), near(X, Y), not(X==Y))).
rmode((not_plate(+-X), not_cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), not_cup(+-Y), near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), not_cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_plate(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), not_cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), not_fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_fork(+-Y), done, X\==Y)).
rmode((not_plate(+-X), not_fork(+-Y), near(X, Y), not(X==Y))).
rmode((not_plate(+-X), not_fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), not_fork(+-Y), near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), not_fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_plate(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), not_fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), not_near(X, +-Y), not(X==Y))).
rmode((not_plate(+-X), not_near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), not_near(X,+-Y), done, X\==Y)).
rmode((not_plate(+-X), not_plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_plate(+-Y), done, X\==Y)).
rmode((not_plate(+-X), not_plate(+-Y), near(X, Y), not(X==Y))).
rmode((not_plate(+-X), not_plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), not_plate(+-Y), near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), not_plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_plate(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), not_plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), plate(+-Y), done, X\==Y)).
rmode((not_plate(+-X), plate(+-Y), near(X, Y), not(X==Y))).
rmode((not_plate(+-X), plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), plate(+-Y), near(X,Y), done, X\==Y)).
rmode((not_plate(+-X), plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((not_plate(+-X), plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-X), plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-X), plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((not_plate(+-Y), action(#[near], +-X, Y), X\==Y)).
rmode((not_plate(+-Y), near(+-X, Y), not(X==Y))).
rmode((not_plate(+-Y), near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-Y), near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-Y), near(+-X,Y), done, X\==Y)).
rmode((not_plate(+-Y), not_near(+-X, Y), not(X==Y))).
rmode((not_plate(+-Y), not_near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((not_plate(+-Y), not_near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((not_plate(+-Y), not_near(+-X,Y), done, X\==Y)).
rmode((plate(+-X))).
rmode((plate(+-X), action(#[near], X, +-Y), X\==Y)).
rmode((plate(+-X), bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), bowl(+-Y), done, X\==Y)).
rmode((plate(+-X), bowl(+-Y), near(X, Y), not(X==Y))).
rmode((plate(+-X), bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((plate(+-X), bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((plate(+-X), bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((plate(+-X), cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), cup(+-Y), done, X\==Y)).
rmode((plate(+-X), cup(+-Y), near(X, Y), not(X==Y))).
rmode((plate(+-X), cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), cup(+-Y), near(X,Y), done, X\==Y)).
rmode((plate(+-X), cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((plate(+-X), cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((plate(+-X), done)).
rmode((plate(+-X), fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), fork(+-Y), done, X\==Y)).
rmode((plate(+-X), fork(+-Y), near(X, Y), not(X==Y))).
rmode((plate(+-X), fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), fork(+-Y), near(X,Y), done, X\==Y)).
rmode((plate(+-X), fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((plate(+-X), fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((plate(+-X), near(X, +-Y), not(X==Y))).
rmode((plate(+-X), near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), near(X,+-Y), done, X\==Y)).
rmode((plate(+-X), not_bowl(+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_bowl(+-Y), done, X\==Y)).
rmode((plate(+-X), not_bowl(+-Y), near(X, Y), not(X==Y))).
rmode((plate(+-X), not_bowl(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_bowl(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), not_bowl(+-Y), near(X,Y), done, X\==Y)).
rmode((plate(+-X), not_bowl(+-Y), not_near(X, Y), not(X==Y))).
rmode((plate(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_bowl(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), not_bowl(+-Y), not_near(X,Y), done, X\==Y)).
rmode((plate(+-X), not_cup(+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_cup(+-Y), done, X\==Y)).
rmode((plate(+-X), not_cup(+-Y), near(X, Y), not(X==Y))).
rmode((plate(+-X), not_cup(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_cup(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), not_cup(+-Y), near(X,Y), done, X\==Y)).
rmode((plate(+-X), not_cup(+-Y), not_near(X, Y), not(X==Y))).
rmode((plate(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_cup(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), not_cup(+-Y), not_near(X,Y), done, X\==Y)).
rmode((plate(+-X), not_fork(+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_fork(+-Y), done, X\==Y)).
rmode((plate(+-X), not_fork(+-Y), near(X, Y), not(X==Y))).
rmode((plate(+-X), not_fork(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_fork(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), not_fork(+-Y), near(X,Y), done, X\==Y)).
rmode((plate(+-X), not_fork(+-Y), not_near(X, Y), not(X==Y))).
rmode((plate(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_fork(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), not_fork(+-Y), not_near(X,Y), done, X\==Y)).
rmode((plate(+-X), not_near(X, +-Y), not(X==Y))).
rmode((plate(+-X), not_near(X,+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_near(X,+-Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), not_near(X,+-Y), done, X\==Y)).
rmode((plate(+-X), not_plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_plate(+-Y), done, X\==Y)).
rmode((plate(+-X), not_plate(+-Y), near(X, Y), not(X==Y))).
rmode((plate(+-X), not_plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), not_plate(+-Y), near(X,Y), done, X\==Y)).
rmode((plate(+-X), not_plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((plate(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), not_plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), not_plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((plate(+-X), plate(+-Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), plate(+-Y), done, X\==Y)).
rmode((plate(+-X), plate(+-Y), near(X, Y), not(X==Y))).
rmode((plate(+-X), plate(+-Y), near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), plate(+-Y), near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), plate(+-Y), near(X,Y), done, X\==Y)).
rmode((plate(+-X), plate(+-Y), not_near(X, Y), not(X==Y))).
rmode((plate(+-X), plate(+-Y), not_near(X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-X), plate(+-Y), not_near(X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-X), plate(+-Y), not_near(X,Y), done, X\==Y)).
rmode((plate(+-Y), action(#[near], +-X, Y), X\==Y)).
rmode((plate(+-Y), near(+-X, Y), not(X==Y))).
rmode((plate(+-Y), near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-Y), near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-Y), near(+-X,Y), done, X\==Y)).
rmode((plate(+-Y), not_near(+-X, Y), not(X==Y))).
rmode((plate(+-Y), not_near(+-X,Y), action(#[near], X, Y), X\==Y)).
rmode((plate(+-Y), not_near(+-X,Y), action(#[near], Y, X), X\==Y)).
rmode((plate(+-Y), not_near(+-X,Y), done, X\==Y)).

constraint(near(X,Y), isValid(X,Y)).
constraint(action(near, X, Y), isValid(X,Y)).

max_lookahead(1).
output_options([c45e,prolog,roc01,elaborate]).

