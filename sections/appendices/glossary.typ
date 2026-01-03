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
        let term = glossary.name.ja.at(0)

        return (
          (
            glossary.name.ja,
            glossary.name.en,
            glossary.name.zh,
          ).map(name => if type(name) == str or type(name) == content [
            #figure(name, kind: "glossary", supplement: "用語") #label("glossary-" + name)
          ] else if type(name) == array [
            #figure(name.join("\n"), kind: "glossary", supplement: "用語") #label("glossary:" + name.at(0))
          ] else { panic("Invalid glossary name, expected str, content or array, got " + str(type(name))) })
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
