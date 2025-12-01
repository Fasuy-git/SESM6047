//Import all libraries from template file
#import "template.typ": *

//
#set page(margin: 1in)
#set text(font: "Calibri", size: 10pt)

// Need to show word count for total word func
#show: word-count

#set page(
  header: [
    SESM6047 - Coursework
    #h(1fr)
    Yusaf Sultan - 32750552
    #v(-0.3cm)
    #line(length: 100%)
  ],
  footer: context [
    #align(center)[
      #box(height: 14pt)[#v(0.35cm) #line(length: 43%)]
      #h(0.569cm)
      #counter(page).display("1")
      #h(0.569cm)
      #box(height: 14pt)[#v(0.35cm) #line(length: 43%)]
    ]
  ],
)

#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: [Eq.])


// #set heading(numbering: (n1, ..x) => numbering("1.", calc.max(0, n1 - 1), ..x))

#set math.vec(delim: "{")
#set math.mat(delim: "[")

// LaTex-ify the Typst
#set text(hyphenate: true)
#set par(
  spacing: 0.65em,
)

#show heading: set block(below: 1.2em)
#set par(spacing: 1.5em)

= SESM6047 - Finite Element Analysis in Solid Mechanics 2025 Coursework

#set heading(numbering: "1.")

= Introduction
This report details the outcomes of a series of FE analyses conducted on a canting keel design for use on racing yachts. As requested by the technical director, a series analyses were conducted on the design, these were two static structural simulations of the keel under its own weight and when subjected to a forward grounding/impact event and a modal analysis of the keels natural modes of vibration. The report presents figures of the simulations, verification and verification of the results and critiques of the keel design.


== Analysis 1: Static Structural Simulation of Keel Self Weight

For this simulation, a sweep method generated mesh with an element size 0.1m was created. The keel was constrained via a displacement constraint and a cylindrical support applied to the ram bearing and rotation pivot bearing respectively. A global $9.81 m"/"s^2$ acceleration was applied with the resulting lateral deformation shown in *@self-weight-y-deformation*.

#figure(
  image("images/1-self-weight-y-deformation.png", width: 60%),
  caption: [Lateral (y direction) displacement of the fin under its own weight, visualized using a rainbow contour.],
  supplement: [Figure],
  kind: figure,
)<self-weight-y-deformation>

For *@self-weight-y-deformation* the largest magnitude of lateral deformation was *0.0439m*. This is coherent with the right (bulb side) biased weight distribution of the keel. The other outputs from this analysis where the longitudinal normal stress within the fin shown in *@self-weight-z-normal-stress* and the equivalent Von-Mises stress of all Steel parts shown in *@self-weight-eqv-stress*.

#grid(
  columns: 2,
  [#figure(
    image("images/1-self-weight-z-normal-stress.png", width: 95%),
    caption: [Contour plot of longitudinal (z direction) normal stress of the fin under under the keel's self weight.],
    supplement: [Figure],
    kind: figure,
  )<self-weight-z-normal-stress>],
  [#figure(
    image("images/1-self-weight-eqv-stress.png", width: 100%),
    caption: [ Contour plot of equivalent Von-Mises stress of all Steel parts under the keel's self weight.],
    supplement: [Figure],
    kind: figure,
  )<self-weight-eqv-stress>],
)

For *@self-weight-z-normal-stress*, the peak normal stress of *92.1 MPa* was seen at the center of the top face of the finThe normal stress distribution over the height (y direction) of the fin is coherent with cantilever loading, with a high stress on the top face, a principle axis in the middle and a negative compressive stress on the bottom face. For *@self-weight-eqv-stress*, the peak VM stress of *158 MPa* was seen at the stress concentration formed by the rotation bearing on the top face.

#pagebreak()

== Analysis 2: Static Structural Simulation of an Impact or Grounding Event

In this simulation, the keel was constrained in the same way as analysis 1, with a 270 kN load applied to the front face of the bulb (negative x direction). The resulting VM stress for all Steel parts is shown in *@impact-eqv-stress*.

#figure(
  image("images/2-impact-eqv-stress.png", width: 60%),
  caption: [Contour plot of equivalent Von-Mises stress of all Steel parts under impact/grounding load.],
  supplement: [Figure],
  kind: figure,
)<impact-eqv-stress>

