#import "../template.typ": *

#lecture("Lecture 5", 1, 4)

== Motivation for Using Shape Functions

In continuum mechanics, there are an infinite number of DoFs as you can go down to the atomic scale. The FE process approximates a continuum as a finite number of nodes where *shape functions* are used to approximate the behavior between the nodes. Shape functions should provide continuity between adjoining elements, as shown in *@5-shape-function-continuity* for multiple elastic rods.

#figure(
  canvas({
    import draw: *

    plot.plot(
      size: (9, 4),
      x-min: 0,
      x-max: 3.1,
      x-tick-step: 20, // Move far away
      x-ticks: (
        // manually define ticks and labels
        (1.0, $x = L_1$),
        (2.0, $x = L_1 + L_2$),
        (3.0, $x = L_1 + L_2 + L_3$),
      ),
      y-min: 0,
      y-max: 1.1,
      y-tick-step: 1,
      y-label: $bold(g(x))$,
      //legend: "inner-north",
      axis-style: "school-book",
      {
        // Define ashape functions
        let g_1_1(x) = x
        let g_1_2(x) = 1 - x

        let g_2_1(x) = x - 1
        let g_2_2(x) = 2 - x

        let g_3_1(x) = x - 2
        let g_3_2(x) = 3 - x

        // Add it to the plot
        plot.add(g_1_1, domain: (0, 1), style: (stroke: red + 2pt), label: $g_(1,1)(x) = x "/" L_1$)
        plot.add(g_1_2, domain: (0, 1), style: (stroke: blue + 2pt), label: $g_(1,2)(x) = 1 - x "/" L_1$)

        plot.add(g_2_1, domain: (1, 2), style: (stroke: orange + 2pt), label: $g_(2,1)(x) = x "/" L_2$)
        plot.add(g_2_2, domain: (1, 2), style: (stroke: yellow + 2pt), label: $g_(2,2)(x) = 1 - x "/" L_2$)

        plot.add(g_3_1, domain: (2, 3), style: (stroke: purple + 2pt), label: $g_(3,1)(x) = x "/" L_3$)
        plot.add(g_3_2, domain: (2, 3), style: (stroke: eastern + 2pt), label: $g_(3,2)(x) = 1 - x "/" L_3$)
      },
    )
  }),
  caption: [Plot showing continuity of shape functions.],
  supplement: [Figure],
  kind: figure,
)<5-shape-function-continuity>

== Beam Element

A beam element is a 1D element which only deforms in flexure, where the displacement (denoted by $w(x)$) is perpendicular to the element axis. A general 1D beam element is shown in *@5-general-1d-beam*.

#figure(
  canvas({
    import draw: *

    length-label(0, -2.5, 1.5, 7, $bold(L)$)

    // Deformed Beam
    let point_i = (0, 0)
    let point_f = (7, -2.5)
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
    rod((0, 0), 7, 0.5, $bold(E),bold(I)$, -1.25, node_radi: 0.25, content_string_x_shift: -2)

    // Centerline of undeformed rod
    line((0.25, 0), (6.75, 0), stroke: (dash: "dashed", thickness: 0.6pt))

    // Dx label
    length-label(4, 0, -0.75, 1, $bold(d x)$, inner: false, line-offset: -0.1, x-padding: 1.2, y-padding: -0.3)

    // Displacement arrow and label
    line((4.5, 0), (4.5, -1.45))
    mark((4.5, -1.75), 0deg, symbol: "stealth", scale: 1.5, fill: black)
    content((5.3, -1.5), $bold(w(x))$)

    // x arrow and label
    line((0, -1.75), (4.25, -1.75))
    mark((4.5, -1.75), 270deg, symbol: "stealth", scale: 1.5, fill: black)
    content((4, -2), $bold(x)$)
  }),
  caption: [General 1D beam element],
  supplement: [Figure],
  kind: figure,
)<5-general-1d-beam>

Where:

#grid(
  columns: (0.5fr, 0.5fr),
  [- *$E$*: Young's Modulus ($P a$)], [- *$I$*: Second Moment of Area ($m^4$)],
)

