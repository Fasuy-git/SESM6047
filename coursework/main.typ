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

== Introduction
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