In *@impact-eqv-stress* a peak stress of *373 MPa* was seen near the stress concentration produced by the rotation pivot bearing. Another output was the VM stress on only the fin, shown in *@impact-eqv-stress-fin*.

#figure(
  image("images/2-impact-eqv-stress-fin.png", width: 60%),
  caption: [Contour plot of equivalent Von-Mises stress of the fin under impact/grounding load.],
  supplement: [Figure],
  kind: figure,
)<impact-eqv-stress-fin>

In *@impact-eqv-stress-fin*, the peak VM stress of *213 MPa* was seen on the left-hand-side of the fin, with a linear stress variation along the width of the fin, coherent with cantilever loading. The final output was the equivalent VM strain for all steel parts shown in *@impact-eqv-strain*.

#figure(
  image("images/2-impact-eqv-strain.png", width: 60%),
  caption: [Contour plot of equivalent Von-Mises strain of all Steel parts under impact/grounding load.],
  supplement: [Figure],
  kind: figure,
)<impact-eqv-strain>

In *@impact-eqv-strain*, the peak VM strain of *0.19%* was seen in the same place as the peak VM stress, at the tress concentration produced by the rotation pivot bearing.


== Analysis 3: Modal Analysis of Keel Natural Frequency

The final analysis conducted was a modal analysis on the keel. The results and mesh from analysis 1 were fed into a modal analysis where the total deformation and natural frequency for different modes were obtained. These frequencies obtained where for the lateral and longitudinal bending natural frequencies as well as the torsional natural frequency, which were obtained as *2.41 Hz*, *9.55 Hz* and *12.27 Hz* respectively. The deformation behavior for these three modes are shown in *@modal-lateral-freq*, *@modal-long-freq* and *@modal-tor-freq*

#figure(
  image("images/3-modal-lateral-freq.png", width: 50%),
  caption: [Contour plot for the total deformation due to the lateral bending mode of vibration.],
  supplement: [Figure],
  kind: figure,
)<modal-lateral-freq>

#grid(
  columns: 2,
  row-gutter: 0cm,
  [
    #figure(
      image("images/3-modal-long-freq.png", width: 100%),
      caption: [Contour plot for the total deformation due to the longitudinal bending mode of vibration.],
      supplement: [Figure],
      kind: figure,
    )<modal-long-freq>
  ],

  [
    #figure(
      image("images/3-modal-tors-freq.png", width: 100%),
      caption: [Contour plot for the total deformation due to the torsional mode of vibration.],
      supplement: [Figure],
      kind: figure,
    )<modal-tor-freq>
  ],
)

#pagebreak()

// Mesh Convergence Data

#let elem_size = (
  0.15,
  0.13,
  0.125,
  0.1,
  0.09,
  0.08,
  0.07,
  0.05,
  0.04,
  0.03,
)

#let number_of_nodes = (
  8138,
  9592,
  9844,
  10077,
  10639,
  11302,
  15309,
  20470,
  31760,
  59794,
)

#let peak_equivalent_stress = (
  1.55e2,
  1.58e2,
  1.54e2,
  1.58e2,
  1.61e2,
  1.52e2,
  1.53e2,
  1.58e2,
  1.65e2,
  1.85e2,
)

#let peak_normal_stress = (
  9.23e1,
  9.23e1,
  9.23e1,
  9.21e1,
  9.20e1,
  9.20e1,
  9.18e1,
  9.20e1,
  9.18e1,
  9.19e1,
)


