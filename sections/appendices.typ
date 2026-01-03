#counter(heading).update(0)
#set heading(numbering: "A.1.")

= 文字表 / Characters Table
#include "./appendices/characters.typ"

= 用語表 / Glossary
#include "./appendices/glossary.typ"

= 文書情報 / Document Metadata

This document is compiled by Typst v#sys.version.

#if "commit" in sys.inputs [
  Current commit: #link("https://github.com/mkpoli/kanbun-req/commit/" + sys.inputs.commit, raw(sys.inputs.commit))
]
