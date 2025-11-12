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
    //Wall
    wall((0, 0), 4)

    // Rod 1 and related lengths and arrows
    rod((0, 0), 3, 0.5, $bold(E_1),bold(A_1)$, -1, fill_color: rgb("#00b3ff"))
    length-label(0, 0.1, 1.5, 3, $bold(L_1)$)
    arrow-label(0, -0.1, -2, $bold(q_1)$)
    arrow-label(3, -0.1, -2, $bold(q_2)$)

    // Rod 2 and related lengths and arrows
    rod((3, 0), 3, 1, $bold(E_2),bold(A_2)$, -1, fill_color: rgb("#00ffe1"))
    length-label(3, 0.1, 1.5, 3, $bold(L_2)$)
    arrow-label(6.1, -0.1, 0, $bold(F)$)
    arrow-label(6, -0.1, -2, $bold(q_3)$)
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

Like lego pieces, elastic rods and springs can be combined to simulate more complex behavior, one common example of this is introducing a *lumped spring* which is commonly used to simulate a connection of a structure to a fixed wall, this configuration is shown in

#figure(
  cetz.canvas({
    //Wall
    wall((0, 0), 4)

    // Rod 1 and related lengths and arrows
    rod((0, 0), 3, 0.5, $bold(E_1),bold(A_1)$, -1, fill_color: rgb("#00b3ff"))
    length-label(0, 0.1, 1.5, 3, $bold(L_1)$)
    arrow-label(0, -0.1, -2, $bold(q_1)$)
    arrow-label(3, -0.1, -2, $bold(q_2)$)

    // Rod 2 and related lengths and arrows
    rod((3, 0), 3, 1, $bold(E_2),bold(A_2)$, -1, fill_color: rgb("#00ffe1"))
    length-label(3, 0.1, 1.5, 3, $bold(L_2)$)
    arrow-label(6, -0.1, -1, $bold(F)$)
    arrow-label(6, -0.1, -2, $bold(q_3)$)

    // Spring and wall
    wall((8, 0), 4, flipped_and_reversed: true)
    spring((6, 0), 2, 0.5, 4, $bold(k)$, content_y_shift: 1.75, color: orange)
  }),
  caption: [Scenario with two elastic rods joined together with a lumped spring.],
  supplement: [Figure],
  kind: figure,
)<4-elastic-rods-lumped-spring-scenario>

This change only has a small effect on the overall behavior of the system, as the force and displacement vectors remain unchanged, the altered governing equation of equilibrium is shown in *@4-altered-scenario-governing-equation-equilibrium*.

$
  mat(
    (E_1 A_1)/L_1, -(E_1 A_1)/L_1, 0;
    -(E_1 A_1)/L_1, (E_1 A_1)/L_1 + (E_2 A_2)/L_2, -(E_2 A_2)/L_2;
    0, -(E_2 A_2)/L_2, (E_2 A_2)/L_2 bold(+ k)
  )_(3 times 3)
  vec(q_1, q_2, q_3)_(3 times 1)
  =
  vec(R, 0, F)_(3 times 1)
$<4-altered-scenario-governing-equation-equilibrium>

Note that the only difference here is the stiffness in the bottom right cell. Alternatively the spring could be unbounded as shown in *@4-elastic-rods-unbounded-spring-scenario* where it is situated between the two elastic rods.

#figure(
  cetz.canvas({
    //Wall
    wall((0, 0), 4)

    // Rod 1 and related lengths and arrows
    rod((0, 0), 3, 0.5, $bold(E_1),bold(A_1)$, -1, fill_color: rgb("#00b3ff"))
    length-label(0, 0.1, 1.5, 3, $bold(L_1)$)
    arrow-label(0, -0.1, -2, $bold(q_1)$)
    arrow-label(3, -0.1, -2, $bold(q_2)$)

    // Spring and wall
    spring((3, 0), 2, 0.5, 4, $bold(k)$, content_y_shift: 1.75, color: orange)


    // Rod 2 and related lengths and arrows
    wall((8, 0), 4, flipped_and_reversed: true)
    rod((5, 0), 3, 1, $bold(E_2),bold(A_2)$, -1, fill_color: rgb("#00ffe1"))
    length-label(5, 0.1, 1.5, 3, $bold(L_2)$)
    arrow-label(5, -0.1, -1.5, $bold(F)$)
    arrow-label(5, -0.1, -2.5, $bold(q_3)$)
    arrow-label(8, -0.1, -2.5, $bold(q_4)$)
  }),
  caption: [Scenario with two elastic rods joined together with a lumped spring.],
  supplement: [Figure],
  kind: figure,
)<4-elastic-rods-unbounded-spring-scenario>

