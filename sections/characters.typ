#import "../lib.typ": g, i, kanbun, ruby

一般的な日本語組版と同様、#link("https://www.w3.org/International/jlreq/#cl-19")[漢字等（jlreq:cl-19）]、#link("https://www.w3.org/International/jlreq/#cl-15")[平仮名（jlreq:cl-15）]及び#link("https://www.w3.org/International/jlreq/#cl-16")[片仮名（jlreq:cl-16）]が使用され、それに加えてUnicode漢文記号（@kanbun-block-chars）が利用される場合もある。現代の訓点漢文において一般的に、例えば#[@fig:sinobazu]のように、#g("白文")は#link("https://www.w3.org/International/jlreq/#cl-19")[漢字等（jlreq:cl-19）]、#g("振り仮名")は#link("https://www.w3.org/International/jlreq/#cl-15")[平仮名（jlreq:cl-15）]、#g("送り仮名")は#link("https://www.w3.org/International/jlreq/#cl-16")[片仮名（jlreq:cl-16）]、#g("返点")は漢文記号（@kanbun-block-chars）、またはそれに相当する元の文字が使用される（特に「五」など、珍しいが漢文記号に収録されていないものは漢字を使う他ない）。

#figure(
  caption: [「#ruby[しのばずのいけ][不忍池]」（東京都台東区の地名）],
  kanbun("不(ず)ノ[レ]忍(しの)バ池(いけ)"),
) <fig:sinobazu>

== 縦組の字形 / Character Shape in Vertical Writing

縦組と横組とでは、文字の形が異なる場合がある。

#i[
  OpenTypeフォントではOpenType機能の`vert`フラグによって実装されることが多い。
]
