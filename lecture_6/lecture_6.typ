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

== Distributed Load on Beam Elements

#figure(
  cetz.canvas({
    wall((0, 0), 4)

    rod((0, 0), 5, 1, $bold(E),bold(I)$, -1)

    vertical-distributed-force((0, 0.5), 5, 1, 10, $bold(P_0)$)

    circular-arrow-label(
      (5.5, 0),
      $bold(M_0)$,
      start_angle: 60deg,
      end_angle: -60deg,
      represent_moment: true,
      content_x_shift: 1.8,
      mark_offset_angle: 1deg,
      moment_coordinate: (6, -0.4),
    )

    length-label(0, -0.1, -2, 5, $bold(L)$, line-offset: -0, y-padding: -0.4)

    // Rotational DoFs
    circular-arrow-label((0, 0), $bold(q_2)$, content_x_shift: 1.25, content_y_shift: -0.75)
    circular-arrow-label((5, 0), $bold(q_4)$, content_x_shift: 1.25, content_y_shift: -0.75)

    // Vertical DoFs
    vertical-arrow-label((0, 0.1), 1.75, $bold(q_1)$, x_padding: 0.25)
    vertical-arrow-label((5, 0.1), 1.75, $bold(q_3)$, x_padding: 0.25)
  }),
  caption: [Distributed load applied on a beam element.],
  supplement: [Figure],
  kind: figure,
)<6-distributed-force-on-beam>

Consider the scenario defined in *@6-distributed-force-on-beam*, with a distributed load and a moment applied at the RHS of a beam element. In a similar way to the formulation of a distributed load on an elastic rod, the distributed force on a beam element is written in the following way *@6-distributed-load-beam*.

$
  ((E I)/L^3)
  mat(
    12, 6L, -12, -6L;
    6L, 4L^2, -6L, 2L^2;
    -12, -6L, 12, -6L;
    6L, 2L^2, -6L, 4L^2
  )_(4 times 4)
  vec(q_1, q_2, q_3, q_4,)_(4 times 1)
  =
  vec(
    p_0 integral_0^L f_1 (x) d x,
    p_0 integral_0^L f_2 (x) d x,
    p_0 integral_0^L f_3 (x) d x,
    p_0 integral_0^L f_4 (x) d x,
  )
  +
  vec(
    R,
    M,
    0,
    -M_0
  )
$<6-distributed-load-beam>

== Adding a Grounded Spring

Grounded springs can be added to the stiffness matrices to change the dynamics of systems, take a grounded spring added vertically to the scenario defined in *@6-distributed-force-on-beam*, shown in *@6-distributed-force-on-beam-trans-grounded*.

#figure(
  cetz.canvas({
    wall((0, 0), 4)

    rod((0, 0), 5, 1, $bold(E),bold(I)$, -1)

    vertical-distributed-force((0, 0.5), 5, 1, 10, $bold(P_0)$)

    circular-arrow-label(
      (5.5, 0),
      $bold(M_0)$,
      start_angle: 60deg,
      end_angle: -60deg,
      represent_moment: true,
      content_x_shift: 1.8,
      mark_offset_angle: 1deg,
      moment_coordinate: (6, -0.4),
    )

    length-label(0, -2, -2, 5, $bold(L)$, line-offset: -0, y-padding: -0.4)

    // Rotational DoFs
    circular-arrow-label((0, 0), $bold(q_2)$, content_x_shift: 1.25, content_y_shift: -0.75)
    circular-arrow-label((5, 0), $bold(q_4)$, content_x_shift: 0, content_y_shift: -0.25)

    // Vertical DoFs
    vertical-arrow-label((0, 0.1), 1.75, $bold(q_1)$, x_padding: 0.25)
    vertical-arrow-label((5, 0.1), 1.75, $bold(q_3)$, x_padding: 0.25)

    wall((-2, -5), 2, rotation_angle: 90deg)
    // Spring and wall
    spring(
      (-2, -5),
      2,
      0.5,
      4,
      $bold(k)$,
      connector_length_perc: 25,
      content_y_shift: 1.75,
      color: orange,
      rotation_angle: 90deg,
    )
  }),
  caption: [Translational grounded spring added to *@6-distributed-force-on-beam*],
  supplement: [Figure],
  kind: figure,
)<6-distributed-force-on-beam-trans-grounded>

