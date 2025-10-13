#import "../template.typ": *

= Lecture 0

== Matrix Terminology

A matrix is a structured way of organizing data in a rectangular array with rows and columns. For this module the notation of a matrix and reference to matrix terms is shown in *@0-matrix-definition*.

$
  bold(K) = mat(
    k_(11), k_(12), ..., k_(1j);
    k_(21), k_(22), ..., k_(2j);
    dots.v, dots.v, dots.down, dots.v;
    k_(i 1), k_(i 2), ..., k_(i j)
  )_(i times j)
$<0-matrix-definition>

Where:
- *$bold(K)$*: The matrix $bold(K)$ (Note for this module a matrix will be defined as a bold capital letter).
- *$i$*: The row index (indexed from 1).
- *$j$*: The column index (indexed from 2).
- *$i times j$*: The shape of the matrix (i number of rows, $j$ number of columns).
- *$k_(i j)$*: The item in the ith row and the jth column.

A special type of commonly used matrix is a *diagonal matrix* shown in *@0-diagonal-matrix*. This type of matrix  only features terms that sit on the indexes where the row index is equal to the column index ($i = j$).

$
  bold(K) = mat(
    k_(11), 0, ..., 0;
    0, k_(22), ..., 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, ..., k_(i j)
  )_(i times j)
$<0-diagonal-matrix>

== Vector Terminology
