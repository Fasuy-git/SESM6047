#import "../template.typ": *

#lecture("Lecture 2", 1, 2)

== Formulating Problems using PMTPE

The finite element method allows for the simplification of complex problems by *assembeling* together diofferent elements. Take the scenario shown in *@2-spring-diagram-boundary-conditions*.

#figure(
  cetz.canvas({
    import "@preview/mechanical-system-cetz-34j:0.1.0": spring, wall
    import cetz.draw: *
    import circuiteria: *

    spring((0.5, 0), name: "spring_1", n: 7, stroke: red)
    spring((2.5, 0), name: "spring_2", n: 7, stroke: blue)

    wall((0, -1), b: (0, 1), name: "wall_top", inverse: true, inverse-lines: false)

    wall((0, -3), b: (0, -1.), name: "wall_bottom", inverse: true, inverse-lines: false)

    circle((2, 0), radius: 0.1, name: "node_1", stroke: red)
    circle((4, 0), radius: 0.1, name: "node_2", stroke: blue)

    line("spring_1", "wall_top", stroke: red)
    line("spring_1", "node_1", stroke: red)

    line("node_1", "spring_2", stroke: blue)
    line("spring_2", "node_2", stroke: blue)

    line("node_1", (2, -1.2), (3, -1.2), stroke: red)
    line("node_1", (2, -2.4), (3, -2.4), stroke: red)

    mark((3.4, -1.2), 0deg, symbol: "stealth", scale: 2, stroke: red)
    mark((3.4, -2.4), 0deg, symbol: "stealth", scale: 2, stroke: red)

    line("node_2", (4, -1.2), (5, -1.2), stroke: blue)
    line("node_2", (4, -2.4), (5, -2.4), stroke: blue)

    mark((5.4, -1.2), 0deg, symbol: "stealth", scale: 2, stroke: blue)
    mark((5.4, -2.4), 0deg, symbol: "stealth", scale: 2, stroke: blue)

    content((1.1, -0.6), $k_1$)
    content((3.1, -0.6), $k_2$)

    content((2.7, -1.7), $F_1$)
    content((2.7, -2.8), $q_2$)

    content((4.7, -1.7), $F_2$)
    content((4.7, -2.8), $q_3$)

    line((0, -1.2), (1, -1.2))
    mark((1.4, -1.2), 0deg, symbol: "stealth", scale: 2)
    content((0.7, -1.7), $R$)

    line((0, -2.4), (1, -2.4))
    mark((1.4, -2.4), 0deg, symbol: "stealth", scale: 2)
    content((0.7, -2.8), $q_1$)
  }),
  caption: [Two 1D springs attached to one another and a wall with boundary conditions defined.],
  supplement: [Figure],
  kind: figure,
)<2-spring-diagram-boundary-conditions>

Now that the scenario is defined, the  strain energies for the two springs can be written in their matrix form, this is shown in .

$
  U_1 = 1/2 k_1(q_2 - q_1)^2 quad arrow.r quad U_1 = 1/2 vec(q_1, q_2)_(1 times 2)^T mat(k_1, -k_1; -k_1, k_1)_(2 times 2) vec(q_1, q_2)_(2 times 1)
  \
  U_2 = 1/2 k_1(q_3 - q_2)^2 quad arrow.r quad U_2 = 1/2 vec(q_2, q_3)_(1 times 2)^T mat(k_2, -k_2; -k_2, k_2)_(2 times 2) vec(q_2, q_3)_(2 times 1)
$<2-strain-energies>

To find the total strain energy, these two components must be summed up. To achieve this, the matrix padding method shown in *@0-banded-matrix-example* to ensue that the matrices are the same size as well as that the vector matrixes are the same as one another. This process is shown in *@2-total-strain-energies*.

$
  U_1 = 1/2 vec(q_1, q_2)_(1 times 2)^T mat(k_1, -k_1; -k_1, k_1)_(2 times 2) vec(q_1, q_2)_(2 times 1)
  quad arrow.r quad
  U_1 = 1/2 vec(q_1, q_2, q_3)_(1 times 3)^T mat(k_1, -k_1, 0; -k_1, k_1, 0; 0, 0, 0)_(3 times 3) vec(q_1, q_2, q_3)_(3 times 1)
  \
  U_2 = 1/2 vec(q_2, q_3)_(1 times 2)^T mat(k_2, -k_2; -k_2, k_2)_(2 times 2) vec(q_2, q_3)_(2 times 1)
  quad arrow.r quad
  U_2 = 1/2 vec(q_1, q_2, q_3)_(1 times 3)^T mat(0, 0, 0; 0, k_2, -k_2; 0, -k_2, k_2;)_(3 times 3) vec(q_1, q_2, q_3)_(3 times 1)
  \
  therefore quad U = U_1 + U_2 =
  1/2 vec(q_1, q_2, q_3)_(1 times 3)^T
  mat(k_1, -k_1, 0; -k_1, k_1 + k_2, -k_2; 0, -k_2, k_2;)_(3 times 3)
  vec(q_1, q_2, q_3)_(3 times 1)