This change will effect the different matrices in the following way shown in *@4-elastic-rods-unbounded-spring-solution*.

$
  U_1 = 1/2 vec(q_1, q_2)_(1 times 2)^T mat((E_1 A_1)/L_1, -(E_1 A_1)/L_1; -(E_1 A_1)/L_1, (E_1 A_1)/L_1)_(2 times 2) vec(q_1, q_2)_(2 times 1)
  quad
  U_2 = 1/2 vec(q_2, q_3)_(1 times 2)^T mat(k_1, -k_1; -k_1, k_1)_(2 times 2) vec(q_2, q_3)_(2 times 1)
  \
  U_3 = 1/2 vec(q_3, q_4)_(1 times 2)^T mat((E_2 A_2)/L_2, -(E_2 A_2)/L_2; -(E_2 A_2)/L_2, (E_2 A_2)/L_2)_(2 times 2) vec(q_3, q_4)_(2 times 1)
  \
  U = U_1 + U_2 + U_3 = 1/2 vec(q_1, q_2, q_3, q_4)_(1 times 4)^T mat(
    (E_1 A_1)/L_1, -(E_1 A_1)/L_1, 0, 0; -(E_1 A_1)/L_1, (E_1 A_1)/L_1 + k_1, -k_1, 0; 0, -k_1, (E_2 A_2)/L_2 + k_1, -(E_2 A_2)/L_2; 0, 0, -(E_2 A_2)/L_2, (E_2 A_2)/L_2,
  )_(4 times 4)vec(q_1, q_2, q_3, q_4)_(4 times 1)
  \
  V = - mat(delim: "{", R_1, 0, F, R_2)_(1 times 4)vec(q_1, q_2, q_3, q_4)_(4 times 1)
$<4-elastic-rods-unbounded-spring-solution>

== Distributed Load

To extend the functionality of the elastic rod, imagine a distributed load applied to one of the two elements, shown in *@4-elastic-rods-distforce-scenario*.

#figure(
  cetz.canvas({
    // Spring and Wall
    wall((0, 0), 4)
    spring((0, 0), 3, 0.5, 5, $bold(k)$)

    // RHS node arrows
    arrow-label(3.1, 0, 0, $bold(F)$, color: red)
    arrow-label(3, -0.1, -1.5, $bold(q)$, color: blue)
  }),
  caption: [Scenario with two elastic rods joined together with a distributed force applied to one of the rods.],
  supplement: [Figure],
  kind: figure,
)<4-elastic-rods-distforce-scenario>

One issue with a distributed load is that the resulting force must be applied at the nodes, even though the distribution is across the whole element. To generate an expression for the distributed load, an infinitesimal slice of the bar is considered as shown in *@4-potential-distForce*.

