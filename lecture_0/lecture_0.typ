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

=== Scalar $times$ Matrix Multiplication

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

=== Matrix $times$ Matrix Multiplication

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

Note that matrix multiplication has some key properties associated with it, these are:

- *Non commutable* ($[A]_(i times k) [B]_(k times j) eq.not [B]_(k times j) [A]_(i times k)$).
- *Associative* ($[A]_(i times k) [B]_(k times l)) [C]_(l times j)
  = [A]_(i times k) ([B]_(k times l) [C]_(l times j)$)
- *Distributable* $[A]_(i times k) ([B]_(k times j) plus [C]_(k times j))
  = [A]_(i times k) [B]_(k times j) plus [A]_(i times k) [C]_(k times j)$

== Identity Matrix

The identity matrix is a special matrix with some key and is  is defined in *@0-identity-matrix*.

$
  I_(i j) = cases(
    1 #h(1cm) "if" i = j,
    0 #h(1cm) "if" i eq.not j
  )
  #h(2cm)
  [I]_(i times j) = mat(
    1, 0, ..., 0;
    0, 1, ..., 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, ..., 1
  )_(i times j)
$<0-identity-matrix>

Identity matrices *are* commutable and multiplication by an appropriately sized identity matrix will not itself change the value of the matrix, these properties are shown in.

$
  [I]_(i times i) [K]_(i times j)
  = [K]_(i times j)
  = [K]_(i times j) [I]_(j times j)
$<0-identity-matrix-properties>

== Matrix Transposition

The transpose of a matrix is signified by the $T$ symbol and will flip the matrix along the diagonal. The generalized expression for transposition is shown in *@0-matrix-transpose-definition*.

$
  [A]_(i times j) = [a_(i j)]
  quad arrow.r quad
  [A]^T_(j times i) = [a_(j i)]
  quad "where" quad ([A]^T)_(i j) = a_(j i)
$<0-matrix-transpose-definition>

For example the transpose of a general $3 times 2$ matrix is shown in *@0-matrix-transpose-example*.

$
  [A]_(3 times 2)
  = mat(a_(11), a_(12); a_(21), a_(22); a_(31), a_(32))_(3 times 2)
  quad arrow.r quad
  [A]^T_(2 times 3)
  = mat(a_(11), a_(21), a_(31); a_(12), a_(22), a_(32))_(2 times 3)
$<0-matrix-transpose-example>


== Matrix Determinant

The determinant of a matrix is a scalar-valued function of a *square matrix* (matrix must be square for there to exist a determinant). Determinants are symbolized via a $|$ and the general form of a determinant is shown in *@0-determinant-general-form*.

$
  "let" [A]_(n times n) = [a_(i j)]
  "then" quad
  det([A]) = sum_(j=1)^n (-1)^(i + j) a_(i j) det(M_(i j))
  quad \ "where" M_(i j) "is the minor of" a_(i j)
$<0-determinant-general-form>

Determinants can be long and repetitive to calculate for larger matrices, the determinant for a $2 times 2$ matrix is shown in *@0-determinant-2x2*.

$
  [A]_(2 times 2)
  = mat(a_(11), a_(12); a_(21), a_(22))_(2 times 2)
  quad arrow.r quad
  |[A]_(2 times 2)| =
  mat(delim: "|", a_(11), a_(12); a_(21), a_(22))
  = a_(11)a_(22) - a_(12)a_(21)
$<0-determinant-2x2>

Just for completion, the determinant for a $3 times 3$ matrix is shown in *@0-determinant-3x3*.

$
  [A]_(3 times 3)
  = mat(a_(11), a_(12), a_(13); a_(21), a_(22), a_(23); a_(31), a_(32), a_(33))_(3 times 3)
  quad arrow.r quad
  |[A]_(3 times 3)| = mat(delim: "|", a_(11), a_(12), a_(13); a_(21), a_(22), a_(23); a_(31), a_(32), a_(33)) \ =
  a_(11)
  mat(
    delim: "|",
    a_(22), a_(23);
    a_(32), a_(33)
  )
  - a_(12)
  mat(
    delim: "|",
    a_(21), a_(23);
    a_(31), a_(33)
  )
  + a_(13)
  mat(
    delim: "|",
    a_(21), a_(22);
    a_(31), a_(32)
  ) \ =
  a_(11)a_(22)a_(33)
  - a_(11)a_(23)a_(32)
  - a_(12)a_(21)a_(33)
  + a_(12)a_(23)a_(31)
  + a_(13)a_(21)a_(32)
  - a_(13)a_(22)a_(31)
