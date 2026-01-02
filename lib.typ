#let title-block(title) = {
  set text(size: 1.5em)
  set align(center)
  title
}

#let doc(
  title: none,
  body,
) = {
  title-block(title)
  body
}
