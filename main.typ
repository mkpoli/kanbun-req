#import "./lib.typ": doc, g, i, kanbun, r, ruby
#let archaism = not ("archaism" in sys.inputs and sys.inputs.archaism == "false")

#set text(
  font: if archaism {
    (
      "遍玨體P1",
      "遍玨體P2",
    )
  } else {
    (
      "Harano Aji Mincho",
    )
  },
  lang: "ja",
)

#set page(
  background: if archaism {
    box(
      width: 100%,
      height: 100%,
      fill: rgb("#f9f2e3"),
    )
  } else {
    none
  },
)

#show: doc.with(
  title-ja: "訓点漢文組版要件",
  title-en: "Requirements for Annotated Kanbun Text Layout",
  editors: (
    "まくぽり (mkpoli)",
  ),
  appendices: include "sections/appendices.typ",
)

#show figure: it => r(it)
#set heading(numbering: "1.")

#include "sections/preface.typ"

#i[
  この文書は執筆中のものです。

  This document is a work in progress.
]

= 緒論 / Introduction
#include "sections/introduction.typ"

= 訓点漢文の文字 / Characters of Annotated Kanbun Text
#include "sections/characters.typ"

= 文字配置 / Character Placement
#include "sections/placement.typ"

#bibliography("refs.yml", title: "参考文献 / Bibliography", style: "american-chemical-society")
