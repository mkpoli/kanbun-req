#import "@preview/rubby:0.10.2": get-ruby
#import "@preview/scaffolder:0.2.1": get-page-margins
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

/// Information Box
#import "@preview/fontawesome:0.6.0": *

/// Information Box
#let i(body) = context {
  r(
    block(
      fill: rgb("#e6f7ff"),
      stroke: luma(200) + 1pt,
      inset: 1em,
      radius: 0.5em,
      width: page.width - get-page-margins().left - get-page-margins().right,
      stack(
        spacing: 0.5em,
        grid(
          columns: (auto, 1fr),
          column-gutter: 0.5em,
          row-gutter: 1em,
          align: horizon,
          text(fill: rgb("#0074d9"), size: 1.25em, fa-circle-info()),
          text(weight: "bold", fill: rgb("#0074d9"))[註 / Notice],

          none, body,
        ),
      ),
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
    // Use HTML element for HTML target (invisible in PDF)
    html.elem("h1", title)

    // Use standard styling for PDF (hide if target is html to avoid duplication)
    if sys.inputs.at("target", default: none) != "html" {
      set text(size: 1.5em, weight: "bold")
      set align(center)
      v(1em)
      title
      v(1em)
    }
  }
  title-block(
    (
      title-ja,
      linebreak(),
      title-en,
    ).join(),
  )

  let authors-block(authors) = {
    // HTML element for authors
    html.elem("div", attrs: (class: "author"), authors.join(", "))

    // PDF styling
    if sys.inputs.at("target", default: none) != "html" {
      set align(center)
      authors.join(", ")
      v(2em)
    }
  }
  authors-block(editors)
  body

  if appendices != none {
    pagebreak(weak: true)
    title-block("付録 / Appendices")
    appendices
  }
}
