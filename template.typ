#import "@preview/wordometer:0.1.5": total-words, word-count

#import "@preview/equate:0.3.2": equate

#import "@preview/cetz:0.3.0"

#import "@preview/circuiteria:0.1.0"

#import "@preview/mechanical-system-cetz-34j:0.1.0": spring, wall

#let lecture(title, level, week-num) = {
  // Define week tag box
  let week-tag = box(
    fill: luma(90%),
    inset: 4pt,
    radius: 4pt,
    stroke: none,
    text(0.9em, weight: 600)[START OF WEEK #week-num],
  )

  // Return the grid layout: heading left, tag right
  grid(
    columns: (1fr, auto),
    gutter: 1em,
    [#heading(level: level, title)],
    [
      #figure(
        week-tag,
        supplement: [Week],
        kind: "week",
      )
    ],
  )
}
