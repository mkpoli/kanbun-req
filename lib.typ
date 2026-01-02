#let title-block(title) = {
  set text(size: 1.5em, weight: "bold")
  set align(center)
  v(1em)
  title
  v(1em)
}

#let authors-block(authors) = {
  set align(center)
  authors.join(", ")
  v(2em)
}

#let doc(
  title-ja: none,
  title-en: none,
  editors: (),
  body,
) = {
  set document(title: title-ja + " / " + title-en)
  set page(
    header: context [
      #document.title
    ],
    numbering: "1",
  )

  set par(
    first-line-indent: (
      amount: 1em,
      all: true,
    ),
    justify: true,
  )

  show heading: set block(spacing: 1em)

  title-block(
    (
      title-ja,
      linebreak(),
      title-en,
    ).join(),
  )

  authors-block(editors)
  body
}