#grid(
  columns: (1fr, 2fr),
  align: center + horizon,
  [#figure(
    cetz.canvas({
      import cetz.draw: *
      group({
        scale(.5)
        merge-path(fill: rgb(197, 224, 180), {
          line((0, 0), (8, 0))
          line((8, 0), (8, -1.5))
          line((7.4, -2.1), (-0.5, -2.1))
          line((-0.5, -2.1), (-0.6, -0.7))
        })
        group({
          line((0, 0), (-0.5, -0.5))
          merge-path(name: "sigma-left", fill: rgb(197, 224, 180), {
            bezier((-0.5, -0.5), (-0.5, -1), (-0.75, -0.75))
            line((-0.5, -1), (-0.25, -1.25))
            arc((-0.25, -1.25), radius: 0.5, start: 45deg, stop: -235deg)
            line((-0.9, -1.2), (-0.6, -0.9))
          })
        })
        group({
          rotate(180deg)
          translate(x: -7.4, y: 2.1)

          line((0, 0), (-0.5, -0.5))
          merge-path(name: "sigma-right", fill: rgb(197, 224, 180), {
            bezier((-0.5, -0.5), (-0.5, -1), (-0.75, -0.75))
            line((-0.5, -1), (-0.25, -1.25))
            arc((-0.25, -1.25), radius: 0.5, start: 45deg, stop: -235deg)
            line((-0.9, -1.2), (-0.6, -0.9))
          })
        })
      })
      circle((3, -0.52), radius: (0.25, 0.52), stroke: (dash: "dashed"))

      arc((1, 0), radius: (0.25, 0.52), start: 90deg, stop: 270deg, stroke: (dash: "dashed"))

      line((1, 0), (1, 1), (1.5, 1))
      mark((1.75, 1), 0deg, symbol: "stealth", scale: 1.5)
      content((2, 1.1), $bold(u)$)

      line((3, 0), (3, 1), (3.5, 1))
      mark((3.75, 1), 0deg, symbol: "stealth", scale: 1.5)
      content((4.5, 1), $bold(u + d u)$)

      line((1, -1.05), (1, -1.75))
      line((3, -1.05), (3, -1.75))

      line(
        (1, -1.5),
        (3, -1.5),
        mark: (symbol: "stealth", scale: 1.5),
      )
      content((2, -1.75), $bold(d x)$)
      // Distributed force P0
      let distributed-force(n, x_0, y_0, string) = {
        for i in range(0, n) {
          line((x_0 + 0.75 * i, y_0), ((x_0 + 0.5) + 0.75 * i, y_0), ((x_0 + 0.25) + 0.75 * i, y_0 + 0.1))
        }
        content(((x_0 + x_0 + 0.75 * n) / 2, y_0 + 0.5), string)
      }

      distributed-force(6, 0, 0.1, $bold(p_0)$)
    }),
    caption: [Deformation over slice with distributed load.],
    supplement: [Figure],
    kind: figure,
  )],
  [$
    V=-W=-F times d=-integral_(x=0)^(x=L_E) p_0 d x times u(x)
    \
    "As" quad u(x) = (1 - x/L_E)q_2 + (x/L_E)q_3 quad "Then"
    \
    V = -(P_0 L_E /2)q_2 -(P_0 L_E /2)q_3
  $<4-potential-distForce>],
)

*@4-potential-distForce* can also be written in the force matrix form, to allow for easier substitution into the governing equation of equilibrium, this is shown in *@4-force-matrix*.

$
  V = -(P_0 L_E /2)q_2 -(P_0 L_E /2)q_3 quad arrow.r quad V = -mat(delim: "{", R, P_0 L_E /2, P_0 L_E /2)_(1 times 3) vec(q_1, q_2, q_3)_(3 times 1) \
  V= -{F}_(1 times 3)^T {q}_(3 times 1)
$<4-force-matrix>

This definition can easily be expanded for more complex loading cases. Take the scenario defined in *@4-elastic-rods-distforce-scenario*, and apply a force at an intermediate node, as shown in *@4-elastic-rods-distforce-scenario-added-force*.

#figure(
  cetz.canvas({
    //Wall
    wall((0, 0), 5)

    // Rod 1 and related lengths and arrows
    rod((0, 0), 3, 0.5, $bold(E_1),bold(A_1)$, -1, fill_color: rgb("#00b3ff"))
    length-label(0, 0.1, 2, 3, $bold(L_1)$)
    arrow-label(0, -0.1, -2, $bold(q_1)$)
    arrow-label(3, -0.1, -2, $bold(q_2)$)

    // Rod 2 and related lengths and arrows
    rod((3, 0), 3, 1, $bold(E_2),bold(A_2)$, -1, fill_color: rgb("#00ffe1"))
    length-label(3, 0.1, 2, 3, $bold(L_2)$)
    arrow-label(6.1, -0.1, 0, $bold(F)$)
    arrow-label(6, -0.1, -2, $bold(q_3)$)

    // Distributed force
    distributed-force(4, 3.1, 0.6, $bold(p_0)$)
  }),
  caption: [Scenario with two elastic rods joined together with a distributed force applied to one of the rods.],
  supplement: [Figure],
  kind: figure,
)<4-elastic-rods-distforce-scenario-added-force>

