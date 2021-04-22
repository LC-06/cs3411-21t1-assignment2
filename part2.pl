% COMP3411-21T1 Assignment 2 Question 2 
% Yizhou(Leo) Cao
% z5261846

:- op(300, xfx, <-).
inter_construction(X <- B1, Y <- B2, X <- NewX, Y <- NewY, Z <- B) :-
    X \= Y,
    intersection(B1, B2, B),
    gensym(z, Z),
    subtract(B1, B, RestOfB1),
    subtract(B2, B, RestOfB2),
    append(RestOfB1, [Z], NewX),
    append(RestOfB2, [Z], NewY).

intra_construction(X <- B1, Y <- B2, X <- C1, Z <- C2, Z <- C3) :-
    X == Y,
    intersection(B1, B2, I),
    gensym(z, Z),
    append(I, [Z], C1),
    subtract(B1, I, C2),
    subtract(B2, I, C3).

absorption(X <- B1, Y <- B2, X <- C1, Y <- C2) :-
    subset(B2,B1),
    C2 = B2,
    subtract(B1, B2, RestOfB1),
    append([Y], RestOfB1, C1).

identification(X <- B1, Y <- B2, X <- C1, Y <- C2) :-
    X == Y,
    intersection(B1, B2, I),
    subtract(B1, I, RestOfB1),
    subtract(B2, I, RestOfB2),
    (length(RestOfB1, 1) -> (C1 = B1, C2 = RestOfB2);
    length(RestOfB2, 1) -> (C1 = B2, C2 = RestOfB1)).

dichotomisation(X <- B1, not(Y) <- B2, X <- C1, not(Y) <- C2, Z <- C3, not(Z) <- C4) :-
    X == Y,
    intersection(B1, B2, I),
    subtract(B1, I, RestOfB1),
    subtract(B2, I, RestOfB2),
    gensym(z, Z),
    C3 = RestOfB1,
    C4 = RestOfB2,
    append(I, [Z], C1),
    append(I, [not(Z)], C2).




truncation(X <- B1, Y <- B2, X <- C1) :-
    X == Y,
    intersection(B1, B2, I),
    C1 = I.

test(X <- A1, not(Y) <- A2, X <- B1,  not(Y) <- B2, Z <- B3, not(Z) <- B4):-
    B1 = A1,
    B2 = A2,
    gensym(z, Z),
    B3 = A2,
    B4 = A2.

