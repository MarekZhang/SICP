## 2.2 Hierarchical Data and the Closure Property

### Exercise 2.17:

Define a procedure `last-pair` that returns the list that contains only the last element of a given (nonempty) list:

```scheme
(last-pair (list 23 72 149 34))
; (34)
```

### Exercise 2.18:

Define a procedure `reverse` that takes a list as argument and returns a list of the same elements in reverse order:

```scheme
(reverse (list 1 4 9 16 25))
; (25 16 9 4 1)
```

### Exercise 2.19:

Consider the change-counting program of Section 1.2.2. It would be nice to be able to easily change the currency used by the program, so that we could compute the number of ways to change a British pound, for example. As the program is written, the knowledge of the currency is distributed partly into the procedure `first-denomination` and partly into the procedure `count-change` (which knows that there are five kinds of U.S. coins). It would be nicer to be able to supply a list of coins to be used for making change.

We want to rewrite the procedure `cc` so that its second argument is a list of the values of the coins to use rather than an integer specifying which coins to use. We could then have lists that defined each kind of currency:

```scheme
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
```

We could then call `cc` as follows:

```scheme
(cc 100 us-coins)
; 292
```

To do this will require changing the program `cc` somewhat. It will still have the same form, but it will access its second argument differently, as follows:

```scheme
(define (cc amount coin-values)
    (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
            (+ (cc amount
                    (except-first-denomination coin-values))
                (cc (- amount (first-denomination coin-values))
                    coin-values)))))
```

Define the procedures `first-denomination`, `except-first-denomination`, and `no-more?` in terms of primitive operations on list structures. Does the order of the list `coin-values` affect the answer produced by `cc`? Why or why not?

There's no influence, the procedure computes all the combinations.

### Exercise 2.20:

The procedures`+`, `*`, and `list` take arbitrary numbers of arguments. One way to define such procedures is to use `define` with _dotted-tail notation_. In a procedure definition, a parameter list that has a dot before the last parameter name indicates that, when the procedure is called, the initial parameters (if any) will have as values the initial arguments, as usual, but the final parameter???s value will be a _list_ of any remaining arguments. For instance, given the definition

```scheme
(define (f x y . z) ???body???)
```

Use this notation to write a procedure `same-parity` that takes one or more integers and returns a list of all the arguments that have the same even-odd parity as the first argument. For example,

```scheme
(same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)
(same-parity 2 3 4 5 6 7)
; (2 4 6)
```

### Exercise 2.21:

The procedure `square-list` takes a list of numbers as argument and returns a list of the squares of those numbers.

```scheme
(square-list (list 1 2 3 4))
; (1 4 9 16)
```

Here are two different definitions of `square-list`. Complete both of them by filling in the missing expressions:

```scheme
(define (square-list items)
    (if (null? items)
        nil
        (cons ???????? ????????)))
(define (square-list items)
    (map ???????? ????????))
```

## Exercise 2.22:

Louis Reasoner tries to rewrite the first `square-list` procedure of Exercise 2.21 so that it evolves an iterative process:

```scheme
(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                (cons (square (car things))
                      answer))))
    (iter items nil))
```

Unfortunately, defining `square-list` this way produces the answer list in the reverse order of the one desired. Why?

Louis then tries to fix his bug by interchanging the arguments to `cons`:

```scheme
(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                (cons answer
                      (square (car things))))))
    (iter items nil))
```

This doesn???t work either. Explain.

1. The squared value is added to the tail.

2. `(cons nil 1)` results in `(() . 1)`

### Exercise 2.23:

The procedure `for-each` is similar to `map`. It takes as arguments a procedure and a list of elements. However, rather than forming a list of the results, `for-each` just applies the procedure to each of the elements in turn, from left to right. The values returned by applying the procedure to the elements are not used at all???`for-each` is used with procedures that perform an action, such as printing. For example,

```scheme
(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))

; 57
; 321
; 88
```

The value returned by the call to `for-each` (not illustrated above) can be something arbitrary, such as true. Give an implementation of `for-each`.

### Exercise 2.24

Suppose we evaluate the expression `(list 1 (list 2 (list 3 4)))`. Give the result printed by the interpreter, the corresponding box-and-pointer structure, and the interpretation of this as a tree (as in Figure 2.6).

![](./Exercise2.24.jpeg)

### Exercise 2.25:

Give combinations of `car`s and `cdr`s that will pick 7 from each of the following lists:

```scheme
(1 3 (5 7) 9)
((7))
(1 (2 (3 (4 (5 (6 7))))))
```

![](./Exercise2.25.jpg)

### Exercise 2.26:

Suppose we define `x` and `y` to be two lists:

```scheme
(define x (list 1 2 3))
(define y (list 4 5 6))
```

What result is printed by the interpreter in response to evaluating each of the following expressions:

```scheme
(append x y)
(cons x y)
(list x y)
```

### Exercise 2.27:

Modify your reverse procedure of Exercise 2.18 to produce a `deep-reverse` procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists `deep-reversed` as well. For example,

```scheme
(define x (list (list 1 2) (list 3 4)))
x
; '((1 2) (3 4))
(reverse x)
; '((3 4) (1 2))
(deep-reverse x)
; '((4 3) (2 1))
```

### Exercise 2.28:

Write a procedure fringe that takes as argument a tree (represented as a list) and returns a list whose elements are all the leaves of the tree arranged in left-to-right order. For example,

```scheme
(define x (list (list 1 2) (list 3 4)))
(fringe x)
; (1 2 3 4)
(fringe (list x x))
; (1 2 3 4 1 2 3 4)

```

### Exercise 2.29:

A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a certain length, from which hangs either a weight or another binary mobile. We can represent a binary mobile using compound data by constructing it from two branches (for example, using `list`):

```scheme
(define (make-mobile left right)
    (list left right))
```

A branch is constructed from a `length` (which must be a number) together with a `structure`, which may be either a number (representing a simple weight) or another mobile:

```scheme
(define (make-branch length structure)
    (list length structure))
```

a. Write the corresponding selectors `left-branch` and `right-branch`, which return the branches of a mobile, and `branch-length` and `branch-structure`, which return the components of a branch.

b. Using your selectors, define a procedure `total-weight` that returns the total weight of a mobile.

c. A mobile is said to be _balanced_ if the torque applied by its top-left branch is equal to that applied by its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that rod is equal to the corresponding product for the right side) and if each of the submobiles hanging off its branches is balanced. Design a predicate that tests whether a binary mobile is balanced.

d. Suppose we change the representation of mobiles so that the constructors are

```scheme
(define (make-mobile left right) (cons left right))
(define (make-branch length structure)
    (cons length structure))
```

How much do you need to change your programs to convert to the new representation?

### Exercise 2.30:

Define a procedure `square-tree` analogous to the `square-list` procedure of Exercise 2.21. That is, `square-tree` should behave as follows:

```scheme
(square-tree (list 1
             (list 2 (list 3 4) 5)
             (list 6 7)))
; (1 (4 (9 16) 25) (36 49))
```

Define `square-tree` both directly (i.e., without using any higher-order procedures) and also by using `map` and recursion.

### Exercise 2.31:

Abstract your answer to Exercise 2.30 to produce a procedure `tree-map` with the property that `square-tree` could be defined as

```scheme
(define (square-tree tree) (tree-map square tree))
```

### Exercise 2.32:

We can represent a set as a list of distinct elements, and we can represent the set of all subsets of the set as a list of lists. For example, if the set is `(1 2 3)`, then the set of all subsets is `(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))`. Complete the following definition of a procedure that generates the set of subsets of a set and give a clear explanation of why it works:

```scheme
(define (subsets s)
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
            (append rest (map ???????? rest)))))
```

The set of all subsets of a given set is the union of:

the set of all subsets excluding the first number.
the set of all subsets excluding the first number, with the first number re-inserted into each subset

### Exercise 2.33:

Fill in the missing expressions to complete the following definitions of some basic list-manipulation operations as accumulations:

```scheme
(define (map p sequence)
    (accumulate (lambda (x y) ????????) nil sequence))
(define (append seq1 seq2)
    (accumulate cons ???????? ????????))
(define (length sequence)
    (accumulate ???????? 0 sequence))
```

### Exercise 2.34:

Evaluating a polynomial in _x_ at a given value of _x_ can be formulated as an accumulation. We evaluate the polynomial

a<sub>n</sub>_x_<sup>n</sup> + a<sub>n-1</sub>_x_<sup>n-1</sup> + ... + a<sub>1</sub>_x_ + a<sub>0</sub>

using a well-known algorithm called _Horner???s rule_, which structures the computation as

