#import "../template.typ": *

#lecture("Lecture 6", 1, 5)

== Solving Beam Questions

In a similar manner to solving rod and spring questions, an inversion of the stiffness matrix can be used to solve questions with beam elements. Take the scenario defined in *@6-beam-scenario*.

#figure(
  cetz.canvas({
    import draw: *
    //Wall
    wall((0, 0), 5)

    // Rod 1 and related lengths and arrows
    rod((0, 0), 3, 0.75, $bold(E_1),bold(I_1)$, -1.5, fill_color: rgb("#00b3ff"))
    length-label(0, 0.1, 2.5, 3, $bold(L_1)$)

    // Rod 2 and related lengths and arrows
    rod((3, 0), 3, 0.3, $bold(E_2),bold(I_2)$, -1.5, fill_color: rgb("#00ffe1"))
    length-label(3, 0.1, 2.5, 3, $bold(L_2)$)

    // Rotational DoFs
    circular-arrow-label((0, 0), $bold(q_2)$, content_x_shift: 1.25, content_y_shift: -0.75)
    circular-arrow-label((3, 0), $bold(q_4)$, content_x_shift: 0.9, content_y_shift: -0.75)
    circular-arrow-label((6, 0), $bold(q_6)$, content_x_shift: 0.9, content_y_shift: -0.75)

    // Vertical DoFs
    vertical-arrow-label((0, 0.1), 1, $bold(q_1)$, x_padding: 0.25)
    vertical-arrow-label((3, 0.1), 1, $bold(q_3)$, x_padding: 0.25)
    vertical-arrow-label((6, 0.1), 1, $bold(q_5)$, x_padding: 0.25)

    // Force
    vertical-arrow-label((6.1, 0), 1, $bold(F)$, horizontal_offset: 1, x_padding: 0.25)
  }),
  caption: [Scenario with two bema elements joined together.],
  supplement: [Figure],
  kind: figure,
)<6-beam-scenario>

The strain energies for the two elements defined in *@6-beam-scenario* is given  by the expression shown in *@6-beam-strain-energies*.

$
  U_1 = 1/2 vec(q_1, q_2, q_3, q_4,)_(1 times 4)^T ((E_1 I_1)/L_1^3)
  mat(
    12, 6L_1, -12, -6L_1;
    6L_1, 4L_1^2, -6L_1, 2L_1^2;
    -12, -6L_1, 12, -6L_1;
    6L_1, 2L_1^2, -6L_1, 4L_1^2
  )_(4 times 4)
  vec(q_1, q_2, q_3, q_4,)_(4 times 1)
  \
  U_2 = 1/2 vec(q_3, q_4, q_5, q_6)_(1 times 4)^T ((E_2 I_2)/L_2^3)
  mat(
    12, 6L_2, -12, -6L_2;
    6L_2, 4L_2^2, -6L_2, 2L_2^2;
    -12, -6L_2, 12, -6L_2;
    6L_2, 2L_2^2, -6L_2, 4L_2^2
  )_(4 times 4)
  vec(q_3, q_4, q_5, q_6)_(4 times 1)
$<6-beam-strain-energies>

The total strain energy will therefore be the sum of these two padded matrices, this is shown in *@6-beam-strain-energy* where $U = U_1 + U_2$ and the $E I "/" L^3$ are expanded before addition.

#let beam_strain_energy_6 = pavemat(
  $mat(
    "  ", "  ", "  ", "  ", " 0 ", " 0 ";
    , U_1, , , 0, 0;
    , , , , , ;
    , , , , , ;
    0, 0, , , U_2, ;
    0, 0, , , , ;
  )$,
  pave: (
    (path: "WWWWAAAASSSSDDDD", from: (4, 4)),
    (path: "WWWWAAAASSSSDDDD", from: (6, 6)),
  ),
  stroke: black + 1pt,
  fills: (
    "0-0": red.transparentize(80%),
    "3-3": purple.transparentize(60%),
    "5-5": blue.transparentize(80%),
  ),
  delim: "[",
)

