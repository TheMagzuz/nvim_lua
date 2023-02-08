local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local t = ls.text_node
local i = ls.insert_node

ls.config.setup({enable_autosnippets = true})

vim.keymap.set("i", "<C-j>", function() ls.jump(1) end)

ls.add_snippets("tex", {
  s({trig = "EES", snippetType = "autosnippet"}, fmta([[
  \begin{equation*}
    <>
  \end{equation*}

  ]], i(1))
  )
})
