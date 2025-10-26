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