$<2-total-strain-energies>

Note that here, the stiffness matrix is called the *assembled stiffness matrix*. The potential energy of the system can be written in the form shown in *@2-potential-energy*.

$
  V = -(q_1 R + q_2 F_1 + q_3 F_2) quad arrow.r quad
  V = - mat(delim: "{", R, F_1, F_2)_(1 times 3) vec(q_1, q_2, q_3)_(3 times 1) = -{F}_(1 times 3)^T {q}_(3 times 1)
$<2-potential-energy>

Note that *@2-potential-energy* is still a scalar value which makes sense as $V$ is an energy. At this point the PMTPE condition can be applied, $(diff Pi(q_i)) / (diff q_i)$, to obtain a solution. Alternatively, the *governing equation of equilibrium* can be applied the system to obtain a solution, shown in *@2-governing-eq-equilibrium*.

$
  [K]{q} = {F} quad arrow.r quad mat(k_1, -k_1, 0; -k_1, k_1 + k_2, -k_2; 0, -k_2, k_2)_(3 times 3)vec(q_1, q_2, q_3)_(3 times 1) = vec(R, F_1, F_2)_(3 times 1)
$<2-governing-eq-equilibrium>

The next step to generate a solution is to invert the assembled matrix to find solutions for the ${q}$ matrix. However, currently the $[K]$ matrix is *singular*, as shown in *@2-singular-matrix*.

$
  {q} = [K]^(-1){F} quad arrow.r quad
  |K| = mat(delim: "|", k_1, -k_1, 0; -k_1, k_1 + k_2, -k_2; 0, -k_2, k_2) = 0
$<2-singular-matrix>

$[K]$ being singular (determinant is equal to zero) means the inverse matrix cannot be calculated. This is effectively because the scenario is unbounded and so turns into a dynamics problem as there is nothing containing or holding down the springs. We can fix this by applying a *boundary condition*, for *@2-spring-diagram-boundary-conditions* we will apply $q_1 = 0$ as the boundary condition, this effectively eliminates those rows from the governing equation of equilibrium and makes the determinant non-zero, this is shown in *@2-boundary-conditions*.

$
  "If" q_1 = 0 "then" quad arrow.r quad
  mat(
    cancel(cancel(k_1, angle: #90deg, length: #140%), angle: #0deg), cancel(-k_1, angle: #90deg, length: #200%), cancel(0, angle: #90deg, length: #300%);
    cancel(-k_1, angle: #0deg, length: #100%), k_1 + k_2, -k_2;
    cancel(0, angle: #0deg, length: #100%), -k_2, k_2
  )_(3 times 3)
  vec(
    cancel(q_1, angle: #90deg, length: #100%),
    q_2,
    q_3
  )_(3 times 1)
  =
  vec(
    cancel(R, angle: #90deg, length: #100%),
    F_1,
    F_2
  )_(3 times 1)
  \
  therefore quad
  mat(
    k_1 + k_2, -k_2;
    -k_2, k_2
  )_(2 times 2)vec(q_2, q_3)_(2 times 1) = vec(F_1, F_2)_(2 times 1)
$<2-boundary-conditions>


Note that the *crossed out rows and columns are not deleted, just temporarily ignored* and can be re-used once a solution for ${q}$ has been obtained to get a value for $R$. The assembled stiffness matrix with the boundary conditions applied shown in *@2-boundary-conditions* is no longer singular meaning that the scenario can be solved for ${q}$. The steps taken to solve any question using the finite element method and PMTPE are:

+ Write expressions for the elastic strain energies $U$ and potential energies $V$ per element.
+ Combine all of the $U$s and $V$s using padding and matrix form to create a global $[K]$.
+ Apply boundary conditions to the system to make $[K]$ non-singular.
+ Use ${q} = [K]^(-1){F}$ with ${F}$ from global $V$ equation and $[K]$ from global $U$ equation.
+ Obtain solutions for ${q}$.

#pagebreak()