#word-count(total => [
  = Verification (#total.words/300 Words)
  To determine the suitability of the mesh, a mesh convergence analysis was conducted. The mesh size was varied from a maximum element size of 0.15m to a minimum of 0.03m for analysis 1 and the value of the outputs were recorded. A plot of these outputs against the number of nodes is shown in *@2-mesh-convergence-plot*.

  #figure(
    caption: [Plot of how analysis 1 stress outputs vary as number of nodes (and elements) increases.],
    lq.diagram(
      height: 8cm,
      width: 13cm,
      title: [Stress Outputs Against Number of Element Nodes],
      xlabel: [Number of Nodes],
      ylabel: [Stress ($M P a$)],
      xaxis: (offset: 0, exponent: 0, tick-distance: 10000),


      xlim: (0, 65000),
      ylim: (0, auto),

      legend: (position: bottom + right),

      lq.plot(number_of_nodes, peak_equivalent_stress, label: [Peak VM Stress]),
      lq.plot(number_of_nodes, peak_normal_stress, label: [Peak Normal Stress]),
    ),
  )<2-mesh-convergence-plot>

  In *@2-mesh-convergence-plot*, despite the normal stress remaining constant as the number of elements (and nodes) increases, the equivalent VM stress continues to increase, suggesting that the mesh has not converged.

  One reason for this could be the meshing method used. The sweep method creates a mesh by extruding a 2D face along a path *@ozeninc2025_understanding_mesh_methods*, however the sweep method struggles when there are sudden changes in cross section. This occurs in the keel geometry at the bulb and this would subsequently lead to the mesh of the bulb being poor in quality or at certain mesh sizes, the mesh failing to mesh the bulb.

  For the aforementioned reasons, it is my advice to the Technical Director that there is a re-meshing of the geometry using a method better suited to meshing complex geometries such as the Multizone method or utilizing a second order tetrahedral mesh to capture the complex geometry whilst also allowing for accurate analysis. For a clearer understanding of the quality of the mesh, mesh metrics such as the aspect ratio or Jacobian ratio can be used to asses which elements are of poor quality and possibly use mesh refinement on these regions.
])

#pagebreak()

#word-count(total => [
  = Validation (#total.words/300 Words)

  To validate the normal stress generated from the FE simulation performed in analysis 1, an analytical calculation is performed. The weight due to the fin and bulb are simplified and modelled acting through the global keel center of mass. The key dimensions for this analytical analysis are shown below

  - Length from the top of the fin to the keel CoM : $L = 2.95m$
  - Fin height at its top : $h = 0.15m$
  - Second moment of area in lateral bending at the top of the fin : $I_(x x) = 105.3 times 10^(-6) m^4$
  - Mass of the bulb: $m_"bulb" = 2468 k g$
  - Mass of the bulb: $m_"fin" = 2147 k g$

    Expressions for the bending moment $M$ as well as for the distance from the neutral axis $y$ based on the parameters defined above are shown in *@fundamental-equations*.

    $
      M = L g (m_"fin" + m_"bulb") quad quad y = h/2
    $<fundamental-equations>

  The expressions in *@fundamental-equations* can be substituted into the equation for bending stress to obtain $sigma_z$, this equation is shown in *@normal-stress*. Using this equation, a calculation can be done to obtain $sigma_z$.

  $
    sigma_z = (M y)/I_(x x) = (L g h (m_"fin" + m_"bulb"))/(2 I_(x x)) = (2.95 times 9.81 times 0.15 times (2147 + 2468))/(2 times 105.3 times 10^(-6)) approx 95 M P a
  $<normal-stress>

  The analytically calculated values for $sigma_z$ and $v_max$ are compared to the numerically calculated values from FE analysis 1 in *@numeric-analytic*.

  #figure(
    table(
      columns: 3,
      inset: 5pt,
      fill: (col, row) => if row == 0 { gray } else if col == 0 { gray },
      align: center + horizon,
      table.header[][*Normal Stress $sigma_z$ (MPa)*][*Maximum Deflection $v_max$ (m)*],
      [*Analytical*], [95], [0.4],
      [*Numeric*], [92.1], [0.493],
      [*Perc Diff %*], [3.05], [23.25],
    ),
    caption: [Table comparing analytical and numerically calculated values for $sigma_z$ and $v_max$.],
  ) <numeric-analytic>

  The analytical and numeric calculations for the normal stress are very similar to one another. One reason there is a significant difference between the calculated values of the deflection is that Euler-Bernoulli beam theory assumes small deflections however near the end of the beam there are large deflections which the FE is able to capture but beam theory is not. The discrepancies in the calculations could also be attributed to how in beam theory and bending stress calculations, the geometry is simplified (neglecting rams, root and the rotation pivot bearing) whereas the FE simulation takes into account more of the geometry.
])

#pagebreak()

#bibliography("refrences.bib")

// If time permits
//  - Picture of malformed bulb
//  - Plot of y deformation
//  - In verification can talk about the tetra mesh recommended by the spec as well as how we could have stress concentrations so we should be using mesh refinement around these areas.
// - Also for section 2 lets say that we think it is ok but room for improvemenet
