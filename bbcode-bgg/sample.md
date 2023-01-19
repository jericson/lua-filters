---
title: Board Game Geek converter
---

I wrote a [Pandoc filter](https://pandoc.org/lua-filters.html) for
converting a variety of documents into Board Game Geek posts. It
helps me because I prefer to use Markdown when I write and I'm
tired of reformatting by hand when I'm ready to post to BAG. The
filter can also help if you have content in one of the other
[input formats Pandoc accepts](https://pandoc.org/index.html),
including HTML.


To use the filter, first [install
pandoc](https://pandoc.org/installing.html), download the filter
and then run:

```
pandoc -t bbcode-bgg.lua [FILES]
```

---

Notes:

## One level of headers

BGG only supports a single level of header. So this will flatten
any structure you might have.

* [Lists aren't directly
  supported.](https://boardgamegeek.com/wiki/page/Forum_Formatting#toc13)
  I'm just faking them. I don't like the way they look [using code
  formatting](https://boardgamegeek.com/thread/1004108/forum-formatting-example-simple-list-using-cc-tags)
  so I don't do that.
   1. Numbered lists aren't supported either.
   2. But again, I can fake them.

* Links are inserted as-is. Links to BGG items (such [Baseball
  Highlights:
  2025](https://boardgamegeek.com/boardgame/151022/baseball-highlights-2045))
  can be generated with [special BGG
  tags](https://boardgamegeek.com/wiki/page/Forum_Formatting#toc3),
  but that's a little on the complicated side, so I don't (yet?)
  support that.

* Images can be external to BGG. The filter doesn't use the
  special tags for images hosted on BGG.

   ![Original and corrected Mordecai Marichal](https://jlericson.com/images/bh_marichal.jpg)

* I like footnotes, but BGG doesn't support them.[^1]

* Obviously you can have **bold**, _italic_, ~~strikethrough~~ and
  [underline]{.underline} if you need them. Some of those styles
  aren't supported by all input formats, however.

As I frequently say:

> Quotations work, but you'll need to add your own attribution to BGG content.


[^1]: Footnotes are included as parentheticals instead. This might
    not be what you want.
