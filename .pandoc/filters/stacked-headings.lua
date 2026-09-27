-- Tighten the gap when a heading directly follows another heading
function Blocks(blocks)
  local out = pandoc.List()
  for i, b in ipairs(blocks) do
    if b.t == 'Header' and i > 1 and blocks[i-1].t == 'Header' then
      out:insert(pandoc.RawBlock('latex', '\\vspace*{-1.5em}'))
    end
    out:insert(b)
  end
  return out
end
