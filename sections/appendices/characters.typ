#import "@preview/unichar:0.3.1": codepoint

== 漢文用記号 / Kanbun <kanbun-block-chars>

#let kanbun-block-chars = "㆐㆑㆒㆓㆔㆕㆖㆗㆘㆙㆚㆛㆜㆝㆞㆟"
#let common-names = (
  "㆐": ("竪線", "縦棒", "ハイフン"),
  "㆑": "レ点",
  "㆒": "一点",
  "㆓": "二点",
  "㆔": "三点",
  "㆕": "四点",
  "㆖": "上点",
  "㆗": "中点",
  "㆘": "下点",
  "㆙": "甲点",
  "㆚": "乙点",
  "㆛": "丙点",
  "㆜": "丁点",
  "㆝": "天点",
  "㆞": "地点",
  "㆟": "人点",
)

#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  } else {
    (bottom: 0.3pt + black)
  },
  align: (x, y) => (
    (
      if y == 0 { center } else if x < 2 or x >= 3 { center } else {
        left
      }
    )
      + horizon
  ),
)
#import "@preview/oxifmt:1.0.0": strfmt
#show table.cell.where(y: 0): strong
#table(
  columns: 5,
  table.header(
    ..array
      .zip(
        (
          "字形",
          "コードポイント",
          "名称",
          "通称",
          "英語説明",
        ),
        (
          "Character",
          "UCS Codepoint",
          "UCS Name",
          "Common Name",
        ),
      )
      .map(((ja, en)) => ja + linebreak() + en),
  ),
  ..kanbun-block-chars
    .clusters()
    .map(char => (
      char,
      strfmt("U+{:04X}", codepoint(char).code),
      table.cell(
        box(
          width: 14em,
          codepoint(char).name,
        ),
      ),
      {
        let names = common-names.at(char, default: ())
        if type(names) == str {
          names
        } else if type(names) == array {
          names.join(linebreak())
        }
      },
      "",
    ))
    .flatten(),
)
