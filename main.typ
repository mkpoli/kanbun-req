#import "./lib.typ": doc

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

#counter(heading).update(0)
#set heading(numbering: "A")

// Appendices
= 用語表 / Glossary
#include "sections/glossary.typ"

= 文書情報 / Document Metadata

This document is compiled by Typst v#sys.version.

#if "commit" in sys.inputs [
  Current commit: #link("https://github.com/mkpoli/kanbun-req/commit/" + sys.inputs.commit, raw(sys.inputs.commit))
]