This change only results in a change to the stiffness matrix, not the force vector, the altered stiffness matrix is shown in *@6-distributed-load-beam-trans-grounded*.

#let colorange(x) = text(fill: orange, $#x$)
$
  U = U_1 + U_("spring") = U_1 + 1/2 k q_3^2
  \
  U =
  1/2
  ((E I)/L^3)
  vec(q_1, q_2, q_3, q_4,)_(1 times 4)
  mat(
    12, 6L, -12, -6L;
    6L, 4L^2, -6L, 2L^2;
    -12, -6L, 12 colorange(bold(+ L^3/(E I) k)), -6L;
    6L, 2L^2, -6L, 4L^2
  )_(4 times 4)
  vec(q_1, q_2, q_3, q_4,)_(4 times 1)
$<6-distributed-load-beam-trans-grounded>

Note that the this spring stiffness is only applied to the element in the stiffness matrix which corresponds to the $q_3^2$. Also note the factor it is pre-multiplied by,m this cancels out the effect from $E I "/" L^3$. Also consider a grounded rotational spring, shown in *@6-distributed-force-on-beam-rot-grounded*.

#figure(
  cetz.canvas({
    let x_offset = -2.5
    let y_offset = 2.5

    wall((x_offset, y_offset), 4)

    rod((x_offset, y_offset), 5, 1, $bold(E),bold(I)$, 1.5)

    vertical-distributed-force((x_offset, y_offset + 0.5), 5, 1, 10, $bold(P_0)$)

    circular-arrow-label(
      (x_offset + 6, y_offset),
      $bold(M_0)$,
      start_angle: 60deg,
      end_angle: -60deg,
      represent_moment: true,
      content_x_shift: 1.8,
      mark_offset_angle: 1deg,
      moment_coordinate: (6.5 + x_offset, -0.4 + y_offset),
    )

    length-label(x_offset, y_offset - 0.1, 0.5, 5, $bold(L)$, line-offset: -0, y-padding: -0.4)

    // Rotational DoFs
    circular-arrow-label((x_offset, y_offset), $bold(q_2)$, content_x_shift: 1.25, content_y_shift: -0.75)
    circular-arrow-label((x_offset + 5, y_offset), $bold(q_4)$, content_x_shift: 0, content_y_shift: -0.25)

    // Vertical DoFs
    vertical-arrow-label((x_offset, y_offset + 0.1), 1.75, $bold(q_1)$, x_padding: 0.25)
    vertical-arrow-label((x_offset + 5, y_offset + 0.1), 1.75, $bold(q_3)$, x_padding: 0.25)

    // Spring and wall
    rotational_spring(150, 6, 5)
    cetz.draw.content((3, 1.3), $bold(k')$)
  }),
  caption: [Rotational grounded spring added to *@6-distributed-force-on-beam*],
  supplement: [Figure],
  kind: figure,
)<6-distributed-force-on-beam-rot-grounded>

Similar to *@6-distributed-force-on-beam-trans-grounded*, the rotational spring only affects the stiffness matrix, this is shown in *@6-distributed-load-beam-rot-grounded*.

$
  U = U_1 + U_("spring") = U_1 + 1/2 k' q_4^2
  \
  U =
  1/2
  ((E I)/L^3)
  vec(q_1, q_2, q_3, q_4,)_(1 times 4)
  mat(
    12, 6L, -12, -6L;
    6L, 4L^2, -6L, 2L^2;
    -12, -6L, 12, -6L;
    6L, 2L^2, -6L, 4L^2 colorange(bold(+ L^3/(E I) k'))
  )_(4 times 4)
  vec(q_1, q_2, q_3, q_4,)_(4 times 1)
$<6-distributed-load-beam-rot-grounded>

== Boundary Conditions

Boundary conditions allow for a solution to an FE problem, so far wall conditions have been considered where for beams $q_1 = R = 0$ and $q_2 = M = 0$. Note that intermediate boundary conditions are also possible, shown in *@6-boundary-conditions*.


#figure(
  cetz.canvas({
    wall((0, 0), 4)

    rod((0, 0), 5, 1, "", -1)
    rod((5, 0), 5, 1, "", -1)

    cetz.draw.polygon((5, -0.85), 3, angle: 90deg, fill: rgb("#00d5ff"), radius: 0.75)

    wall((-1.25, -5), 2, rotation_angle: 90deg)
    cetz.draw.circle((9, -0.73), radius: 0.2, fill: rgb("#f68f8f"))
    cetz.draw.circle((9.6, -0.73), radius: 0.2, fill: rgb("#f68f8f"))

    cetz.draw.circle((9, 0.73), radius: 0.2, fill: rgb("#f68f8f"))
    cetz.draw.circle((9.6, 0.73), radius: 0.2, fill: rgb("#f68f8f"))

    cetz.draw.rect((8.6, 1.25), (10, 0.95), fill: rgb("#f68f8f"))

    cetz.draw.rect((8.6, -1.25), (10, -0.95), fill: rgb("#f68f8f"))

    wall((-1.27, -9.3), 2, rotation_angle: 90deg)
    wall((-1.27, 9.3), 2, rotation_angle: -90deg)

    cetz.draw.content((1.25, 1), $bold(q_1 = R = 0 \ q_2 = M = 0)$)
    cetz.draw.content((5, 1), $bold(q_3 = R = 0 \ q_4 = M = "Free")$)
    cetz.draw.content((12, 1), $bold(q_5 = R = "Free" \ q_6 = M = 0)$)
  }),
  caption: [Translational grounded spring added to *@6-distributed-force-on-beam*],
  supplement: [Figure],
  kind: figure,
)<6-boundary-conditions>

== Beam-Rod Elements

Beam elements can only deform in flexure and rod elements in extension, a *beam-rod* (sometimes called beam-column) elements can do both by essentially placing a rod element over a beam element, shown in *@6-general-1d-beam-rod*, *@6-general-1d-beam-rod-DoFs*.

#grid(
  columns: 2,
  column-gutter: 1cm,
  [#figure(
    canvas({
      import draw: *

      length-label(0, -2.5, 1.5, 7, $bold(L)$)

      // Deformed Beam
      let point_i = (0, 0)
      let point_f = (8, -2.5)
      let beam_height = 0.5

      let (x_i, y_i) = (point_i.at(0), point_i.at(1))
      let (x_f, y_f) = (point_f.at(0), point_f.at(1))

      merge-path(fill: rgb("#eef5f4"), stroke: 0pt, {
        bezier(
          (x_i, y_i + beam_height / 2),
          (x_f, y_f + beam_height / 2),
          (x_f / 3, y_i + beam_height / 2),
          (2 * x_f / 3, y_f + beam_height / 2),
        )

        bezier(
          (x_i, y_i - beam_height / 2),
          (x_f, y_f - beam_height / 2),
          (x_f / 3, y_i - beam_height / 2),
          (2 * x_f / 3, y_f - beam_height / 2),
        )

        line((x_i, y_i + beam_height / 2), (x_i, y_i - beam_height / 2))

        line((x_f, y_f + beam_height / 2), (x_f, y_f - beam_height / 2))
      })

      bezier(
        (x_i, y_i + beam_height / 2),
        (x_f, y_f + beam_height / 2),
        (x_f / 3, y_i + beam_height / 2),
        (2 * x_f / 3, y_f + beam_height / 2),
      )

      bezier(point_i, point_f, (x_f / 3, y_i), (2 * x_f / 3, y_f), stroke: (dash: "dashed", thickness: 0.6pt))

      bezier(
        (x_i, y_i - beam_height / 2),
        (x_f, y_f - beam_height / 2),
        (x_f / 3, y_i - beam_height / 2),
        (2 * x_f / 3, y_f - beam_height / 2),
      )

      circle(point_f, fill: white, radius: 0.25)

      // Rod before deformation
      rod((0, 0), 7, 0.5, $bold(E),bold(I), bold(A)$, -1, node_radi: 0.25, content_string_x_shift: -2)

      // Centerline of undeformed rod
      line((0.25, 0), (6.75, 0), stroke: (dash: "dashed", thickness: 0.6pt))

      // Dx label
      length-label(4, 0, -0.75, 1, $bold(d x)$, inner: false, line-offset: -0.1, x-padding: 1.2, y-padding: 0.2)

      // Displacement arrow and label
      line((4.5, 0), (4.5, -1.45))
      mark((4.5, -1.5), 270deg, symbol: "stealth", scale: 1.5, fill: black)
      content((5.3, -1.2), $bold(w(x))$)

      // x arrow and label
      line((0, -1.5), (4.25, -1.5))
      mark((4.5, -1.49), 0deg, symbol: "stealth", scale: 1.5, fill: black)
      content((4, -1.8), $bold(x)$)

      // u(x) arrow and label
      line((7.25, 0), (7.9, 0))
      mark((8, 0), 0deg, symbol: "stealth", scale: 1.5, fill: black)
      content((7.5, -0.5), $bold(u(x))$)
      line((8, 0), (8, -2.3), stroke: (dash: "dashed", thickness: 0.6pt))
    }),
    caption: [General 1D beam-rod element],
    supplement: [Figure],
    kind: figure,
  )<6-general-1d-beam-rod>],
  [#figure(
    canvas({
      rod((0, 0), 5, 1, $bold(E),bold(I),bold(A)$, -1)

      // Rotational DoFs
      circular-arrow-label((0, 0), $bold(q_3)$, content_x_shift: 0.5, content_y_shift: -0.75)
      circular-arrow-label((5, 0), $bold(q_6)$, content_x_shift: 0.5, content_y_shift: -0.75)

      // Vertical DoFs
      vertical-arrow-label((0, 0.1), 1.75, $bold(q_2)$, x_padding: 0.25)
      vertical-arrow-label((5, 0.1), 1.75, $bold(q_5)$, x_padding: 0.25)

      // Horizontal DoFs
      arrow-label(0, -0.1, -1.5, $bold(q_1)$)
      arrow-label(5, -0.1, -1.5, $bold(q_4)$)
    }),
    caption: [DoFs for a beam-rod element],
    supplement: [Figure],
    kind: figure,
  )<6-general-1d-beam-rod-DoFs>],
)

