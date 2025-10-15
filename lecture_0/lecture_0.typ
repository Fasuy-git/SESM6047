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

// mention singular or degenerate matrices and use the vector analogy to explain why these are an issue

//Add example of 2x2 and 3x3 matrices
