hi link javaScriptBraces        Subdued
hi link javaScriptFuncBraces    Subdued
hi link javaScriptParens        Subdued
hi link javaScriptFuncParens    Subdued
hi link javaScriptFuncArgCommas Subdued
hi link javaScriptReturn        Subdued
hi link javaScriptFunction      Subdued
hi link javaScriptStorageClass  Subdued
hi link javaScriptNoise         Subdued

" wtf
hi link jsBraces            Subdued
hi link jsFuncBraces        Subdued
hi link jsParens            Subdued
hi link jsFuncParens        Subdued
hi link jsFuncArgCommas     Subdued
hi link jsReturn            Subdued
hi link jsFunction          Subdued
hi link jsNoise             Subdued
hi link jsGlobalNodeObjects Subdued
hi link jsTryCatchBraces    Subdued
hi link jsClassKeyword      Subdued
hi link jsExtendsKeyword    Subdued

hi link jsArrowFunction     Subdued
hi link jsSuper             Normal

hi link jsNull Normal

hi! jsGlobalObjects ctermfg=1

hi! jsStorageClass cterm=bold ctermfg=7

hi! jsConditional cterm=bold
hi! jsRepeat cterm=bold
hi! jsStatement cterm=bold

hi! jsBooleanTrue cterm=none ctermfg=15
hi link jsBooleanFalse jsBooleanTrue

hi! jsThis cterm=bold ctermfg=15

hi jsArrowFunction cterm=bold

" JSX

hi link xmlTag     Subdued
hi link xmlEndTag  Subdued
hi link xmlAttrib  Normal
hi link xmlEqual   Subdued

hi! xmlTagName cterm=none ctermfg=15

hi! jsFuncName cterm=bold ctermfg=15
hi! jsGenerator cterm=bold ctermfg=15

hi! Flow ctermfg=15 cterm=italic
hi link jsFlowType          Flow
" hi link jsFlowObjectKey     Flow
hi link jsFlowObject        Flow
hi link jsFlowGroup         Flow
hi link jsFlowArgumentDef   Flow
hi link jsFlowDefinition    Flow
hi link jsFlowTypeStatement Flow
hi link jsFlowImportType    Flow
