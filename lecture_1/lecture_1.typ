#import "../template.typ": *

= Lecture 1

== Principle of Minimum Total Potential Energy (PMTPE)

The principle of minimum total potential energy is a concept that underpins the whole of FEA. It states that a structure will deform or displace to a position which minimizes the total potential energy of that structure. To build up to a mathematical definition of PMTPE, the total potential energy can be written as *@1-total-potential-energy*.

$
  Pi = U + V
$<1-total-potential-energy>

Where:

- *$Pi$*: The total potential energy ($J$).
- *$U$*: The stored elastic strain energy ($J$).
- *$V$*: The potential energy (negative of the work done $-W$ by external forces) ($J$).

PMTE then states that if we have an infinite number of possible responses to a system, the correct solution will have the lowest energy out of the infinite solutions. Mathematically, we are looking for a minimum for the value of $Pi$ which yields the *@1-pmtpe-condition*.

$
  delta Pi = 0 quad therefore quad U = -V
$<1-pmtpe-condition>

== Deriving the Deformation Behavior of Spring

We can apply PMTPE to a 1D spring in order to yield the equation $F = k q$. To start the scenario is defined in *@1-1d-spring-diagram*.

#figure(
  cetz.canvas({
    import "@preview/mechanical-system-cetz-34j:0.1.0": spring, wall
    import cetz.draw: *
    import circuiteria: *

    spring((5.5, 0), name: "spring", n: 7)
    wall((5, -1), b: (5, 1), name: "wall", inverse: true, inverse-lines: false)
    circle((7, 0), radius: 0.1, name: "end-node")

    line("spring", "wall")
    line("spring", "end-node")
    line("end-node", (9, 0), stroke: blue)
    line("end-node", (7, -1.5), (9, -1.5), stroke: red)

    mark((9.4, 0), 0deg, symbol: "stealth", scale: 2, stroke: blue)
    mark((9.4, -1.5), 0deg, symbol: "stealth", scale: 2, stroke: red)

    content("spring.bottom", $k$)
    content((8, -0.3), $F$)
    content((8, -1.8), $q$)
  }),
  caption: [General 1D spring attatched to wall.],
  supplement: [Figure],
  kind: figure,
)<1-1d-spring-diagram>

Where:
- *$k$*: Spring stiffness ($N / m$)
- *$F$*: Force ($N$)
- *$q$*: Displacement ($m$)

Note that $q$ is described as a *generalized coordinate* or a *degree of freedom* (DoF). From the scenario defined in *@1-1d-spring-diagram*, an expression for the total potential energy of the system can be generated, shown in *@1-1d-spring-total-energy*.

$
  U = 1/2 k q^2 quad V = -W = -F q \
  therefore quad Pi = 1/2 k q^2 -F q
$<1-1d-spring-total-energy>