(...(a<sub>n</sub>_x_ + a<sub>n-1</sub>)_x_ + ... + a<sub>1</sub>)_x_ + a<sub>0</sub>.

In other words, we start with a<sub>n</sub>, multiply by _x_, add a<sub>n-1</sub>, multiply by _x_, and so on, until we reach a<sub>0</sub>.

Fill in the following template to produce a procedure that evaluates a polynomial using Horner???s rule. Assume that the coefficients of the polynomial are arranged in a sequence, from a<sub>0</sub> through a<sub>n</sub>.

```scheme
(define (horner-eval x coefficient-sequence)
    (accumulate (lambda (this-coeff higher-terms) ????????)
        0
        coefficient-sequence))
```

For example, to compute 1 + 3*x* + 5*x*<sup>3</sup> + _x_<sup>5</sup> at _x_ = 2 you would evaluate

```scheme
(horner-eval 2 (list 1 3 0 5 0 1))
```

### Exercise 2.35:

Redefine `count-leaves` from Section 2.2.2 as an accumulation:

```scheme
(define (count-leaves t)
    (accumulate ???????? ???????? (map ???????? ????????)))
```

### Exercise 2.36:

The procedure `accumulate-n` is similar to `accumulate` except that it takes as its third argument a sequence of sequences, which are all assumed to have the same number of elements. It applies the designated accumulation procedure to combine all the first elements of the sequences, all the second elements of the sequences, and so on, and returns a sequence of the results. For instance, if s is a sequence containing four sequences, `((1 2 3) (4 5 6) (7 8 9) (10 11 12))`, then the value of `(accumulate-n + 0 s)` should be the sequence `(22 26 30)`. Fill in the missing expressions in the following definition of `accumulate-n`:

```scheme
(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init ????????)
              (accumulate-n op init ????????))))
```

### Exercise 2.37:

Suppose we represent vectors **v** = (_v_<sub>_i_</sub>) as sequences of numbers, and matrices **m** = (_m_<sub>_ij_</sub>) as sequences of vectors (the rows of the matrix). For example, the matrix

```
1 2 3 4
4 5 6 6
6 7 8 9
```

is represented as the sequence `((1 2 3 4) (4 5 6 6) (6 7 8 9))`. With this representation, we can use sequence operations to concisely express the basic matrix and vector operations. These operations (which are described in any book on matrix algebra) are the following:

(dot-product v w) returns the sum ??<sub>_i_</sub>v<sub>_i_</sub>w<sub>_i_</sub>;

(matrix-*-vector m v) returns the vector **t**,
where t<sub>*i*</sub> =??<sub>*j*</sub>m<sub>*ij*</sub>v<sub>*j\*</sub>;

(matrix-*-matrix m n) returns the matrix **p**,
where p<sub>*ij*</sub> =??<sub>*k*</sub>m<sub>*ik*</sub>n<sub>*kj\*</sub>;

(transpose m) returns the matrix **n**,
where n<sub>_ij_</sub> =m<sub>_ij_</sub>.

We can define the dot product as

```scheme
(define (dot-product v w)
    (accumulate + 0 (map * v w)))
```

Fill in the missing expressions in the following procedures for computing the other matrix operations. (The procedure `accumulate-n` is defined in Exercise 2.36.)

```scheme
(define (matrix-*-vector m v)
    (map ???????? m))
(define (transpose mat)
    (accumulate-n ???????? ???????? mat))
(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map ???????? m)))
```

### Exercise 2.38:

The `accumulate` procedure is also known as `fold-right`, because it combines the first element of the sequence with the result of combining all the elements to the right. There is also a `fold-left`, which is similar to `fold-right`, except that it combines elements working in the opposite direction:

```scheme
(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                (cdr rest))))
    (iter initial sequence))
```

What are the values of

```scheme
(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))
```

Give a property that `op` should satisfy to guarantee that `fold-right` and `fold-left` will produce the same values for any sequence.

### Exercise 2.39:

Complete the following definitions of `reverse` (Exercise 2.18) in terms of `fold-right` and `fold-left` from Exercise 2.38:

```scheme
(define (reverse sequence)
    (fold-right (lambda (x y) ????????) nil sequence))
(define (reverse sequence)
    (fold-left (lambda (x y) ????????) nil sequence))
```

### Exercise 2.40:

Define a procedure `unique-pairs` that, given an integer _n_, generates the sequence of pairs (_i_, _j_) with 1 ??? _j_ < _i_ ??? _n_. Use `unique-pairs` to simplify the definition of `prime-sum-pairs` given above.

