#import "@preview/fletcher:0.5.8": diagram, node, edge
#set page(width: auto, height: auto, margin: 10mm, fill: white)
#set text(font: "Linux Libertine", size: 10pt)

#diagram(cell-size: (40mm, 40mm), {
  node((-2, 0.5), block(stroke: 0.5pt, inset: 8pt, radius: 4pt, [
#align(center, $a * b$)
#line(length: 100%)
#text(size: 9pt, `shape: (2,)`)
]), name: "0")
  node((-2, -1.5), block(stroke: 0.5pt, inset: 8pt, radius: 4pt, [
#align(center, $a$)
#line(length: 100%)
#text(size: 9pt, `shape: (2,)`)
]), name: "1")
  node((-2, 1.5), block(stroke: 0.5pt, inset: 8pt, radius: 4pt, [
#align(center, $b * c$)
#line(length: 100%)
#text(size: 9pt, `shape: (2,)`)
]), name: "2")
  node((0, 0.0), block(stroke: 0.5pt, inset: 8pt, radius: 4pt, [
#align(center, $a * b + b * c + a * c$)
#line(length: 100%)
#text(size: 9pt, `shape: (2,)`)
]), name: "3")
  node((-1, 0.5), block(stroke: 0.5pt, inset: 8pt, radius: 4pt, [
#align(center, $a * b + b * c$)
#line(length: 100%)
#text(size: 9pt, `shape: (2,)`)
]), name: "4")
  node((-3, 0.0), block(stroke: 0.5pt, inset: 8pt, radius: 4pt, [
#align(center, $b$)
#line(length: 100%)
#text(size: 9pt, `shape: (2,)`)
]), name: "5")
  node((-1, -0.5), block(stroke: 0.5pt, inset: 8pt, radius: 4pt, [
#align(center, $a * c$)
#line(length: 100%)
#text(size: 9pt, `shape: (2,)`)
]), name: "6")
  node((-2, -0.5), block(stroke: 0.5pt, inset: 8pt, radius: 4pt, [
#align(center, $c$)
#line(length: 100%)
#text(size: 9pt, `shape: (2,)`)
]), name: "7")
  edge(label("5"), label("0"), "->", label: $text("mul")$)
  edge(label("2"), label("4"), "->", label: $text("add")$)
  edge(label("7"), label("6"), "->", label: $text("mul")$)
  edge(label("6"), label("3"), "->", label: $text("add")$)
  edge(label("1"), label("6"), "->", label: $text("mul")$)
  edge(label("1"), label("0"), "->", label: $text("mul")$)
  edge(label("7"), label("2"), "->", label: $text("mul")$)
  edge(label("5"), label("2"), "->", label: $text("mul")$)
  edge(label("0"), label("4"), "->", label: $text("add")$)
  edge(label("4"), label("3"), "->", label: $text("add")$)
})