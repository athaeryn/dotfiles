hi link javascriptBraces Comment
hi link javascriptParens Comment

hi link jsReturn       Comment
hi link jsFunction     Comment
hi link jsStorageClass Comment

if has('conceal')
  syntax keyword jsFunction function conceal cchar=λ
  syntax keyword jsNull null conceal cchar=ø
endif

