#import "@preview/rubby:0.10.2": get-ruby

#let ruby = get-ruby()

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

#let r(content) = {
  html.frame(block(width: 45em, content))
}
#show figure: it => r(it)

/// Information Box
#let i(body) = {
  r(
    block(
      fill: rgb("#7be0ff28"),
      stroke: rgb("#ccc") + 1pt,
      inset: 1em,
      {
        [註 Notice]
        linebreak()
        body
      },
    ),
  )
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
    pagebreak(weak: true)
    title-block("付録 / Appendices")
    appendices
  }
}