Note that the Euler-Bernoulli hypothesis assumptions still hold true for beam elements, theses are:

- That the *cross section remains constant* and does not change during bending.
- That the *cross section remains perpendicular* to the neutral axis during bending

For beams the strain energy is given by *@5-beam-strain-energy*, note the similarities to the rod strain energy given by *@3-strain-energy-elastic-rod-3*

$
  U = 1/2 integral_0^L E I (w(x)'')^2 d x
$<5-beam-strain-energy>

The governing differential equation for transverse loading is more complex than the one for longitudinal loading, both are shown in *@5-differential-equations*.

$
  "Governing Transverse Diff Eq" quad E A u'' = "Longitudinal Load Intensity" \
  "Governing Flexure Diff Eq" quad E I w'''' = "Transversal Load Intensity"
$<5-differential-equations>

The order of the shape function required is one less than the order of the derivative of the governing differential equation, this is why for a rod element, the shape function is linear. This means that for a beam element, the shape function must be a *cubic*. Using a cubic shape function, allows for beam elements to encompass the following behaviors:

- Capture a linearly varying bending moment $M(x) = E I (d^2 w(x))/(d x^2)$
- Therefore, capture linearly varying stress $sigma = (M(x) y)/I$
- Capture constant shear force $V(x) = E I (d^3 w(x))/(d x^3)$

=== Hermite Cubics

The cubic shape functions used for beam elements are called the *Hermite cubics* and encompass a group of four cubics defined over the length of the element. These are shown in *@5-hermite-cubics*.

#figure(
  canvas({
    import draw: *

    set-style(
      legend: (stroke: 0pt, item: (spacing: .75), scale: 125%),
    )

    plot.plot(
      size: (8, 5),
      x-min: 0,
      x-max: 1.05,
      x-tick-step: 20, // Move far away
      x-ticks: (
        // manually define ticks and labels
        (1.0, $x = L$),
      ),
      y-min: -1,
      y-max: 1.1,
      y-tick-step: 1,
      y-label: $bold(f)$,
      axis-style: "school-book",
      {
        // Define ashape functions
        let L = 1
        let f_1(x) = 1 - 3 * calc.pow(x / L, 2) + 2 * calc.pow(x / L, 3)
        let f_2(x) = L * (x / L - 2 * calc.pow(x / L, 2) + calc.pow(x / L, 3))
        let f_3(x) = 3 * calc.pow(x / L, 2) - 2 * calc.pow(x / L, 3)
        let f_4(x) = L * (-calc.pow(x / L, 2) + calc.pow(x / L, 3))

        // Add it to the plot
        plot.add(f_1, domain: (0, 1), style: (stroke: red + 2pt), label: $f_1(x) = 1 - 3 x^2 / L^2 + 2 x^3 / L^3$)
        plot.add(f_2, domain: (0, 1), style: (stroke: blue + 2pt), label: $f_2(x) = 1 - 2 x^2 / L + 2 x^3 / L^2$)
        plot.add(f_3, domain: (0, 1), style: (stroke: yellow + 2pt), label: $f_3(x) = 3 x^2 / L^2 - 2 x^3 / L^3$)
        plot.add(f_4, domain: (0, 1), style: (stroke: green + 2pt), label: $f_1(x) = - x^2 / L + 2 x^3 / L^2$)
      },
    )
  }),
  caption: [Definition of Hermite cubics.],
  supplement: [Figure],
  kind: figure,
)<5-hermite-cubics>

The displacement is given as a combination of these 4 cubics applied to the four degrees of freedom of the beam element, shown in *@5-beam-displacement*.

$
  w(x) = f_1 (x) q_1 + f_2 (x) q_2 + f_3 (x) q_3 + f_4 (x) q_4
$<5-beam-displacement>

=== DoF for Beam Elements

Unlike rod elements, beam elements have four degrees of freedom, two translational and two rotational. The positive sign conventions for these DoFs is shown in *@5-beam-DoF*.

If the flexural deformation of the element is small, then the derivative of the deformation (the slope) can be approximated as the rotation itself, this is shown in *@5-small-strain*.

#grid(
  columns: 2,
  column-gutter: 2cm,
  [
    #figure(
      canvas({
        import draw: *

        plot.plot(
          size: (5, 5),
          x-min: 0,
          x-max: 1.5,
          x-tick-step: 20, // Move far away
          y-min: 0,
          y-max: 5,
          y-tick-step: 20,
          y-label: $bold(w)$,
          //legend: "inner-north",
          axis-style: "school-book",
          {
            // Define ashape functions
            let f(x) = -calc.pow(x - 2, 2) + 4
            let g(x) = 4 * x

            // Add it to the plot
            plot.add(f, domain: (0, 2), style: (stroke: red + 2pt))
            plot.add(
              g,
              domain: (0, 1),
              style: (
                stroke: (
                  paint: red,
                  thickness: 2pt,
                  dash: "dashed",
                ),
              ),
            )
          },
        )

        arc((2, 0), start: 0deg, stop: 40deg, radius: 2)
        mark((1.3, 1.5), 140deg, symbol: ">>", scale: 1.5, fill: black)
        content((1.25, 0.5), $bold(theta)$)
        content((4, 4.5), $bold(w' = (d w)/(d x) = tan(theta) approx theta)$)
      }),
      caption: [Plot showing for small strains, slope is approximately equal to rotation.],
      supplement: [Figure],
      kind: figure,
    )<5-small-strain>
  ],
  [#move(
      dx: 0cm,
      dy: 3.4cm,
      [#figure(
        canvas({
          import draw: *

          line((0, 0), (7, 0), stroke: 2pt)

          line((0, 0), (0, 2))
          mark((0, 2.25), 90deg, symbol: ">>", scale: 1.5, fill: black)
          content((-0.5, 2), $bold(q_1)$)

          line((7, 0), (7, 2))
          mark((7, 2.25), 90deg, symbol: ">>", scale: 1.5, fill: black)
          content((6.5, 2), $bold(q_3)$)

          arc((0.35, 0.7), start: 60deg, stop: -230deg, radius: 0.75)
          mark((-0.25, 0.75), 30deg, symbol: ">>", scale: 1.5, fill: black)
          content((-1.25, 0), $bold(q_2)$)

          arc((7.35, 0.7), start: 60deg, stop: -230deg, radius: 0.75)
          mark((6.75, 0.75), 30deg, symbol: ">>", scale: 1.5, fill: black)
          content((8.25, 0), $bold(q_4)$)

          circle((0, 0), radius: 0.3, fill: black)
          circle((7, 0), radius: 0.3, fill: black)
        }),
        caption: [Plot showing positive sign conventions for a beam element],
        supplement: [Figure],
        kind: figure,
      )<5-beam-DoF>],
    )
  ],
)

=== Deriving the Stiffness Matrix for a Beam Element

As *@5-beam-strain-energy* and *@5-beam-displacement* have both been defined earlier, the strain energy will therefore depend on the second derivative of the displacement function in *@5-beam-displacement* this yields *@5-expanded-strain-energy*.

$
  U = 1/2 E I integral_0^L [f_1 '' (x) q_1 + f_2 '' (x) q_2 + f_3 '' (x) q_3 + f_4 '' (x) q_4]^2 d x
$<5-expanded-strain-energy>

Note that as the expression for the displacement ($w'' (x)$) is squared, the fully expanded form will consist of 10 integrals. These 10 integrals can then be solved using the definitions of the Hermite cubics and assembled into a stiffness matrix form to yield *@5-beam-strain-matrix*.

$
  U = 1/2 vec(q_1, q_2, q_3, q_4,)_(1 times 4)^T ((E I)/L^3)
  mat(
    12, 6L, -12, -6L;
    6L, 4L^2, -6L, 2L^2;
    -12, -6L, 12, -6L;
    6L, 2L^2, -6L, 4L^2
  )_(4 times 4)
  vec(q_1, q_2, q_3, q_4,)_(4 times 1)
  \
  U = 1/2 ((E I)/L^3) {q}_(1 times 4)^T [K]_(4 times 4) {q}_(4 times 1)
$<5-beam-strain-matrix>