Adding this force would only produce a small change in the force vector, shown in *@4-modified-force-matrix*.

$
  V = -mat(delim: "{", R, P_0 L_E /2 + F, P_0 L_E /2)_(1 times 3) vec(q_1, q_2, q_3)_(3 times 1) = -{F}_(1 times 3)^T {q}_(3 times 1)
$<4-modified-force-matrix>

Just to summarize, the typical process for solving a question with elastic rods is:

+ Draw a diagram.
+ Idealize the elements, calculating equivalent nodal forces.
+ Assemble the global stiffness matrix and equilibrium equation.
+ Invert the stiffness matrix and solve for nodal displacements.
+ Solve for displacements across elements.
+ Solve for strain across elements.
+ Solve for stress across elements.

== Solving a Complex Elastic Rod question

As an example of the process to fully solve a complex elastic rod type question, consider the scenario defined in *@4-complex-elastic-rod-question*.

#figure(
  cetz.canvas({
    // LHS Wall
    wall((0, 0), 4)

    // First rod, lengths and arrows
    rod((0, 0), 3, 0.5, "", 0, fill_color: rgb("#00ffe1"), node_1: false, node_2: false)
    length-label(0, 0, 1.5, 3, $bold(L"/"4)$)
    arrow-label(3, -0.1, -1.5, $bold(P)$)

    // Second rod, lengths and arrows
    rod((3, 0), 3, 0.5, "", 0, fill_color: rgb("#00ffe1"), node_1: false, node_2: false)
    length-label(3, 0, 1.5, 3, $bold(L"/"4)$)

    // 3rd rod, lengths and arrows
    rod((6, 0), 6, 0.5, "", 0, fill_color: rgb("#00ffe1"), node_1: false, node_2: false)
    length-label(6, 0, 1.5, 6, $bold(L"/"2)$)

    // Distributed force
    distributed-force(8, 6.1, 0.35, $bold(p_0)$)

    // RHS Wall
    wall((12, 0), 4, flipped_and_reversed: true)
  }),
  caption: [Complex elastic rod scenario],
  supplement: [Figure],
  kind: figure,
)<4-complex-elastic-rod-question>

Currently *@4-complex-elastic-rod-question* is not an FE scenario yet, to make it so, nodes, nodal displacements and forces must be defined, these are shown in *@4-complex-elastic-rod-FE*.

#figure(
  cetz.canvas({
    // Walls
    wall((0, 0), 5)
    wall((12, 0), 5, flipped_and_reversed: true)

    //LHS Wall arrows
    arrow-label(0, -0.1, -1.5, $bold(R_L)$)
    arrow-label(0, -0.1, -2.5, $bold(q_1)$)

    // First rod, lengths and arrows
    rod((0, 0), 3, 0.5, "", 0, fill_color: rgb("#00ffe1"))
    length-label(0, 0.1, 1.5, 3, $bold(L"/"4)$)
    arrow-label(3, -0.1, -1.5, $bold(P)$)
    arrow-label(3, -0.1, -2.5, $bold(q_2)$)

    // Second rod, lengths and arrows
    rod((3, 0), 3, 0.5, "", 0, fill_color: rgb("#00ffe1"))
    length-label(3, 0.1, 1.5, 3, $bold(L"/"4)$)
    arrow-label(6, -0.1, -1.5, $bold(P_(0 L))$)
    arrow-label(6, -0.1, -2.5, $bold(q_3)$)

    // 3rd rod, lengths and arrows
    rod((6, 0), 6, 0.5, "", 0, fill_color: rgb("#00ffe1"))
    length-label(6, 0.1, 1.5, 6, $bold(L"/"2)$)
    arrow-label(12, -0.1, -1.5, $bold(R_R)$)
    arrow-label(12, -0.1, -2.5, $bold(q_4)$)

    // Distributed force
    distributed-force(8, 6.1, 0.35, $bold(p_0)$)
  }),
  caption: [Complex elastic rod scenario broken down using FE.],
  supplement: [Figure],
  kind: figure,
)<4-complex-elastic-rod-FE>