$
  U = 1/2 vec(q_1, q_2, q_3, q_4, q_5, q_6)_(1 times 6)^T #beam_strain_energy_6 _(6 times 6)
  vec(q_1, q_2, q_3, q_4, q_5, q_6)_(6 times 1)
$<6-beam-strain-energy>

The next thing to develop is the potential energy of the system, to do this consider the reactions at the wall, not only is there a *reaction force* but there is also a *reaction moment*, this is shown in *@6-beam-potential-energy*.

$
  V = -W = - vec(R, M, 0, 0, 0, F)_(1 times 6)^T vec(q_1, q_2, q_3, q_4, q_5, q_6)_(6 times 1)
$<6-beam-potential-energy>

Substituting the force vector, stiffness matrix and displacement vector into the governing equation of equilibrium yields *@6-beam-governing-equation*.

#let reduced_stiffness_matrix_6 = pavemat(
  $mat(
    "  ", "  ", "  ", "  ";
    , , , ;
    , , , ;
    , , , ;
  )$,
  pave: (
    (path: "WWAASSDD", from: (2, 2)),
    (path: "WWWWAAAASSSSDDDD", from: (4, 4)),
  ),
  stroke: black + 1pt,
  fills: (
    "0-0": purple.transparentize(60%),
    "3-3": blue.transparentize(80%),
  ),
  delim: "[",
)

$
  #reduced_stiffness_matrix_6 _(4 times 4)vec(0, 0, 0, F)_(4 times 1) = vec(q_3, q_4, q_5, q_6)_(4 times 1)
$<6-beam-governing-equation>

== Calculating Intermittent Displacements

Say for the previous scenario, it was important to know the displacement at an intermittent point between two nodes, instead of formulating a new FE scenario, it is possible to use the shape functions as the displacements at the nodes are known, this is shown in *@6-intermittent-displacement*.

$
  w(x) = f_1 (x) q_1 + f_2 (x) q_2 + f_3 (x) q_3 + f_4 (x) q_4 \
  arrow.r w(x = L/2) = f_1 (L/2) q_1 + f_2 (L/2) q_2 + f_3 (L/2) q_3 + f_4 (L/2) q_4
$<6-intermittent-displacement>

== Stress and Strain for Beam Elements

It was previously states that deflections for beam elements of this formulation are assumed to be small so $tan(phi.alt) approx phi.alt$. Despite the entire beam element only deflecting in flexure, there still has to be a *local longitudinal deflection* to allow for flexure itself. This local longitudinal deflection is shown mathematically in *@6-local-deflection* and graphically in *@6-local-u-plot*.

#grid(
  columns: 2,
  [#figure(
    image("images/6-local-u.png", width: 30%),
    caption: [Plot of nodal displacement along the rod.],
    supplement: [Figure],
    kind: figure,
  )<6-local-u-plot>],
  [\ $
    u = -y phi.alt = -y (d w)/(d x) \
    epsilon_x = (d u)/(d x) = -y (d^2 w)/(d x^2)
  $<6-local-deflection>],
)

Taking the second derivative of the equation for flexural deformation $w(x)$ and rearranging it into a quasi matrix form yields *@6-beam-stress-strain*.

$
  epsilon_x = - y mat((-6/L^2 + (12x)/L^3), (-4/L + (6x)/L^2), (6/L^2 - (12x)/L^3), (-2/L + (6x)/L^2))_(1 times 4) vec(q_1, q_2, q_3, q_4)_(4 times 1)
  \
  epsilon_x = [B]_(1 times 4){q}_(4 times 1) quad
  sigma_x = [D]_(1 times 1)[B]_(1 times 4){q}_(4 times 1) = E[B]_(1 times 4){q}_(4 times 1)
$<6-beam-stress-strain>

In *@6-beam-stress-strain*, the strain is written as the product of a $[B]$ matrix and ${q}$ matrix which is the common convention. To then calculate the resulting stress, a further pre-multiplication is done by a $[D]$ matrix, which in a simple 1D case is just the Young's Modulus $E$.
