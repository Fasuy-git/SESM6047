#import "../template.typ": *

= Lecture 0

== Matrix Terminology

A matrix is a structured way of organizing data in a rectangular array with rows and columns. For this module the notation of a matrix and reference to matrix terms is shown in *@0-matrix-definition*.

$
  [K]_(i times j) = mat(
    k_(11), k_(12), ..., k_(1j);
    k_(21), k_(22), ..., k_(2j);
    dots.v, dots.v, dots.down, dots.v;
    k_(i 1), k_(i 2), ..., k_(i j)
  )_(i times j)
$<0-matrix-definition>

Where:
- *$[K]_(i times j)$*: The matrix $[K]$ (Note for this module a matrix will be defined by the $[]$ notation).
- *$i$*: The row index (indexed from 1).
- *$j$*: The column index (indexed from 2).
- *$i times j$*: The shape of the matrix (i number of rows, $j$ number of columns).
- *$k_(i j)$*: The item in the ith row and the jth column.

A special type of commonly used matrix is a *diagonal matrix* shown in *@0-diagonal-matrix*. This type of matrix  only features terms that sit on the indexes where the row index is equal to the column index ($i = j$).

$
  [K]_(i times j) = mat(
    k_(11), 0, ..., 0;
    0, k_(22), ..., 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, ..., k_(i j)
  )_(i times j)
$<0-diagonal-matrix>

== Vector Terminology

A vector is a quantity that has a *magnitude* as well as a *direction*. A vector is like one column out of a matrix, the number of terms signifies the dimensions of a vector, the notation used in this module for a vector is shown in *@0-vector-notation*.

$
  {q}_(i times 1) = vec(q_1, q_2, dots.v, q_i)_(i times 1)
$<0-vector-notation>

== Matrix Addition and Subtraction

Matrixes with the same shape can be added or subtracted. Matrix addition or subtraction is a *commutative* property and the process to do so is shown in *@0-matrix-addition-subtraction*.

$
  [A]_(i times j) plus.minus [B]_(i times j)
  \ =
  mat(
    a_(11), a_(12), ..., a_(1j);
    a_(21), a_(22), ..., a_(2j);
    dots.v, dots.v, dots.down, dots.v;
    a_(i 1), a_(i 2), ..., a_(i j)
  )_(i times j)
  plus.minus
  mat(
    b_(11), b_(12), ..., b_(1j);
    b_(21), b_(22), ..., b_(2j);
    dots.v, dots.v, dots.down, dots.v;
    b_(i 1), b_(i 2), ..., b_(i j)
  )_(i times j)
  =
  mat(
    a_(11) plus.minus b_(11), a_(12) plus.minus b_(12), ..., a_(1j) plus.minus b_(1j);
    a_(21) plus.minus b_(21), a_(22) plus.minus b_(22), ..., a_(2j) plus.minus b_(2j);
    dots.v, dots.v, dots.down, dots.v;
    a_(i 1) plus.minus b_(i 1), a_(i 2) plus.minus b_(i 2), ..., a_(i j) plus.minus b_(i j)
  )_(i times j)
  \ [A]_(i times j) plus.minus [B]_(i times j) = [B]_(i times j) plus.minus [A]_(i times j)
$<0-matrix-addition-subtraction>

== Matrix Multiplication

=== Scalar Multiplication

A scalar can be multiplied with a matrix or vector of any shape, the scalar value is multiplied with every term within the matrix, as shown in *@0-matrix-scalar-multiplication*.

$
  k[A]_(i times j)
  =
  k
  mat(
    a_(11), a_(12), ..., a_(1j);
    a_(21), a_(22), ..., a_(2j);
    dots.v, dots.v, dots.down, dots.v;
    a_(i 1), a_(i 2), ..., a_(i j)
  )_(i times j)
  =
  mat(
    k a_(11), k a_(12), ..., k a_(1j);
    k a_(21), k a_(22), ..., k a_(2j);
    dots.v, dots.v, dots.down, dots.v;
    k a_(i 1), k a_(i 2), ..., k a_(i j)
  )_(i times j)
$<0-matrix-scalar-multiplication>

=== Matrix Multiplication

Any two matrices can be multiplied as long as *the number of columns of the first matrix is the same as the number of rows in the second matrix*. Given this criteria is satisfied the formula to then multiply two matrices together is shown in *@0-matrix-multiplication*.

$
  [A]_(i times k) [B]_(k times j)
  =
  mat(
    a_(1 1), a_(1 2), ..., a_(1 k);
    a_(2 1), a_(2 2), ..., a_(2 k);
    dots.v, dots.v, dots.down, dots.v;
    a_(i 1), a_(i 2), ..., a_(i k)
  )_(i times k)
  mat(
    b_(1 1), b_(1 2), ..., b_(1 j);
    b_(2 1), b_(2 2), ..., b_(2 j);
    dots.v, dots.v, dots.down, dots.v;
    b_(k 1), b_(k 2), ..., b_(k j)
  )_(k times j)
  \ =
  mat(
    sum_(r:1)^k (a_(1 r) b_(r 1)), sum_(r:1)^k (a_(1 r) b_(r 2)), ..., sum_(r:1)^k (a_(1 r) b_(r j));
    sum_(r:1)^k (a_(2 r) b_(r 1)), sum_(r:1)^k (a_(2 r) b_(r 2)), ..., sum_(r:1)^k (a_(2 r) b_(r j));
    dots.v, dots.v, dots.down, dots.v;
    sum_(r:1)^k (a_(i r) b_(r 1)), sum_(r:1)^k (a_(i r) b_(r 2)), ..., sum_(r:1)^k (a_(i r) b_(r j))
  )_(i times j)
$<0-matrix-multiplication>

Note that matrix multiplication is *not commutable* ($[A]_(i times k) [B]_(k times j) eq.not [B]_(k times j) [A]_(i times k)$).
