#import "../template.typ": *

#lecture("Lecture 4", 1, 3)

== Stiffness Matrix for Elastic Rods

To derive an expression which will include the stiffness matrix, the strain energy equation for elastic rods (shown in *@3-strain-energy-elastic-rod-3*) can be combined with the equation for strain of the elastic rod (shown in *@3-elastic-rod-stress-strain*) to yield *@4-elastic-strain-energy-1*.

$
  U = 1/2 integral E A epsilon_x^2 d x quad arrow.r quad U = 1/2 integral E A [(-1/L)q_1 + (1/L)q_2]^2 d x
$<4-elastic-strain-energy-1>

The equation shown in *@4-elastic-strain-energy-1* can be simplified and then integrated to yield []. The resulting quadratic form can be rewritten in matrix form to include the stiffness matrix, also shown in *@4-elastic-strain-energy-2*.

$
  U = 1/2 ((E A)/L^2)(-q_1 + q_2)^2 integral_0^L 1 d x = 1/2 ((E A)/L)(-q_1 + q_2)^2 = 1/2 ((E A)/L)(q_1^2-2 q_1 q_2 + q_2^2) \
  U = 1/2 ((E A)/L) vec(q_1, q_2)_(1 times 2)^T mat(1, -1; -1, 1)_(2 times 2) vec(q_1, q_2)_(2 times 1) quad "or" quad
  U = 1/2 vec(q_1, q_2)_(1 times 2)^T mat((E A)/L, -(E A)/L; -(E A)/L, (E A)/L)_(2 times 2) vec(q_1, q_2)_(2 times 1)
$<4-elastic-strain-energy-2>

Where the *stiffness matrix* is shown in the bottom right equation with dimensions $2 times 2$.

== Solving a Simple Elastic Rod scenario

The process of solving a question with elastic rods is similar to the spring scenario shown earlier, consider the scenario defined in *@4-elastic-rods-scenario*.

#figure(
  cetz.canvas({
    import "@preview/mechanical-system-cetz-34j:0.1.0": spring, wall
    import cetz.draw: *
    import circuiteria: *

    wall((0, -2), b: (0, 1.5), name: "wall", inverse: true, inverse-lines: false)

    // Rectangle #1
    rect(
      (0, 0),
      (3, 0.5),
      fill: rgb("#00b3ff"),
      stroke: black,
    )

    // Rectangle #2
    rect(
      (3, 0.75),
      (6, -0.25),
      fill: rgb("#00ffe1"),
      stroke: black,
    )

    // Nodes
    circle((0, 0.25), radius: .1, fill: white)
    circle((3, 0.25), radius: .1, fill: white)
    circle((6, 0.25), radius: .1, fill: white)

    // Length lines and datums
    line((3, 0.35), (3, 1.5))
    line((0, 1.2), (3, 1.2), mark: (symbol: "stealth", scale: 1.5))
    content((1.5, 1.5), $bold(L_1)$)

    line((6, 0.35), (6, 1.5))
    line((3, 1.2), (6, 1.2), mark: (symbol: "stealth", scale: 1.5))
    content((4.5, 1.5), $bold(L_2)$)

    // Rod properties labels
    content((1.5, -0.75), $bold(E_1 "," A_1)$)
    content((4.5, -0.75), $bold(E_2 "," A_2)$)

    // q_1 line
    line((0, -1.5), (1, -1.5))
    mark((1.25, -1.5), 0deg, symbol: "stealth", scale: 1.5)
    content((1.6, -1.45), $bold(q_1)$)

    // q_2 line
    line((3, 0), (3, -1.5), (4, -1.5))
    mark((4.25, -1.5), 0deg, symbol: "stealth", scale: 1.5)
    content((4.55, -1.45), $bold(q_2)$)

    // q_3 line
    line((6, 0), (6, -1.5), (7, -1.5))
    mark((7.25, -1.5), 0deg, symbol: "stealth", scale: 1.5)
    content((7.55, -1.45), $bold(q_3)$)

    // Force line
    line((6.1, 0.25), (7.1, 0.25))
    mark((7.35, 0.25), 0deg, symbol: "stealth", scale: 1.5)
    content((7.65, 0.25), $bold(F)$)
  }),
  caption: [Scenario with two elastic rods joined together.],
  supplement: [Figure],
  kind: figure,
)<4-elastic-rods-scenario>

The first step for generating a solution to this scenario is to write expressions for the strain energies and then assemble these expressions into a global strain energy expression, this process is shown in *@4-elastic-rods-scenario-strain-energy*.

$
  U_1 = 1/2 vec(q_1, q_2)_(1 times 2)^T mat((E_1 A_1)/L_1, -(E_1 A_1)/L_1; -(E_1 A_1)/L_1, (E_1 A_1)/L_1)_(2 times 2) vec(q_1, q_2)_(2 times 1)
  quad
  U_2 = 1/2 vec(q_2, q_3)_(1 times 2)^T mat((E_2 A_2)/L_2, -(E_2 A_2)/L_2; -(E_2 A_2)/L_2, (E_2 A_2)/L_2)_(2 times 2) vec(q_2, q_3)_(2 times 1) \
  U = U_1 + U_2 = 1/2 vec(q_1, q_2, q_3)_(1 times 3)^T
  mat(
    (E_1 A_1)/L_1, -(E_1 A_1)/L_1, 0;
    -(E_1 A_1)/L_1, (E_1 A_1)/L_1 + (E_2 A_2)/L_2, -(E_2 A_2)/L_2;
    0, -(E_2 A_2)/L_2, (E_2 A_2)/L_2
  )_(3 times 3)
  vec(q_1, q_2, q_3)_(3 times 1)
$<4-elastic-rods-scenario-strain-energy>

Note that addition of the strain energies in *@4-elastic-rods-scenario-strain-energy* can only be done through padding of each of the strain energies. The next step is to write the potential energy $V$ for this scenario, this expression is shown in *@4-elastic-rods-scenario-potential-energy*.

$
  V = - mat(delim: "{", R, 0, F)_(1 times 3)vec(q_1, q_2, q_3)_(3 times 1)
$<4-elastic-rods-scenario-potential-energy>

Skipping going through partial differentiation and directly going to the governing equation of equilibrium yields *@4-scenario-governing-equation-equilibrium*. This equation can then have boundary conditions applied to generate values for the displacements, and these can be used to work out reactions.

$
  [K]{q} = {F} quad arrow.r quad mat(
    (E_1 A_1)/L_1, -(E_1 A_1)/L_1, 0;
    -(E_1 A_1)/L_1, (E_1 A_1)/L_1 + (E_2 A_2)/L_2, -(E_2 A_2)/L_2;
    0, -(E_2 A_2)/L_2, (E_2 A_2)/L_2
  )_(3 times 3)
  vec(q_1, q_2, q_3)_(3 times 1)
  =
  vec(R, 0, F)_(3 times 1)
$<4-scenario-governing-equation-equilibrium>

== Combining Elastic Rods and Springs
