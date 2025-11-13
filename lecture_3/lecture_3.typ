#import "../template.typ": *

= Lecture 3

== Elastic Rods

An elastic rod is another 1D element similar in nature to a spring element, however there are a few differences which make them more complex. Similar to springs, elastic rods can only deform axially in *tension or compression*. A general elastic rod element is shown in *@3-general-elastic-rod-figure*.

#figure(
  cetz.canvas({
    import cetz.draw: *
    rect(
      (0, 0),
      (5, 0.5),
      fill: rgb(197, 224, 180),
      stroke: black,
    )
    circle(
      (0, 0.25),
      radius: 0.25,
      fill: white,
    )
    circle(
      (5, 0.25),
      radius: 0.25,
      fill: white,
    )
    line(
      (0, 0),
      (0, -1.5),
      (0, -0.75),
      (0.75, -0.75),
    )
    mark((1, -0.75), 0deg, symbol: "stealth", scale: 1.5)
    line(
      (5, 0),
      (5, -1.5),
    )
    line(
      (5, -1.25),
      (0, -1.25),
      mark: (symbol: "stealth", scale: 1.5),
    )
    line(
      (0, 0.5),
      (0, 1.75),
      (0.75, 1.75),
    )
    mark((1, 1.75), 0deg, symbol: "stealth", scale: 1.5)
    line(
      (5, 0.5),
      (5, 1.75),
      (5.75, 1.75),
    )
    mark((6, 1.75), 0deg, symbol: "stealth", scale: 1.5)
    content((1.25, 1.75), $bold(q_1)$)
    content((6.25, 1.75), $bold(q_2)$)
    content((1.25, -0.7), $bold(x)$)
    content((2.5, -1.6), $bold(L)$)

    line((3.5, 1.25), (3.5, -0.5))
    line((3, 1.25), (3, -0.5))

    mark((3, 1), 0deg, symbol: ">", scale: 1.5)
    mark((3.5, 1), 180deg, symbol: ">", scale: 1.5)
    line((2.65, 1), (2, 1))
    line((3.85, 1), (4.5, 1))

    content((3.25, 1.6), $bold(d x)$)

    line((3, -0.65), (3.5, -0.65))
    mark((3.75, -0.65), 0deg, symbol: "stealth", scale: 1.5)
    content((4.25, -0.65), $bold(u(x))$)

    content((-1, 2), $bold(E),bold(A)$)
    line((-1, 1.75), (1, 0.3))
    circle((1, 0.3), radius: 0.1, fill: black)
  }),
  caption: [General elastic rod element.],
  supplement: [Figure],
  kind: figure,
)<3-general-elastic-rod-figure>

Where:
#grid(
  columns: (0.5fr, 0.5fr),
  gutter: 0.75em,

  [- *$E$*: Young's Modulus ($P a$).], [- *$A$*: Cross sectional area ($m^2$).],
  [- *$L$*: Length of bar ($m$).], [- *$q_1$*: Axial displacement of LHS end ($m$).],
  [- *$q_2$*: Axial displacement of RHS end ($m$).], [- *$x$*: Distance from LHS along the bar ($m$).],
  [- *$d x$*: Infinitesimal slice of the bar.], [- *$u(x)$*: Deformation of the bar at slice ($m$).],
)


== Strain Energy for Elastic Rods

Similar to the spring element, the first step to generate a general expression for the elastic rod is to derive an expression for the strain energy $U$. This is shown in *@3-strain-energy-elastic-rod*.

#grid(
  columns: (1fr, 2fr),
  align: center + horizon,
  [#figure(
    cetz.canvas({
      import cetz.draw: *

      merge-path(fill: blue, {
        line((0, 0), (1.8, 1.8))
        line((1.8, 0), (0, 0))
      })

      // Y Axis
      line((0, 0), (0, 2))
      mark((0, 2.25), 90deg, symbol: "stealth", scale: 1.5)
      content((0, 2.65), $bold(sigma)$)

      // X Axis
      line((0, 0), (2, 0))
      mark((2.25, 0), 0deg, symbol: "stealth", scale: 1.5)
      content((2.65, 0.1), $bold(epsilon)$)

      // Label
      content((3, 1.75), $bold(U / "Vol")$)
      line((2.65, 1.8), (1.5, 1))
      circle((1.5, 1), radius: 0.1, fill: black)
    }),
    caption: [Strain energy plot.],
    supplement: [Figure],
    kind: figure,
  )],
  [$
    "Assuming 1D uniaxial elasticity:" \
    U = 1/2 integral sigma_x epsilon_x d"Vol" \
    "Given that the slice of the bar is a cylinder:"\
    U = 1/2 integral sigma_x epsilon_x A d x
  $<3-strain-energy-elastic-rod>],
)

