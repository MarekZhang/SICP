## Chapter 1.3

### Exercise 1.29:

Simpson’s Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson’s Rule, the integral of a function f between a and b is approximated as

h / 3 \* (y<sub>0</sub> + 4y<sub>1</sub> + 2y<sub>2</sub> + 4y<sub>3</sub> + 2y<sub>4</sub> + ... + 4y<sub>n-1</sub> + y<sub>n</sub>),

where h = (b − a)/n, for some even integer n, and y<sub>k</sub> = f (a + kh). (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson’s Rule. Use your procedure to integrate `cube` between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the `integral` procedure shown above.

### Exercise 1.30:

The `sum` procedure above generates a linear recursion. The procedure can be rewritten so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in the following definition:

```scheme
(define (sum term a next b)
    (define (iter a result)
        (if ⟨??⟩
            ⟨??⟩
            (iter ⟨??⟩ ⟨??⟩)))
        (iter ⟨??⟩ ⟨??⟩))
```

### Exercise 1.31

a. The `sum` procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures. Write an analogous procedure called `product` that returns the product of the values of a function at points over a given range. Show how to define `factorial` in terms of `product`. Also use `product` to compute approximations to _π_ using the formula

<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{\pi}{4}=\frac{2&space;\cdot&space;4&space;\cdot&space;4&space;\cdot&space;6&space;\cdot&space;6&space;\cdot&space;8&space;\cdot&space;\cdot&space;\cdot&space;}{3&space;\cdot&space;3&space;\cdot&space;5&space;\cdot&space;5&space;\cdot&space;7&space;\cdot&space;7&space;\cdot&space;\cdot&space;\cdot&space;}." target="_blank"><img src="https://latex.codecogs.com/gif.latex?\frac{\pi}{4}=\frac{2&space;\cdot&space;4&space;\cdot&space;4&space;\cdot&space;6&space;\cdot&space;6&space;\cdot&space;8&space;\cdot&space;\cdot&space;\cdot&space;}{3&space;\cdot&space;3&space;\cdot&space;5&space;\cdot&space;5&space;\cdot&space;7&space;\cdot&space;7&space;\cdot&space;\cdot&space;\cdot&space;}." title="\frac{\pi}{4}=\frac{2 \cdot 4 \cdot 4 \cdot 6 \cdot 6 \cdot 8 \cdot \cdot \cdot }{3 \cdot 3 \cdot 5 \cdot 5 \cdot 7 \cdot 7 \cdot \cdot \cdot }." /></a>

b. If your `product` procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

### Exercise 1.32

a. Show that `sum` and `product` (Exercise 1.31) are both special cases of a still more general notion called `accumulate` that combines a collection of terms, using some general accumulation function:

```scheme
(accumulate combiner null-value term a next b)
```

`accumulate` takes as arguments the same term and range specifications as `sum` and `product`, together with
a `combiner` procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a `null-value` that specifies what base value to use when the terms
run out. Write `accumulate` and show how `sum` and `product` can both be defined as simple calls to `accumulate`.

b. If your `accumulate` procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

### Exercise 1.33

You can obtain an even more general version of `accumulate` (Exercise 1.32) by introducing the notion of a _filter_ on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting `filtered-accumulate` abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write `filtered-accumulate` as a procedure. Show how to express the following using `filtered-accumulate`:

a. the sum of the squares of the prime numbers in the interval _a_ to _b_ (assuming that you have a `prime?` predicate already written)

b. the product of all the positive integers less than _n_ that are relatively prime to _n_ (i.e., all positive integers _i_ < _n_ such that `GCD(i,n) = 1`).

### Exercise 1.34

Suppose we define the procedure

```scheme
(define (f g) (g 2))
```

Then we have

```scheme
(f square)
; 4
(f (lambda (z) (* z (+ z 1))))
; 6
```

What happens if we (perversely) ask the interpreter to evaluate the combination `(f f)`? Explain.

```scheme
(f f)
(f 2)
(2 2)
;error
```

### Exercise 1.35

Show that the golden ratio _φ_ (Section 1.2.2) is a fixed point of the transformation _x_ → 1 + 1/_x_, and use this fact to compute _φ_ by means of the `fixed-point` procedure.

### Exercise 1.36

Modify `fixed-point` so that it prints the sequence of approximations it generates, using the `newline` and `display` primitives shown in Exercise 1.22. Then find a solution to x<sup>x</sup> = 1000 by finding a fixed point of x → log(1000)/ log(`x`). (Use Scheme’s primitive `log` procedure, which computes natural logarithms.) Compare the number of steps this takes with and without average damping. (Note that you cannot start `fixed-point` with a guess of 1, as this would cause division by log(1) = 0.)

### Exercise 1.37

a. An infinite _continued_ fraction is an expression of the form

<a href="https://www.codecogs.com/eqnedit.php?latex=\dpi{200}&space;f&space;=&space;\frac{N_{1}}{D_{1}&space;&plus;&space;\frac{N_{2}}{D_{2}&space;&plus;&space;\frac{N_{3}}{D_{3}&space;&plus;&space;...}}}." target="_blank"><img src="https://latex.codecogs.com/gif.latex?\dpi{200}&space;f&space;=&space;\frac{N_{1}}{D_{1}&space;&plus;&space;\frac{N_{2}}{D_{2}&space;&plus;&space;\frac{N_{3}}{D_{3}&space;&plus;&space;...}}}." title="f = \frac{N_{1}}{D_{1} + \frac{N_{2}}{D_{2} + \frac{N_{3}}{D_{3} + ...}}}." /></a>

As an example, one can show that the infinite continued fraction expansion with the N<sub>i</sub> and the D<sub>i</sub> all equal to 1 produces 1/φ, where φ is the golden ratio (described in Section 1.2.2). One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation--a so-called _k-term finite continued fraction_—-has the form

<a href="https://www.codecogs.com/eqnedit.php?latex=\dpi{200}&space;\frac{N_{1}}{D_{1}&space;&plus;&space;\frac{N_{2}}{...&space;&plus;&space;\frac{N_{k}}{D_{k}&space;&plus;&space;...}}}." target="_blank"><img src="https://latex.codecogs.com/gif.latex?\dpi{200}&space;\frac{N_{1}}{D_{1}&space;&plus;&space;\frac{N_{2}}{...&space;&plus;&space;\frac{N_{k}}{D_{k}&space;&plus;&space;...}}}." title="\frac{N_{1}}{D_{1} + \frac{N_{2}}{... + \frac{N_{k}}{D_{k} + ...}}}." /></a>

Suppose that `n` and `d` are procedures of one argument (the term index _i_) that return the N<sub>i</sub> and D<sub>i</sub> of the terms of the continued fraction. Define a procedure `cont-frac` such that evaluating `(cont-frac n d k)` computes the value of the _k_-term finite continued fraction. Check your procedure by approximating 1/φ using

```scheme
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)
```

for successive values of `k`. How large must you make `k` in order to get an approximation that is accurate to 4 decimal places?

11

b. If your `cont-frac` procedure generates are cursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

### Exercise 1.38:

In 1737, the Swiss mathematician Leonhard Euler published a memoir _De Fractionibus Continuis_, which included a continued fraction expansion for e − 2, where e is the base of the natural logarithms. In this fraction, the N<sub>i</sub> are all 1, and the D<sub>i</sub> are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, . . .. Write a program that uses your `cont-frac` procedure from Exercise 1.37 to approximate e, based on Euler’s expansion.

### Exercise 1.39:

A continued fraction representation of the tangent function was published in 1770 by the German mathematician J.H. Lambert:

<img src="https://latex.codecogs.com/svg.image?tan&space;x&space;=&space;\frac{x}{1&space;-&space;\frac{x^{2}}{3&space;-&space;\frac{x^{2}}{5&space;-&space;...}}}" title="tan x = \frac{x}{1 - \frac{x^{2}}{3 - \frac{x^{2}}{5 - ...}}}" />

where _x_ is in radians. Define a procedure `(tan-cf x k)` that computes an approximation to the tangent function based on Lambert’s formula. `k` specifies the number of terms to compute, as in Exercise 1.37.

### Exercise 1.40:

Define a procedure `cubic` that can be used together with the `newtons-method` procedure in expressions of the form

```scheme
(newtons-method (cubic a b c) 1)
```

to approximate zeros of the cubic x<sup>3</sup> + ax<sup>2</sup> + bx + c.

### Exercise 1.41

Define a procedure `double` that takes a procedure of one argument as argument and returns a procedure that applies the original procedure twice. For example, if `inc` is a procedure that adds 1 to its argument, then `(double inc)` should be a procedure that adds 2. What value is returned by

```scheme
(((double (double double)) inc) 5)
```

### Exercise 1.42:

Let _f_ and _g_ be two one-argument functions. The _composition_ _f_ after _g_ is defined to be the function _x → f(g(x))_. Define a procedure `compose` that implements composition. For example, if `inc` is a procedure that adds 1 to its argument,

```scheme
((compose square inc) 6)
; 49
```

### Exercise 1.43:

If _f_ is a numerical function and n is a positive integer, then we can form the n<sup>th</sup> repeated application of _f_ , which is defined to be the function whose value at x is f(f(...(f(x))...)). For example, if _f_ is the function x → x + 1, then the n<sup>th</sup> repeated application of _f_ is the function x → x + n. If _f_ is the operation of squaring a number, then the n<sup>th</sup> repeated application of _f_ is the function that raises its argument to the 2<sup>n</sup>-th power. Write a procedure that takes as inputs a procedure that computes _f_ and a positive integer _n_ and returns the procedure that computes the n<sup>th</sup> repeated application of _f_ . Your procedure should be able to be used as follows:

```scheme
((repeated square 2) 5)
; 625
```

Hint: You may find it convenient to use `compose` from Exercise 1.42.

### Exercise 1.44:

The idea of _smoothing_ a function is an important concept in signal processing. If _f_ is a function and _dx_ is some small number, then the smoothed version of _f_ is the function whose value at a point _x_ is the average of f (x − dx), f (x), and f (x + dx). Write a procedure `smooth` that takes as input a procedure that computes _f_ and returns a procedure that computes the smoothed _f_. It is sometimes valuable to repeatedly smooth a function (that is, smooth the smoothed function, and so on) to obtain the _n-fold smoothed function_. Show how to generate the n-fold smoothed function of any given function using `smooth` and `repeated` from Exercise 1.43.

### Exercise 1.45:

We saw in Section 1.3.3 that attempting to compute square roots by naively finding a fixed point of y → x / y does not converge, and that this can be fixed by average damping. The same method works for finding cube roots as fixed points of the average-damped y → x / y<sup>2</sup>. Unfortunately, the process does not work for fourth roots—a single average damp is not enough to make a fixed-point search for y → x / y<sup>3</sup> converge. On the other hand, if we average damp twice (i.e., use the average damp of the average damp of y → x / y<sup>3</sup>) the fixed-point search does converge. Do some experiments to determine how many average damps are required to compute nth roots as a fixed-point search based upon repeated average damping of y → x / y<sup>n-1</sup>. Use this to implement a simple procedure for computing n<sup>th</sup> roots using `fixed-point`, `average-damp`, and the `repeated` procedure of Exercise 1.43. Assume that any arithmetic operations you need are available as primitives.

### Exercise 1.46:

Several of the numerical methods described in this chapter are instances of an extremely general computational strategy known as _iterative improvement_. Iterative improvement says that, to compute something, we start with an initial guess for the answer, test if the guess is good enough, and otherwise improve the guess and continue the process using the improved guess as the new guess. Write a procedure `iterative-improve` that takes two procedures as arguments: a method for telling whether a guess is good enough and a method for improving a guess. `iterative-improve` should return as its value a procedure that takes a guess as argument and keeps improving the guess until it is good enough. Rewrite the `sqrt` procedure of Section 1.1.7 and the `fixed-point` procedure of Section 1.3.3 in terms of `iterative-improve`.