$<0-determinant-3x3>

== Minor of an Element, Adjoint Matrix and Cofactor Matrix

The *adjoint* or *adjugate* matrix is a useful mathematical tool which will eventually allow us to be able to form the inverse of a matrix. Before defining the adjoint matrix, the minor of an element and the cofactor matrix must first be understood.

=== Minor of an Element

To find the minor of a given element, *the ith row and jth column of that element are deleted* and the *determinant of the remaining submatrix is the minor.* As an example, the minor of the $a_(12)$ element in a $3 times 3$ matrix is shown in *@0-minor-3x3-a12*.

$
  [A]_(3 times 3)
  = mat(a_(11), a_(12), a_(13); a_(21), a_(22), a_(23); a_(31), a_(32), a_(33))_(3 times 3)
  arrow.r
  quad
  M_(12) = mat(delim: "|", cancel(a_(11), angle: #90deg), cancel(cancel(a_(12), angle: #90deg), angle: #0deg), cancel(a_(13), angle: #90deg); a_(21), cancel(a_(22), angle: #0deg), a_(23); a_(31), cancel(a_(32), angle: #0deg), a_(33)) = mat(delim: "|", a_(21), a_(23); a_(31), a_(33)) = a_(21) a_(33) - a_(31) a_(23)
$<0-minor-3x3-a12>

=== Cofactor Matrix

The cofactor matrix utilizes the minor of every element within a matrix to form a new matrix, the general mathematical definition for what a cofactor matrix is, is shown in *@0-general-cofactor-definition*.

$
  "Cof"([A]_(i times j)) = mat(
    C_(11), C_(12), ..., C_(1j);
    C_(21), C_(22), ..., C_(2j);
    dots.v, dots.v, dots.down, dots.v;
    C_(i 1), C_(i 2), ..., C_(i j)
  )_(i times j)
  quad "Where" quad
  C_(i j) = (-1)^(i + j) "det"(M_(i j))
$<0-general-cofactor-definition>

Note that this equation is effectively calculating the minor of every element within a matrix and then adding the sign in a checkerboard form as shown in *@0-cofactor-checkerboard*.

$
  mat(
    plus, minus, plus, ...;
    minus, plus, minus, ...;
    plus, minus, plus, ...;
    dots.v, dots.v, dots.v, dots.down;
  )
$<0-cofactor-checkerboard>

The cofactor matrix for a general $2 times 2$ matrix is shown in *@0-cofactor-2x2*

$
  [A]_(2 times 2)
  = mat(a_(11), a_(12); a_(21), a_(22))_(2 times 2)
  \
  "Cof"([A])_(2 times 2)
  = mat(
    +M_(11), -M_(12);
    -M_(21), +M_(22),
  )
  =
  mat(
    a_(22), -a_(21);
    -a_(12), a_(11)
  )_(2 times 2)
$<0-cofactor-2x2>

The cofactor matrix for a general $3 times 3$ matrix is shown in *@0-cofactor-3x3*

$
  [A]_(3 times 3)
  = mat(
    a_(11), a_(12), a_(13);
    a_(21), a_(22), a_(23);
    a_(31), a_(32), a_(33)
  )_(3 times 3)
  \
  "Cof"([A])_(3 times 3)
  =
  mat(
    +M_(11), -M_(12), +M_(13);
    -M_(21), +M_(22), -M_(23);
    +M_(31), -M_(32), +M_(33)
  )_(3 times 3)
  =
  mat(
    +mat(delim: "|", a_(22), a_(23); a_(32), a_(33)), -mat(delim: "|", a_(21), a_(23); a_(31), a_(33)), +mat(delim: "|", a_(21), a_(22); a_(31), a_(32));
    -mat(delim: "|", a_(12), a_(13); a_(32), a_(33)), +mat(delim: "|", a_(11), a_(13); a_(31), a_(33)), -mat(delim: "|", a_(11), a_(12); a_(31), a_(32));
    +mat(delim: "|", a_(12), a_(13); a_(22), a_(23)), -mat(delim: "|", a_(11), a_(13); a_(21), a_(23)), +mat(delim: "|", a_(11), a_(12); a_(21), a_(22))
  )_(3 times 3)
  \ =
  mat(
    +(a_(22)a_(33) - a_(23)a_(32)), -(a_(21)a_(33) - a_(23)a_(31)), +(a_(21)a_(32) - a_(22)a_(31));
    -(a_(12)a_(33) - a_(13)a_(32)), +(a_(11)a_(33) - a_(13)a_(31)), -(a_(11)a_(32) - a_(12)a_(31));
    +(a_(12)a_(23) - a_(13)a_(22)), -(a_(11)a_(23) - a_(13)a_(21)), +(a_(11)a_(22) - a_(12)a_(21))
  )_(3 times 3)
$<0-cofactor-3x3>

=== Adjoint Matrix

To finish off, the adjoint matrix is just the *transposition of the cofactor matrix*, the general mathematical definition of teh adjoint matrix is shown in *@0-adjoint-definition*. Note that the adjoint and cofactor operations can only be done on *square matrices*.

$
  "Adj"([A_(i times j)]) = "Cof"([A_(i times j)])^T
$<0-adjoint-definition>

For completeness the adjoint of a general $2 times 2$ matrix is shown in *@0-adjoint-2x2* and for a  $3 times 3$ matrix in *@0-adjoint-3x3*.

$
  [A]_(2 times 2)
  = mat(a_(11), a_(12); a_(21), a_(22))_(2 times 2)
  quad arrow.r quad
  "Adj"([A]_(2 times 2))
  = mat(
    a_(22), -a_(12);
    -a_(21), a_(11)
  )_(2 times 2)
$<0-adjoint-2x2>

$
  [A]_(3 times 3)
  =
  mat(
    a_(11), a_(12), a_(13);
    a_(21), a_(22), a_(23);
    a_(31), a_(32), a_(33)
  )_(3 times 3)
  \
  "Adj"([A]_(3 times 3))
  =
  mat(
    (a_(22)a_(33) - a_(23)a_(32)), -(a_(12)a_(33) - a_(13)a_(32)), (a_(12)a_(23) - a_(13)a_(22));
    -(a_(21)a_(33) - a_(23)a_(31)), (a_(11)a_(33) - a_(13)a_(31)), -(a_(11)a_(23) - a_(13)a_(21));
    (a_(21)a_(32) - a_(22)a_(31)), -(a_(11)a_(32) - a_(12)a_(31)), (a_(11)a_(22) - a_(12)a_(21))
  )_(3 times 3)
$<0-adjoint-3x3>

== Inverse Matrix

The inversion of a matrix is a key tool within linear algebra and will act as a backbone for FEA in general. The mathematical definition to invert a matrix is shown in *@0-inverse-matrix-definition*.

$
  [A]_(i times j)^(-1) = 1/(|[A]_(i times j)|)"Adj"([A]_(i times j))
$<0-inverse-matrix-definition>

As *@0-inverse-matrix-definition* uses the reciprocal of the determinant of the matrix, it also means that the *value of the determinant cannot itself be zero*. A matrix with a determinant of zero is said to be *singular*, *degenerate* or *rank deficient*. Examples for the inverses of a $2 times 2$ matrix and a $3 times 3$ matrix are shown in *@0-inverse-2x2* and *@0-inverse-3x3* respectively.

$
  [A]_(2 times 2)
  = mat(a_(11), a_(12); a_(21), a_(22))_(2 times 2)
  quad arrow.r quad
  [A]^(-1)_(2 times 2)
  =
  frac(1, (a_(11)a_(22) - a_(12)a_(21)))
  mat(
    a_(22), -a_(12);
    -a_(21), a_(11)
  )_(2 times 2)
$<0-inverse-2x2>

$
  [A]_(3 times 3)
  =
  mat(
    a_(11), a_(12), a_(13);
    a_(21), a_(22), a_(23);
    a_(31), a_(32), a_(33)
  )_(3 times 3)
  \
  [A]^(-1)_(3 times 3)
  =
  frac(
    1,
    (a_(11)(a_(22)a_(33) - a_(23)a_(32))
      - a_(12)(a_(21)a_(33) - a_(23)a_(31))
      + a_(13)(a_(21)a_(32) - a_(22)a_(31)))
  ) ...\
  ... mat(
    (a_(22)a_(33) - a_(23)a_(32)), -(a_(12)a_(33) - a_(13)a_(32)), (a_(12)a_(23) - a_(13)a_(22));
    -(a_(21)a_(33) - a_(23)a_(31)), (a_(11)a_(33) - a_(13)a_(31)), -(a_(11)a_(23) - a_(13)a_(21));
    (a_(21)a_(32) - a_(22)a_(31)), -(a_(11)a_(32) - a_(12)a_(31)), (a_(11)a_(22) - a_(12)a_(21))
  )_(3 times 3)
$<0-inverse-3x3>

== Solving Systems of Equations Using matrices

Using the steps outlined before, it is possible to use matrices to solve a system of simultaneous equations. Lets say we have $n$ *linear* equations, and therefore $n$ number of unknowns, then the system of equations can be written in the form shown in *@0-system-of-equations*.

$
  cases(
    a_(11)x_1 + a_(12)x_2 + ... + a_(1n)x_n = b_1,
    a_(21)x_1 + a_(22)x_2 + ... + a_(2n)x_n = b_2,
    dots.v,
    a_(n 1)x_1 + a_(n 2)x_2 + ... + a_(n n)x_n = b_n
  )
$<0-system-of-equations>

The system of equations shown in *@0-system-of-equations* can then bbe written in the matrix form shown in *@0-simultaneous-equations-matrix*.

$
  [A]_(n times n)[X]_(n times 1) = [B]_(n times 1)
  \
  "where" quad
  [A]_(n times n)
  = mat(
    a_(11), a_(12), dots.h, a_(1n);
    a_(21), a_(22), dots.h, a_(2n);
    dots.v, dots.v, dots.down, dots.v;
    a_(n 1), a_(n 2), dots.h, a_(n n)
  )_(n times n)
  [X]_(n times 1)
  = mat(x_1; x_2; dots.v; x_n)_(n times 1)
  quad
  [B]_(n times 1)
  = mat(b_1; b_2; dots.v; b_n)_(n times 1)
$<0-simultaneous-equations-matrix>

Assuming that the $[X]_(n times 1)$ matrix is the set of unknowns, then the solution of this system can be found by inverting the $[A]_(n times n)$ matrix (this can be done as $[A]_(n times n)[A]_(n times n)^(-1) = [A]_(n times n)^(-1)[A]_(n times n) = [I]_(n times n)$), the form of this expression is shown in.

$
  [X]_(n times 1) = [B]_(n times 1)[A]_(n times n)^(-1) quad quad "Given" |[A]_(n times n)| eq.not 0
$

== Matrix Zero-Padding

It is possible to use many of the aforementioned tools to "pad" a matrix with zeroes, with some degree of control. Let there be a submatrix $[K]_(n times n)$ that we want to expand into a new matrix $overline(K)$ to a size $m times m$, with the $K$ matrix being in the top left of the $overline(K)$ matrix, then the multiplication shown in can be used *@0-zero-padding-general*.

$
  [K]_(n times n) = mat(
    k_(11), k_(12), ..., k_(1j);
    k_(21), k_(22), ..., k_(2j);
    dots.v, dots.v, dots.down, dots.v;
    k_(i 1), k_(i 2), ..., k_(i j)
  )_(n times n)
  arrow.r
  quad
  [overline(K)]_(n times n) = mat(
    k_(11), k_(12), ..., 0;
    k_(21), k_(22), ..., 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, ..., 0
  )_(m times m)
  \
  "Then [A] must have shape" quad quad
  [A]_(n times m) = mat(
    1, 0, ..., 0;
    0, 1, ..., 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, ..., 0
  )_(n times m)
  \
  therefore quad
  [overline(K)]_(n times n) = [A]_(m times n)^(T) [K]_(n times n) [A]_(n times m)
$<0-zero-padding-general>

As an example a $2 times 2$ matrix is embedded into a $5 times 5$ matrix using *@0-zero-padding-general*, this is shown in *@0-5x5-padded* .

$
  [K]_(2 times 2) = mat(k_(11), k_(12); k_(21), k_(22))_(2 times 5)
  quad quad
  [A]_(2 times 5) = mat(1, 0, 0, 0, 0; 0, 1, 0, 0, 0)_(2 times 5)
  \
  [overline(K)]_(5 times 5) = [A]_(5 times 2)^(T)[K]_(2 times 2)[A]_(2 times 5)
  \
  [overline(K)]_(5 times 5) = mat(1, 0; 0, 1; 0, 0; 0, 0; 0, 0)_(5 times 2) mat(k_(11), k_(12); k_(21), k_(22))_(2 times 5) mat(1, 0, 0, 0, 0; 0, 1, 0, 0, 0)_(2 times 5) =
  mat(
    k_(11), k_(12), 0, 0, 0;
    k_(21), k_(22), 0, 0, 0;
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0;
  )_(5 times 5)
$<0-5x5-padded>

Note that the placement of the $[K]$ matrix is dependant on where the ones are within the $[A]$ matrix. The further along the array the cascading ones are, the further down the diagonal the inserted  $[K]$ matrix is. This process can be used to make a *banded matrix*, which is shown in *@0-banded-matrix-example*.

$
  mat(
    k_(11), k_(12), 0, 0, 0;
    k_(21), k_(22), 0, 0, 0;
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0
  )_(5 times 5) +
  mat(
    0, 0, 0, 0, 0;
    0, k_(11), k_(12), 0, 0;
    0, k_(21), k_(22), 0, 0;
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0
  )_(5 times 5) +
  mat(
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0;
    0, 0, k_(11), k_(12), 0;
    0, 0, k_(21), k_(22), 0;
    0, 0, 0, 0, 0
  )_(5 times 5) +
  mat(
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0;
    0, 0, 0, k_(11), k_(12);
    0, 0, 0, k_(21), k_(22)
  )_(5 times 5)
  \ =
  mat(
    k_(1 1), k_(1 2), 0, 0, 0;
    k_(2 1), k_(2 2) + k_(1 1), k_(1 2), 0, 0;
    0, k_(2 1), k_(2 2) + k_(1 1), k_(1 2), 0;
    0, 0, k_(2 1), k_(2 2) + k_(1 1), k_(1 2);
    0, 0, 0, k_(2 1), k_(2 2)
  )_(5 times 5)
$<0-banded-matrix-example>

== Matrix Cutting

In a similar way to how a matrix can be padded, it can also be cut to reduce the shape. This process has the following steps:

+ Start with an identity matrix the same size as the matrix to shorten.

+ Delete the columns you want to remove from the main matrix, keeping it square (this also will delete the rows with the same index).

+ Pre-multiply by the transpose of this reduced identity matrix and post-multiply by the original matrix to obtain the reduced form.

*@0-matrix-cutting-example* Is an example of this where the 2nd, 3rd and 4th rows are removed from $[B]$.

$
  [B]_(5 times 5) = mat(
    b_(11), b_(12), b_(13), b_(14), b_(15);
    b_(21), b_(22), b_(23), b_(24), b_(25);
    b_(31), b_(32), b_(33), b_(34), b_(35);
    b_(41), b_(42), b_(43), b_(44), b_(45);
    b_(51), b_(52), b_(53), b_(54), b_(55);
  )_(5 times 5)
  \
  [I]_(5 times 5)= mat(
    1, 0, 0, 0, 0;
    0, 1, 0, 0, 0;
    0, 0, 1, 0, 0;
    0, 0, 0, 1, 0;
    0, 0, 0, 0, 1
  )_(5 times 2)
  arrow.r
  [C]_(5 times 3) = mat(
    1, cancel(0, angle: #0deg), 0, cancel(0, angle: #0deg), cancel(0, angle: #0deg);
    0, cancel(1, angle: #0deg), 0, cancel(0, angle: #0deg), cancel(0, angle: #0deg);
    0, cancel(0, angle: #0deg), 1, cancel(0, angle: #0deg), cancel(0, angle: #0deg);
    0, cancel(0, angle: #0deg), 0, cancel(1, angle: #0deg), cancel(0, angle: #0deg);
    0, cancel(0, angle: #0deg), 0, cancel(0, angle: #0deg), cancel(1, angle: #0deg)
  )_(5 times 2)
  = mat(
    1, 0;
    0, 0;
    0, 1;
    0, 0;
    0, 0;
  )_(5 times 2)
  \
  [overline(B)]_(2 times 2) = [C]_(2 times 5)^T [B]_(5 times 5)[C]_(5 times 3)
  \ =
  mat(
    1, 0, 0, 0, 0;
    0, 0, 1, 0, 0
  )_(2 times 5)
  mat(
    b_(11), b_(12), b_(13), b_(14), b_(15);
    b_(21), b_(22), b_(23), b_(24), b_(25);
    b_(31), b_(32), b_(33), b_(34), b_(35);
    b_(41), b_(42), b_(43), b_(44), b_(45);
    b_(51), b_(52), b_(53), b_(54), b_(55)
  )_(5 times 5)
  mat(
    1, 0;
    0, 0;
    0, 1;
    0, 0;
    0, 0
  )_(5 times 2)
  = mat(
    b_(11), b_(13);
    b_(31), b_(33)
  )_(2 times 2)
$<0-matrix-cutting-example>

== Vector Insertion and Cutting

=== Vector Insertion

Vector insertion is easier than matrices padding, the following steps are used:

#set enum(numbering: "1.a)")

+ Define a matrix with zeros that has the following properties:

  + Number of rows equals the final major dimension of the vector
  + Number of columns equals the current major dimension of the vector

+ Add ones within the columns to specify where the zeroes will be inserted (see *@0-vector-insertion*).

+ Pre-multiply by this matrix to obtain the modified column vector.

An example of this is shown in
*@0-vector-insertion* where zeroes are added before  and after $q_1$ yielding the modfied ${overline(q)}_(5 times 1)$.

$
  {q}_(3 times 1) = vec(q_1, q_2, q_3)_(3 times 1)
  [C]_(5 times 3) = mat(
    0, 0, 0;
    1, 0, 0;
    0, 0, 0;
    0, 1, 0;
    0, 0, 1;
  )_(5 times 3)
  \
  {overline(q)}_(5 times 1) = [C]_(5 times 3){q}_(3 times 1) =
  mat(
    0, 0, 0;
    1, 0, 0;
    0, 0, 0;
    0, 1, 0;
    0, 0, 1;
  )_(5 times 3)
  vec(q_1, q_2, q_3)_(3 times 1)
  =
  vec(0, q_1, 0, q_2, q_3)_(5 times 1)
$<0-vector-insertion>

=== Vector Cutting

This process is similar to insertion with the key difference being pre-multiplication by a differently shaped $[C]$ matrix:

+ Define a matrix with zeros that has the following properties:

  + Number of *columns* equals the final major dimension of the vector
  + Number of *rows* equals the current major dimension of the vector

+ Add ones within the columns to specify which values will be kept after the cut (see *@0-vector-cutting*).

+ Pre-multiply by this matrix to obtain the modified column vector.

An example of this is shown in *@0-vector-cutting* where the size of the vector is reduced by removing the first and third terms.

$
  {q}_(5 times 1) = vec(q_1, q_2, q_3, q_4, q_5)_(5 times 1)
  [C]_(5 times 3) = mat(
    0, 1, 0, 0, 0;
    0, 0, 0, 1, 0;
    0, 0, 0, 0, 1;
  )_(3 times 5)
  \
  {overline(q)}_(3 times 1) = [C]_(3 times 5){q}_(5 times 1) =
  mat(
    0, 1, 0, 0, 0;
    0, 0, 0, 1, 0;
    0, 0, 0, 0, 1;
  )_(3 times 5)
  vec(q_1, q_2, q_3, q_4, q_5)_(5 times 1)
  =
  vec(q_2, q_4, q_5)_(3 times 1)
$<0-vector-cutting>

== Eigenvalues and Eigenvectors

Eigenvectors are vectors with a key property, multiplying them with a matrix yields a vector with the same direction but with an altered magnitude (scales the vector). Mathematically we can write this in the form shown in *@0-eigenvalue-definition*.

$
  [A]_(n times n){X}_(n times 1) = lambda {X}_(n times 1)
$<0-eigenvalue-definition>

*@0-eigenvalue-formula* can be used to find the value of the eigenvalues, which will then allow for independent solutions for the eigenvectors.

$
  |[A]_(n times n) - lambda [I]_(n times n)| = 0
$<0-eigenvalue-formula>

Note that the determinant exists here as the solution to this equation itself has to be singular. An example calculation of the eigenvalues for a $2 times 2$ matrix is shown in *@0-eigenvalue-example*.

$
  [A]_(n times n) = mat(4, 1; 1, 3) quad arrow.r quad |[A]_(n times n) - lambda [I]_(n times n)| = 0 \
  mat(delim: "|", mat(4, 1; 1, 3) - lambda mat(1, 0; 0, 1)) = mat(delim: "|", 4-lambda, 1; 1, 3-lambda) = (4-lambda) (3-lambda) -2 = lambda^2-7lambda+10=0 \
  lambda_1 = 5 quad quad lambda_2 = 2
$<0-eigenvalue-example>

The results for the eigenvalues can be plugged back into the following formula to yield the eigenvectors *@0-eigenvector-formula*.
$
  ([A]_(n times n) - lambda [I]_(n times n))[X]_(n times 1) = 0
$<0-eigenvector-formula>
