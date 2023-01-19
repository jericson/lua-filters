--[[

bbcode-bga -- Convert to Board Game Geek forma, which seems derived
from BBCode.

Cribbed from: https://github.com/lilydjwg/2bbcode

Invoke with:

```
pandoc -t bbcode-bga.lua
```
--]]

function Doc(body, title, authors, date, variables)
  return body .. '\n'
end


function Header(lev, s, attr)
  return "[heading]" .. s .. "[/heading]"
end

-- https://boardgamegeek.com/wiki/page/Forum_Formatting#toc6

function Strong(s)
  return "[b]" .. s .. "[/b]"
end

function Emph(s)
  return "[i]" .. s .. "[/i]"
end

function Strikeout(s)
  return "[-]" .. s .. "[/-]"
end

function Underline(s)
  return "[u]" .. s .. "[/u]"
end


function Link(s, src, tit)
  local ret = '[url'
  if s then
    ret = ret .. '=' .. src
  else
    s = src
  end
  ret = ret .. "]" .. s .. "[/url]"
  return ret
end

function BlockQuote(s)
  return "[q]\n" .. s .. "\n[/q]"
end

function DoubleQuoted(s)
  return '"' .. s .. '"'
end

function HorizontalRule()
  return '[hr]'
end


function Code(s, attr)
  return "[c]" .. s .. "[/c]"
end

function CodeBlock(s, attr)
  return "[c]\n" .. s .. "\n[/c]"
end

-- Converts footnotes to parantheticals. Might not be what you want.
function Note(s)
  return ' (' .. s .. ') '
end


-- https://pandoc.org/lua-filters.html#remove-spaces-before-citations
function BulletList(items)
  local buffer = {}
  for _, item in pairs(items) do
    table.insert(buffer, "* " .. item)
  end
  return table.concat(buffer, "\n")
end

function OrderedList(items)
  local buffer = {}
  for i = 1, #items do
    table.insert(buffer, i .. ". " .. items[i])
  end
  return table.concat(buffer, "\n")
end


-- Useful for hosting an image outside of BGA
function Image(s, src, tit, attr)
  return "[img]" .. src .. "[/img]"
end

function CaptionedImage(src, tit, caption, attr)
  return "[img]" .. src .. "[/img]"
end


function Blocksep()
  return "\n\n"
end

function Plain(s)
  return s
end

function Para(s)
  return s
end

function Str(s)
  return s
end

function Space()
  return " "
end

function LineBreak()
  return "\n"
end

function SoftBreak()
  return ' '
end


-- The following code will produce runtime warnings when you haven't defined
-- all of the functions you need for the custom writer, so it's useful
-- to include when you're working on a writer.
local meta = {}
meta.__index =
  function(_, key)
    io.stderr:write(string.format("WARNING: Undefined function '%s'\n",key))
    return function() return "" end
  end
setmetatable(_G, meta)
