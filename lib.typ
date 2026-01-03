#let g(term) = context {
  show ref: it => {
    if it.element == none {
      return it
    }
    show link: set text(fill: orange)
    link(it.element.location(), it.element.body)
  }

  ref(label("glossary:" + term))
}

#let doc(
  title-ja: none,
  title-en: none,
  editors: (),
  appendices: none,
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
  show link: set text(fill: rgb("#144a9a"))
  show ref: set text(fill: rgb("#144a9a"))

  show ref: it => {
    if it.element != none and it.element.func() == figure and it.element.at("kind", default: none) == "glossary" {
      set text(fill: orange)
      link(it.element.location(), it.element.body)
    } else {
      it
    }
  }

  let title-block(title) = {
    set text(size: 1.5em, weight: "bold")
    set align(center)
    v(1em)
    title
    v(1em)
  }
  title-block(
    (
      title-ja,
      linebreak(),
      title-en,
    ).join(),
  )

  let authors-block(authors) = {
    set align(center)
    authors.join(", ")
    v(2em)
  }
  authors-block(editors)
  body

  if appendices != none {
    title-block("付録 / Appendices")
    appendices
  }
}
