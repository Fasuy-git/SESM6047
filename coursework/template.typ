#import "@preview/wordometer:0.1.5": total-words, word-count

#import "@preview/equate:0.3.2": equate

#import "@preview/cetz:0.4.2"

#import "@preview/cetz:0.4.2": canvas, draw

#import "@preview/cetz-plot:0.1.3": plot

#import cetz.draw

#import "@preview/pavemat:0.2.0": pavemat

#import "@preview/numty:0.0.5" as nt

#import "@preview/lilaq:0.5.0" as lq

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
  rotation_angle: 0deg,
) = {
  let (x0, y0) = (point_0.at(0), point_0.at(1))
  let connector_length = length * connector_length_perc / 100
  let remaining_length = length - 2 * connector_length
  let q = remaining_length / (4 * segments)
  cetz.draw.group({
    cetz.draw.rotate(rotation_angle)
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
  })
}

#let wall(
  point_0,
  height,
  dash_characteristic_length: 0.2,
  flipped_and_reversed: false,
  rotation_angle: 0deg,
) = {
  let (x0, y0) = (point_0.at(0), point_0.at(1))
  let number_dashes = int(height / dash_characteristic_length)

  cetz.draw.group({
    cetz.draw.rotate(rotation_angle)
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
  })
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
  x-padding: 0,
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
    (x_0 + length / 2 + x-padding, y_1 - line-offset + y-padding),
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
  fill_color: rgb("#00ffe1"),
  node_radi: 0.1,
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
  if node_1 { cetz.draw.circle(point_0, radius: node_radi, fill: white) }
  if node_2 { cetz.draw.circle((x0 + length, y0), radius: node_radi, fill: white) }
}

#let circular-arrow-label(
  point_0,
  content-string,
  start_angle: 60deg,
  end_angle: -230deg,
  radius: 0.5,
  mark_offset_angle: -15deg,
  mark_scale: 1.5,
  content_x_shift: 0,
  content_y_shift: 0,
  represent_moment: false,
  moment_coordinate: (0, 0),
) = {
  let (x0, y0) = (point_0.at(0), point_0.at(1))
  let center_x_shift = radius * calc.cos(start_angle)
  let center_y_shift = radius * calc.sin(start_angle)

  let mark_angle = end_angle + 270deg
  let mark_x_shift = -radius * calc.sin(mark_angle + mark_offset_angle)
  let mark_y_shift = radius * calc.cos(mark_angle + mark_offset_angle)

  cetz.draw.arc((x0 + center_x_shift, y0 + center_y_shift), start: start_angle, stop: end_angle, radius: radius)

  if not represent_moment {
    cetz.draw.mark((x0 + mark_x_shift, y0 + mark_y_shift), mark_angle, symbol: ">>", scale: mark_scale, fill: white)
  } else {
    cetz.draw.line((x0 + mark_x_shift, y0 + mark_y_shift), moment_coordinate)
  }

  cetz.draw.content((x0 - radius * 1.75 + content_x_shift, y0 + content_y_shift), content-string)
}

#let vertical-arrow-label(
  point_0,
  height,
  content_string,
  horizontal_offset: 0,
  x_padding: 0,
  y_padding: 0.25,
  color: black,
) = {
  let (x0, y0) = (point_0.at(0), point_0.at(1))
  cetz.draw.line((x0, y0), (x0 + horizontal_offset, y0), (x0 + horizontal_offset, y0 + height), stroke: color)
  cetz.draw.mark(
    (x0 + horizontal_offset, y0 + height + 0.25),
    90deg,
    symbol: "stealth",
    scale: 1.5,
    stroke: color,
    fill: white,
  )
  cetz.draw.content(
    (x0 + horizontal_offset + x_padding, y0 + height + 0.25 + y_padding),
    text(fill: color)[#content_string],
  )
}

#let vertical-distributed-force(
  point_0,
  length,
  height,
  number_of_arrows,
  content_string,
  height_right_change: 0,
  content_x_shift: 0,
  content_y_shift: 0,
  arrow_x: 0.15,
  arrow_y: 0.25,
  color: black,
) = {
  let (x0, y0) = (point_0.at(0), point_0.at(1))

  // Top line of distributed load
  cetz.draw.line(
    (x0 + arrow_x, y0 + height),
    (x0 + length - arrow_x, y0 + height + height_right_change),
    stroke: color,
  )

  // Horizontal spacing between arrows
  let arrow_padding = (length - 2 * arrow_x) / (number_of_arrows - 1)

  // Line slope for inclined load
  let gradient = height_right_change / (length - 2 * arrow_x)
  let plus_c = (y0 + height) - gradient * (x0 + arrow_x)

  // Draw arrows
  for i in range(0, number_of_arrows) {
    // Actual x position of arrow
    let xi = x0 + arrow_x + arrow_padding * i

    // Evaluated y position of top line at x=xi
    let yi = gradient * xi + plus_c

    // Arrow geometry
    cetz.draw.line(
      (xi, yi),
      (xi, y0),

      (xi + arrow_x, y0 + arrow_y),
      (xi, y0),

      (xi - arrow_x, y0 + arrow_y),
      stroke: color,
    )
  }

  // Draw label one time, not per arrow
  cetz.draw.content(
    (x0 + length / 2 + content_x_shift, y0 + height + 0.35 + content_y_shift),
    content_string,
  )
}

#let rotational_spring(
  number_of_points,
  n,
  scale,
  a: 1,
  b: 0.05,
  color: orange,
  thickness: 1pt,
) = {
  let theta = nt.linspace(-n * calc.pi, n * calc.pi, number_of_points)
  let x = nt.mult(nt.add(a, nt.mult(b, theta)), nt.cos(theta))
  let y = nt.mult(nt.add(a, nt.mult(b, theta)), nt.sin(theta))
  let coords = x.zip(y)
  plot.plot(
    size: (5, 5),
    x-min: -scale,
    x-max: scale,
    y-min: -scale,
    y-max: scale,
    axis-style: none,
    {
      plot.add((coords), style: (stroke: color + thickness))
    },
  )
  cetz.draw.circle((2.5, 2.5), radius: 0.1, fill: white)
}