Now that the scenario is defined, the strain energy per element can be defined and a global assembled stiffness matrix can be obtained, as shown in *@4-complex-scenario-strain-energy*.

$
  U_1 = 1/2 vec(q_1, q_2)_(1 times 2)^T (E A)/L mat(4, -4; -4, 4)_(2 times 2) vec(q_1, q_2)_(2 times 1)
  \ U_2 = 1/2 vec(q_2, q_3)_(1 times 2)^T (E A)/L mat(4, -4; -4, 4)_(2 times 2) vec(q_2, q_3)_(2 times 1)
  \ U_3 = 1/2 vec(q_3, q_4)_(1 times 2)^T (E A)/L mat(2, -2; -2, 2)_(2 times 2) vec(q_3, q_4)_(2 times 1)
  \
  U = 1/2 vec(q_1, q_2, q_3, q_4)_(1 times 4)^T (E A)/L mat(
    4, -4, 0, 0;
    -4, 4+4, -4, 0;
    0, -4, 4+2, -2;
    0, 0, -2, 2
  )_(4 times 4)
  vec(q_1, q_2, q_3, q_4)_(4 times 1)
$<4-complex-scenario-strain-energy>

After obtaining the expression for the strain energy in *@4-complex-scenario-strain-energy*, a similar expression can be developed for the potential energy shown in *@4-complex-scenario-potential-energy*.

$
  V = -W = -(R_L q_1 + P q_2 + (p_0 L)/4 q_3 +(p_0 L)/4 q_4 + R_R q_4)
  \
  V = -mat(delim: "{", R_L, P, (p_0 L) /4, (p_0 L) /4 + R_R)_(1 times 4) vec(q_1, q_2, q_3, q_4)_(4 times 1)
$<4-complex-scenario-potential-energy>

Finally, the assembled stiffness matrix in *@4-complex-scenario-strain-energy* cam be combined with the force vector shown in *@4-complex-scenario-potential-energy* in the governing equation of equilibrium to yield *@4-complex-scenario-governing-bcs*, boundary conditions at the walls can also be applied to yield *@4-complex-scenario-governing-bcs* a reduced non-singular problem.

$
  (E A)/L mat(
    4, -4, 0, 0;
    -4, 4+4, -4, 0;
    0, -4, 4+2, -2;
    0, 0, -2, 2
  )_(4 times 4)
  vec(q_1, q_2, q_3, q_4)_(4 times 1) = vec(R_L, P, (p_0 L) /4, (p_0 L) /4 + R_R)_(4 times 1)
  \
  "Applying BCs :" quad (E A)/L mat(
    8, -4;
    -4, 6
  )_(2 times 2)
  vec(q_2, q_3)_(2 times 1) = vec(P, (p_0 L) /4)_(2 times 1)
$<4-complex-scenario-governing-bcs>

After solving for the displacements, its possible to further solve for the stress and strain, for this example, these plots are shown in *@4-displacement-plot* and *@4-strain-plot*.

#grid(
  columns: 2,
  row-gutter: 1em,
  [#figure(
    image("images/4-displacement-plot.png", width: 80%),
    caption: [Plot of nodal displacement along the rod.],
    supplement: [Figure],
    kind: figure,
  )<4-displacement-plot>],
  [#figure(
    image("images/4-strain-plot.png", width: 80%),
    caption: [Plot of strain along the rod.],
    supplement: [Figure],
    kind: figure,
  )<4-strain-plot>],
)

Notice that the strain is the derivative of the displacement curve. Further note that for both plots, increasing the number of nodes within the section with the distributed force gets closer and closer to a smooth curve, this is because the force of the distributed load is only being approximated to be at the nodes.

#pagebreak()
