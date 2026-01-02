#let title-block(title) = {
  set text(size: 1.5em)
  set align(center)
  title
}

#let doc(
  title-ja: none,
  title-en: none,
  body,
) = {
  set document(title: title-ja + " / " + title-en)

  title-block(
    (
      title-ja,
      linebreak(),
      title-en,
    ).join(),
  )
  body
}
