//Import all libraries from template file
#import "template.typ": *

// LaTex-ify the Typst
#set page(margin: 1in)
#set text(font: "New Computer Modern")

// Need to show word count for total word func
#show: word-count

// Large centered title
#v(9cm)

#align()[
  #text(28pt)[#strong[SESM6047]] \

  #text(15pt)[Finite Element Analysis in Solid Mechanics]
]

#v(1fr)

#line(length: 100%)


#align(left)[
  Author: Yusaf Sultan \
  Lecturer: Alex Dickinson \
  Word Count: #total-words  \
  #v(2cm)
]

#pagebreak()  // start new page after title page

#set page(
  header: [
    SESM 6047: Finite Element Analysis in Solid Mechanics
    #h(1fr)
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

// LaTex-ify the Typst
#set text(hyphenate: true)
#set par(
  spacing: 0.65em,
)

#show heading: set block(below: 1.2em)
#set par(spacing: 1.5em)

// Contents Page
#align(left)[


  #outline()

  #v(1cm)

  #outline(
    title: [List of Weeks],
    target: figure.where(kind: "week"),
  )

  #v(1cm)

  #outline(
    title: [List of Figures],
    target: figure.where(kind: figure),
  )

  #v(1cm)

  #outline(
    title: [List of Tables],
    target: figure.where(kind: table),
  )

  #pagebreak()

]<contents>

#include "definitions.typ"

#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: [Eq.])

#set heading(numbering: (n1, ..x) => numbering("1.", n1 - 1, ..x))

#set math.vec(delim: "{")
#set math.mat(delim: "[")

#include "lecture_0/lecture_0.typ"
#include "lecture_1/lecture_1.typ"
#include "lecture_2/lecture_2.typ"
#include "lecture_3/lecture_3.typ"
#include "lecture_4/lecture_4.typ"