### Exercise 2.41:

Write a procedure to find all ordered triples of distinct positive integers _i_, _j_, and _k_ less than or equal to a given integer _n_ that sum to a given integer _s_.

### Exercise 2.42:

See page 169 of the book

### Exercise 2.43:

Louis Reasoner is having a terrible time doing Exercise 2.42. His `queens` procedure seems to work, but it runs extremely slowly. (Louis never does manage to wait long enough for it to solve even the 6 ?? 6 case.) When Louis asks Eva Lu Ator for help, she points out that he has interchanged the order of the nested mappings in the `flatmap`, writing it as

```scheme
(flatmap
    (lambda (new-row)
        (map (lambda (rest-of-queens)
                 (adjoin-position new-row k rest-of-queens))
             (queen-cols (- k 1))))
    (enumerate-interval 1 board-size))
```

Explain why this interchange makes the program run slowly. Estimate how long it will take Louis???s program to solve the eight-queens puzzle, assuming that the program in Exercise 2.42 solves the puzzle in time _T_.

Ans: For each cols(except the first one), the calculation would be k (number of rows) times of the prev one. And there are k cols, so the calculation time would be `k * (k - 1) * T`

### Exercise 2.44:

Define the procedure `up-split` used by `corner-split`. It is similar to `right-split`, except that it switches the roles of below and beside.

### Exercise 2.45:

`right-split` and `up-split` can be expressed as instances of a general splitting operation. Define a procedure split with the property that evaluating

```scheme
(define right-split (split beside below))
(define up-split (split below beside))
```

produces procedures `right-split` and `up-split` with the same behaviors as the ones already defined.

## Exercise 2.46:

A two-dimensional vector **v** running from the origin to a point can be represented as a pair consisting of an x-coordinate and a y-coordinate. Implement a data abstraction for vectors by giving a constructor `make-vect` and corresponding selectors `xcor-vect` and `ycor-vect`. In terms of your selectors and constructor, implement procedures `add-vect`, `sub-vect`, and `scale-vect` that perform the operations vector addition, vector subtraction, and multiplying a vector by a scalar:

```
(x1, y1) + (x2, y2) = (x1 + x2, y1 + y2),
(x1, y1) ??? (x2, y2) = (x1 ??? x2, y1 ??? y2),
s ?? (x , y) = (sx , sy).
```

## Exercise 2.47:

Here are two possible constructors for frames:

```scheme
(define (make-frame origin edge1 edge2)
    (list origin edge1 edge2))
(define (make-frame origin edge1 edge2)
    (cons origin (cons edge1 edge2)))
```

For each constructor supply the appropriate selectors to produce an implementation for frames.

## Exercise 2.48:

A directed line segment in the plane can be represented as a pair of vectors???the vector running from the origin to the start-point of the segment, and the vector running from the origin to the end-point of the segment. Use your vector representation from Exercise 2.46 to define a representation for segments with a constructor `make-segment` and selectors `start-segment` and `end-segment`.

## Exercise 2.49:

Use `segments->painter` to define the following primitive painters:

a. The painter that draws the outline of the designated frame.

b. The painter that draws an ???X??? by connecting opposite corners of the frame.

c. The painter that draws a diamond shape by connecting the midpoints of the sides of the frame.

d. The `wave` painter.

## Exercise 2.50:

Define the transformation `flip-horiz`, which flips painters horizontally, and transformations that rotate painters counterclockwise by 180 degrees and 270 degrees.

## Exercise 2.51:

Define the `below` operation for painters. `below` takes two painters as arguments. The resulting painter, given a frame, draws with the first painter in the bottom of the frame and with the second painter in the top. Define `below` in two different ways???first by writing a procedure that is analogous to the `beside` procedure given above, and again in terms of `beside` and suitable rotation operations (from Exercise 2.50).

## Exercise 2.52:

Make changes to the square limit of `wave` shown in Figure 2.9 by working at each of the levels described above. In particular:

a. Add some segments to the primitive `wave` painter of Exercise 2.49 (to add a smile, for example).

b. Change the pattern constructed by `corner-split` (for example, by using only one copy of the `up-split` and `right-split` images instead of two).

c. Modify the version of `square-limit` that uses `square-of-four` so as to assemble the corners in a different pattern. (For example, you might make the big Mr. Rogers look outward from each corner of the square.)
