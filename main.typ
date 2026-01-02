#import "./lib.typ": doc

#let archaism = not ("archaism" in sys.inputs and sys.inputs.archaism == "false")

#set text(font: if archaism {
  (
    "遍玨體P1",
    "遍玨體P2",
  )
} else {
  (
    "Harano Aji Mincho",
  )
})

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
)

#set heading(numbering: "1.")

= 緒論 / Introduction

この文章は、訓点漢文の組版にあたって求められる事項について説明するものである。なお、訓点漢文を組版するあらゆる事項について網羅的に説明するものではなく、一般的な日本語組版処理の要件と異なるものを中心に、訓点漢文の組版に必要と思われるものを言及するものである。したがって、本文章の要求を実装することで、訓点漢文の組版のほとんどの需要を満たすことができる。また、訓点漢文の組版にあたって表現される慣行について記述するものであり、具体的な実装については考慮しないものとする。よって、本文章は概ねW3Cの「_Requirements for Japanese Text Layout_ 日本語組版処理の要件」（jlreq）の体裁に沿って、訓点漢文に特化した記述を行うものである。

== 訓点漢文の文字

一般的な日本語組版と同様、#link("https://www.w3.org/International/jlreq/#cl-19")[漢字等（jlreq:cl-19）]、#link("https://www.w3.org/International/jlreq/#cl-15")[平仮名（jlreq:cl-15）]及び#link("https://www.w3.org/International/jlreq/#cl-16")[片仮名（jlreq:cl-16）]が使用され、それに加えてUnicode漢文記号（@kanbun-block-chars）が利用される場合もある。

#counter(heading).update(0)
#set heading(numbering: "A.1.")

= 文字表
#include "sections/appendices/characters.typ"

// Appendices
= 用語表 / Glossary
#include "sections/appendices/glossary.typ"

= 文書情報 / Document Metadata

This document is compiled by Typst v#sys.version.

#if "commit" in sys.inputs [
  Current commit: #link("https://github.com/mkpoli/kanbun-req/commit/" + sys.inputs.commit, raw(sys.inputs.commit))
]
