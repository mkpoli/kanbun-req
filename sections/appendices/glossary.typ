#let glossary = yaml("glossary.yaml")

#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  } else {
    (bottom: 0.3pt + black)
  },
  align: (x, y) => (
    if y == 0 { center } else if x < 3 { center } else { left }
  ),
)

#show table.cell.where(y: 0): strong


#let show-glossary(glossary-data) = {
  let get-referred-section(ref, lang: "ja") = {
    if ref.element == none {
      return none
    }
    let loc = ref.location()
    let heading-numbers = counter(heading).at(loc)
    let previous-heading = query(selector(heading).before(loc)).last()
    let previous-heading-numbering = numbering(previous-heading.numbering, ..heading-numbers)

    let previous-heading-reference = {
      show link: set text(fill: rgb("#00871b"))
      if lang == "en" {
        link(ref.location(), [§ #previous-heading-numbering])
      } else {
        link(ref.location(), [§#previous-heading-numbering])
      }
    }

    [#previous-heading-reference]
  }

  table(
    columns: 5,
    table.header(
      ..array
        .zip(
          (
            "日本語名",
            "英語名",
            "中国語名",
            "日本語説明",
            "英語説明",
          ),
          (
            "Japanese Name",
            "English Name",
            "Chinese Name",
            "Jpn. Description",
            "Eng. Description",
          ),
        )
        .map(((ja, en)) => ja + linebreak() + en),
    ),
    ..glossary-data
      .map(glossary => {
        let term = if type(glossary.name.ja) == array {
          glossary.name.ja.at(0)
        } else {
          glossary.name.ja
        }

        return (
          (
            glossary.name.ja,
            glossary.name.en,
            glossary.name.zh,
          )
            .enumerate()
            .map(((i, name)) => {
              if i == 0 {
                // For Japanese name column
                if type(name) == array {
                  // Only label the first item
                  let first = name.at(0)
                  let rest = name.slice(1)
                  [
                    #figure(first, kind: "glossary", supplement: "用語") #label("glossary:" + first)
                    #linebreak()
                    #rest.join(linebreak())
                  ]
                } else {
                  // Label the single string
                  [
                    #figure(name, kind: "glossary", supplement: "用語") #label("glossary:" + name)
                  ]
                }
              } else {
                // For other columns (English, Chinese)
                if type(name) == array {
                  name.join(linebreak())
                } else {
                  name
                }
              }
            })
            + (
              glossary.desc.ja
                + context {
                  set text(lang: "ja")
                  let references = query(ref.where(target: label("glossary:" + term)))
                  if references.len() > 0 [
                    \ \
                    #references.map(r => get-referred-section(r, lang: "ja")).join("、")を見よ。
                  ]
                },
              glossary.desc.en
                + context {
                  set text(lang: "en")
                  let references = query(ref.where(target: label("glossary:" + term)))
                  if references.len() > 0 [
                    \ \
                    See #references.map(r => get-referred-section(r, lang: "en")).join(", ")
                  ]
                },
            )
        )
      })
      .flatten(),
  )
}


#show-glossary(glossary)