As we are assuming that the rod is behaving purely elastically, then the stress ($sigma_x$) can be rewritten as  shown in *@3-strain-energy-elastic-rod-2*.

$
  sigma_x = E epsilon_x quad arrow.r quad U = 1/2 integral E A epsilon_x^2 d x
$<3-strain-energy-elastic-rod-2>

Finally, the strain itself $epsilon_x$ can be rewritten in terms of the deformation seen over the infinitesimal length slice, this is shown in *@3-strain-expression*.


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
    }),
    caption: [Deformation over slice.],
    supplement: [Figure],
    kind: figure,
  )],
  [$
    "The strain" epsilon_x "can be rewritten as:" \
    epsilon_x = (Delta L)/(L) = ((u - d u) - u)/(d x) = (d u)/(d x)
  $<3-strain-expression>],
)

Substituting *@3-strain-expression* into *@3-strain-energy-elastic-rod-2* yields a final expression for the strain energy show in *@3-strain-energy-elastic-rod-3*.

$
  U = 1/2 integral E A epsilon_x^2 d x = 1/2 integral E A ((d u)/(d x))^2 d x = 1/2 integral E A u'^2 d x
$<3-strain-energy-elastic-rod-3>

== Shape Functions for Elastic Rods

One issue with *@3-strain-energy-elastic-rod-3* is that the strain energy is written in terms of the deformation which currently has no relation tio the displacements $q_1 "and" q_2$. Therefore a more rigorous definition of $u(x)$ must be developed, and this is done through utilizing shape functions, shown in *@3-deformation-shape-functions*.

#grid(
  columns: (1fr, 1fr),
  align: center + horizon,
  [#figure(
    canvas({
      import draw: *

      plot.plot(
        size: (3, 3),
        x-min: 0,
        x-max: 1.1,
        x-tick-step: 10, // Move far away
        x-ticks: (
          // manually define ticks and labels
          (1.0, $x = L$),
        ),
        y-min: 0,
        y-max: 1.1,
        y-tick-step: 1,
        y-label: $bold(g(x))$,
        legend: "south",
        axis-style: "school-book",
        {
          // Define a function y = 2x + 1
          let g_1(x) = x
          let g_2(x) = 1 - x

          // Add it to the plot
          plot.add(g_1, domain: (0, 1), style: (stroke: red + 2pt), label: $g_1(x) = x "/" L$)
          // Add it to the plot
          plot.add(g_2, domain: (0, 1), style: (stroke: blue + 2pt), label: $g_2(x) = 1 - x "/" L$)
        },
      )
    }),
    caption: [Shape functions for an elastic rod.],
    supplement: [Figure],
    kind: figure,
  )],
  [$
    u(x) = g_1(x)q_1 + g_2(x)q_2 \
    g_1(x) = 1 - x/L quad g_2(x) = x/L \
    therefore u(x) = (1 - x/L)q_1 + (x/L)q_2
  $<3-deformation-shape-functions>],
)

The *shape function* controls the amount of *influence* each displacement receives and is effectively an interpolation. At $x=0$ the displacement is given by $q_1$ and at $x=L$ the displacement is given by $q_2$. Using the expression for deformation shown in *@3-deformation-shape-functions*, expressions for the strain and stress can be derived as shown in *@3-elastic-rod-stress-strain*.

$
  epsilon (x) = (d u)/(d x) = (-1/L)q_1 + (1/L)q_2 quad quad
  sigma (x) = E epsilon (x) = (-E/L)q_1 + (E/L)q_2 \
  epsilon (x) = mat(delim: "{", -1/L, 1/L)_(1 times 2) vec(q_1, q_2)_(2 times 1) quad quad
  sigma(x) = E mat(delim: "{", -1/L, 1/L)_(1 times 2) vec(q_1, q_2)_(2 times 1)
$<3-elastic-rod-stress-strain>

Note that these can also be written in a matrix form as is shown in *@3-elastic-rod-stress-strain*. The expressions for the stress and strain in *@3-elastic-rod-stress-strain* don't actually depend on $x$ and so the stress and strain are constant throughout the bar.


#pagebreak()