The stiffness matrix for a beam-rod element is an assembly of both a rod and beam element, this is shown in *@6-beam-rod-stiffness*, where the red sections are from a rod element and blue for a beam element.

#let rod_beam_stiffness_6 = pavemat(
  $mat(
    (E A)/L, 0, 0, -(E A)/L, 0, 0;
    0, (E A)/L^3 (12), (E A)/L^3 (6L), 0, (E A)/L^3 (-12), (E A)/L^3 (6L);
    0, (E A)/L^3 (6L), (E A)/L^3 (4L^2), 0, (E A)/L^3 (-6L), (E A)/L^3 (2L^2);
    -(E A)/L, 0, 0, (E A)/L, 0, 0;
    0, (E A)/L^3 (-12), (E A)/L^3 (-6L), 0, (E A)/L^3 (12), (E A)/L^3 (-6L);
    0, (E A)/L^3 (6L), (E A)/L^3 (2L^2), 0, (E A)/L^3 (-6L), (E A)/L^3 (4L^2);
  )$,
  pave: (
    (path: "WASD", from: (1, 1)),
    (path: "WASD", from: (1, 4)),
    (path: "WASD", from: (4, 1)),
    (path: "WASD", from: (4, 4)),
    (path: "WWAASSDD", from: (3, 3)),
    (path: "WWAASSDD", from: (6, 3)),
    (path: "WWAASSDD", from: (3, 6)),
    (path: "WWAASSDD", from: (6, 6)),
  ),
  stroke: black + 1pt,
  fills: (
    "[0-0]": red.transparentize(80%),
    "[0-3]": red.transparentize(80%),
    "[3-0]": red.transparentize(80%),
    "[3-3]": red.transparentize(80%),
    "1-1": blue.transparentize(80%),
    "4-1": blue.transparentize(80%),
    "1-4": blue.transparentize(80%),
    "4-4": blue.transparentize(80%),
  ),
)

$
  U = 1/2 vec(q_1, q_2, q_3, q_4, q_5, q_6)_(1 times 6)^T
  #rod_beam_stiffness_6 _(6 times 6)
  vec(q_1, q_2, q_3, q_4, q_5, q_6)_(6 times 1)
$<6-beam-rod-stiffness>


