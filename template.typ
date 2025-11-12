#import "@preview/wordometer:0.1.5": total-words, word-count

#import "@preview/equate:0.3.2": equate

#import "@preview/cetz:0.4.2"

#import "@preview/cetz:0.4.2"
#import cetz.draw

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

#let spring(
  point_0,
  length,
  peak_height,
  segments,
  content_string,
  content_x_shift: 0,
  content_y_shift: 0.2,
  connector_length_perc: 15,
  node_1: true,
  node_2: true,
  color: black,
) = {
  let (x0, y0) = (point_0.at(0), point_0.at(1))
  let connector_length = length * connector_length_perc / 100
  let remaining_length = length - 2 * connector_length
  let q = remaining_length / (4 * segments)

  cetz.draw.line(point_0, (x0 + connector_length, y0), stroke: color)
  cetz.draw.line((x0 + length - connector_length, y0), (x0 + length, y0), stroke: color)

  for i in range(0, segments) {
    let sx = x0 + connector_length + i * 4 * q
    cetz.draw.line(
      (sx, y0),
      (sx + q, y0 + peak_height),
      (sx + 2 * q, y0),
      (sx + 3 * q, y0 - peak_height),
      (sx + 4 * q, y0),
      stroke: color,
    )
  }

  if node_1 { cetz.draw.circle(point_0, radius: 0.1, fill: white) }
  if node_2 { cetz.draw.circle((x0 + length, y0), radius: 0.1, fill: white) }

  cetz.draw.content(
    (x0 + length / 2 + content_x_shift, y0 - 1 + content_y_shift),
    content_string,
  )
}

#let wall(
  point_0,
  height,
  dash_characteristic_length: 0.2,
  flipped_and_reversed: false,
) = {
  let (x0, y0) = (point_0.at(0), point_0.at(1))
  let number_dashes = int(height / dash_characteristic_length)

  cetz.draw.line((x0, y0 + height / 2), (x0, y0 - height / 2))

  for i in range(1, number_dashes + 1) {
    if flipped_and_reversed {
      cetz.draw.line(
        (x0, y0 + height / 2 - dash_characteristic_length * i),
        (x0 + dash_characteristic_length, y0 + height / 2 - dash_characteristic_length * (i - 1)),
      )
    } else {
      cetz.draw.line(
        (x0, y0 + height / 2 - dash_characteristic_length * (i - 1)),
        (x0 - dash_characteristic_length, y0 + height / 2 - dash_characteristic_length * i),
      )
    }
  }
}

#let arrow-label(
  x_0,
  y_0,
  y_1,
  content_string,
  x_padding: 0.25,
  y_padding: 0,
  length: 1,
  color: black,
) = {
  cetz.draw.line((x_0, y_0), (x_0, y_1), (x_0 + length, y_1), stroke: color)
  cetz.draw.mark((x_0 + length + 0.25, y_1), 0deg, symbol: "stealth", scale: 1.5, stroke: color)
  cetz.draw.content(
    (x_0 + length + 0.25 + x_padding, y_1 + y_padding),
    text(fill: color)[#content_string],
  )
}

#let length-label(
  x_0,
  y_0,
  y_1,
  length,
  content-string,
  line-offset: 0.25,
  y-padding: 0.25,
  inner: true,
  arrow-length: 1,
  color: black,
) = {
  cetz.draw.line((x_0, y_0), (x_0, y_1), stroke: color)
  cetz.draw.line((x_0 + length, y_0), (x_0 + length, y_1), stroke: color)

  if inner {
    cetz.draw.line(
      (x_0, y_1 - line-offset),
      (x_0 + length, y_1 - line-offset),
      mark: (symbol: "stealth", scale: 1.5),
      stroke: color,
    )
  } else {
    cetz.draw.mark(
      (x_0, y_1 - line-offset),
      0deg,
      symbol: ">",
      scale: 1.5,
      stroke: color,
    )
    cetz.draw.line(
      (x_0 - 0.35, y_1 - line-offset),
      (x_0 - arrow-length, y_1 - line-offset),
      stroke: color,
    )

    cetz.draw.mark(
      (x_0 + length, y_1 - line-offset),
      180deg,
      symbol: ">",
      scale: 1.5,
      stroke: color,
    )
    cetz.draw.line(
      (x_0 + length + 0.35, y_1 - line-offset),
      (x_0 + arrow-length + length, y_1 - line-offset),
      stroke: color,
    )
  }

  cetz.draw.content(
    (x_0 + length / 2, y_1 - line-offset + y-padding),
    text(fill: color)[#content-string],
  )
}

#let distributed-force(
  n,
  x_0,
  y_0,
  string,
) = {
  for i in range(0, n) {
    cetz.draw.line(
      (x_0 + 0.75 * i, y_0),
      ((x_0 + 0.5) + 0.75 * i, y_0),
      ((x_0 + 0.25) + 0.75 * i, y_0 + 0.1),
    )
  }
  cetz.draw.content(((x_0 + x_0 + 0.75 * n) / 2, y_0 + 0.5), string)
}

#let rod(
  point_0,
  length,
  height,
  content_string,
  content_string_y,
  content_string_x_shift: 0,
  fill_color: white,
  node_1: true,
  node_2: true,
) = {
  let (x0, y0) = (point_0.at(0), point_0.at(1))
  cetz.draw.rect((x0, y0 + height / 2), (x0 + length, y0 - height / 2), fill: fill_color)

  // Place content string
  cetz.draw.content(
    (x0 + length / 2 + content_string_x_shift, content_string_y),
    content_string,
  )

  // Place nodes if true
  if node_1 { cetz.draw.circle(point_0, radius: 0.1, fill: white) }
  if node_2 { cetz.draw.circle((x0 + length, y0), radius: 0.1, fill: white) }
}
