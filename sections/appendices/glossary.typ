#let glossary = (
  (
    "name": (
      "ja": ("漢文",),
      "en": ("Literary Chinese texts",),
      "zh": ("文言文",),
    ),
    "desc": (
      "ja": "古典中国語によって書かれた文章。",
      "en": "Texts written in Classical Chinese.",
    ),
  ),
  (
    "name": (
      "ja": ("古典中国語",),
      "en": ("Classical Chinese",),
      "zh": ("文言", "古典漢語"),
    ),
    "desc": (
      "ja": "古代中国の文語体。",
      "en": "Ancient Chinese literary language.",
    ),
  ),
  (
    "name": (
      "ja": ("漢籍",),
      "en": ("Chinese classics", "classics of Chinese literature"),
      "zh": ("中國古籍",),
    ),
    "desc": (
      "ja": "中国の古典書籍。",
      "en": "Classical Chinese texts.",
    ),
  ),
  (
    "name": (
      "ja": ("漢文訓読",),
      "en": ("Kanbun Kundoku",),
      "zh": ("漢文訓讀",),
    ),
    "desc": (
      "ja": "古典中国語を日本語で読み解く方法。",
      "en": "Method of reading Classical Chinese in Japanese.",
    ),
  ),
  (
    "name": (
      "ja": ("ベタ組",),
      "en": ("solid setting",),
      "zh": ("密排",),
    ),
    "desc": (
      "ja": "漢字の間に余白を置かない組版方法。",
      "en": "Typesetting characters without spaces between them.",
    ),
  ),
  (
    "name": (
      "ja": ("アキ組",),
      "en": ("fixed spacing setting",),
      "zh": ("疏排",),
    ),
    "desc": (
      "ja": "漢字の間に固定の字間余白を置く組版方法。",
      "en": "Typesetting characters with fixed inter-character spacing in between.",
    ),
  ),
)

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
#table(
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
  ..glossary
    .map(glossary => (
      (
        glossary.name.ja,
        glossary.name.en,
        glossary.name.zh,
      ).map(name => if type(name) == str or type(name) == content [
        #figure(name, kind: "glossary", supplement: "用語") #label("glossary-" + name)
      ] else if type(name) == array [
        #figure(name.join("\n"), kind: "glossary", supplement: "用語") #label("glossary:" + name.at(0))
      ] else { panic("Invalid glossary name, expected str, content or array, got " + str(type(name))) }),
      glossary.desc.ja,
      glossary.desc.en,
    ))
    .flatten(),
)
