#import "./lib.typ": doc, g, ruby
#import "hundouk/src/lib.typ": kanbun
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

#set heading(numbering: "1.")

この文書は、PDF版が#link("https://github.com/mkpoli/kanbun-req")[GitHub上]（#link("https://github.com/mkpoli/kanbun-req/releases/latest")）に配布され、HTML版が#link("https://kanbun-req.mkpo.li/")にて公開されている。意見、訂正等は#link("https://github.com/mkpoli/kanbun-req/issues")[GitHubレポジトリのIssues]また#link("https://github.com/mkpoli/kanbun-req/pulls")[Pull Request]にて議論するものとする。

The PDF version of this document is distributed on #link("https://github.com/mkpoli/kanbun-req")[GitHub] (#link("https://github.com/mkpoli/kanbun-req/releases/latest")), and the HTML version is published at #link("https://kanbun-req.mkpo.li/"). Opinions, corrections, etc. shall be discussed via #link("https://github.com/mkpoli/kanbun-req/issues")[Issues in the GitHub repository] or #link("https://github.com/mkpoli/kanbun-req/pulls")[Pull Requests].


= 緒論 / Introduction

この文書は、#g("訓点漢文")の組版にあたって求められる事項について説明するものである。なお、訓点漢文を組版するあらゆる事項について網羅的に説明するものではなく、一般的な日本語組版処理の要件と異なるものを中心に、訓点漢文の組版に必要と思われるものを言及するものである。したがって、本文書の要求を実装することで、訓点漢文の組版のほとんどの需要を満たすことができる。また、訓点漢文の組版にあたって表現される慣行について記述するものであり、具体的な実装については考慮しないものとする。よって、本文書は概ねW3Cの「_Requirements for Japanese Text Layout_ 日本語組版処理の要件」（jlreq）の体裁に沿って、訓点漢文に特化した記述を行うものである。

= 訓点漢文の文字 / Characters of Annotated Kanbun Text

一般的な日本語組版と同様、#link("https://www.w3.org/International/jlreq/#cl-19")[漢字等（jlreq:cl-19）]、#link("https://www.w3.org/International/jlreq/#cl-15")[平仮名（jlreq:cl-15）]及び#link("https://www.w3.org/International/jlreq/#cl-16")[片仮名（jlreq:cl-16）]が使用され、それに加えてUnicode漢文記号（@kanbun-block-chars）が利用される場合もある。現代の訓点漢文において一般的に、例えば#[@fig:sinobazu]のように、#g("白文")は#link("https://www.w3.org/International/jlreq/#cl-19")[漢字等（jlreq:cl-19）]、#g("振り仮名")は#link("https://www.w3.org/International/jlreq/#cl-15")[平仮名（jlreq:cl-15）]、#g("送り仮名")は#link("https://www.w3.org/International/jlreq/#cl-16")[片仮名（jlreq:cl-16）]、#g("返点")は漢文記号（@kanbun-block-chars）、またはそれに相当する元の文字が使用される（特に「五」など、珍しいが漢文記号に収録されていないものは漢字を使う他ない）。

#figure(
  caption: [「#ruby[しのばずのいけ][不忍池]」（東京都台東区の地名）],
  kanbun("不(ず)[レ]忍(しの)バノ池(いけ)"),
) <fig:sinobazu>

= 文字配置 / Character Placement

== アキ組とベタ組 / Akigumi and Betagumi

一般的な日本語組版は、#g("ベタ組")を基本にするのに対し、訓点漢文の組版はベタ組の他に、#g("アキ組")も常用される。

#let 登鸛雀樓 = "白日依リテ[レ]山ニ盡キ，黃河入リテ[レ]海ニ流ル。欲シ[二]窮メント[一]千里ノ目ヲ，更ニ上ル一層ノ樓。"
#grid(
  columns: 2,
  figure(
    caption: "ベタ組の「登鸛雀樓」",
    gap: 2em,
    kanbun(
      height: 10em,
      登鸛雀樓,
      use-unicode-kanbun: false,
    ),
  ),
  figure(
    caption: "アキ組の「登鸛雀樓」",
    gap: 2em,
    kanbun(
      height: 12em,
      登鸛雀樓,
      tight: false,
      use-unicode-kanbun: false,
    ),
  ),
)

