" Vim syntax file
" Language:         Robot Framework
" Maintainer:       Nick Stevens <nick@bitcurry.com>
" Latest Revision:  2014-06-09

if exists('b:current_syntax')
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

" TODO use sync region to reduce overhead of syncing
syn sync fromstart

let s:sep = '\( \)\{2,}'
execute 'syn match robotSep '.string(s:sep)

syn match seleniumLibrary   "\c\<\(Add Location Strategy\|Alert Should Be Present\|Assign Id To Element\|Call Selenium Api\|Capture Page Screenshot\|Capture Screenshot\|Checkbox Should Be Selected\|Checkbox Should Not Be Selected\|Choose Cancel On Next Confirmation\|Choose File\|Click Button\|Click Element\|Click Flex Element\|Click Image\|Click Link\|Close All Browsers\|Close Browser\|Close Window\|Confirm Action\|Current Frame Contains\|Current Frame Should Contain\|Delete All Cookies\|Delete Cookie\|Double Click Element\|Double Click Flex Element\|Drag And Drop\|Element Should Be Disabled\|Element Should Be Enabled\|Element Should Be Visible\|Element Should Contain\|Element Should Not Be Visible\|Element Text Should Be\|Execute Javascript\|Flex Element Property Should Be\|Flex Element Should Exist\|Flex Element Should Not Exist\|Flex Element Text Should Be\|Focus\|Frame Should Contain\|Frame Should Contain Text\|Get Alert Message\|Get All Links\|Get Cookie Value\|Get Cookies\|Get Element Attribute\|Get Horizontal Position\|Get List Items\|Get Location\|Get Matching Xpath Count\|Get Source\|Get Table Cell\|Get Text\|Get Title\|Get Value\|Get Vertical Position\|Get Window Identifiers\|Get Window Names\|Get Window Titles\|Go Back\|Go To\|Input Password\|Input Text\|Input Text Into Flex Element\|List Selection Should Be\|List Should Have No Selections\|Location Should Be\|Location Should Contain\|Log Source\|Maximize Browser Window\|Mouse Down\|Mouse Down On Image\|Mouse Down On Link\|Mouse Out\|Mouse Over\|Mouse Up\|Open Browser\|Open Context Menu\|Page Should Contain\|Page Should Contain Button\|Page Should Contain Checkbox\|Page Should Contain Element\|Page Should Contain Image\|Page Should Contain Link\|Page Should Contain List\|Page Should Contain Radio Button\|Page Should Contain Textfield\|Page Should Not Contain\|Page Should Not Contain Button\|Page Should Not Contain Checkbox\|Page Should Not Contain Element\|Page Should Not Contain Image\|Page Should Not Contain Link\|Page Should Not Contain List\|Page Should Not Contain Radio Button\|Page Should Not Contain Textfield\|Press Key\|Press Key Native\|Radio Button Should Be Set To\|Radio Button Should Not Be Selected\|Register Keyword To Run On Failure\|Reload Page\|Select All From List\|Select Checkbox\|Select Flex Application\|Select Frame\|Select From Flex Element\|Select From List\|Select Radio Button\|Select Window\|Set Selenium Speed\|Set Selenium Timeout\|Simulate\|Start Selenium Server\|Stop Selenium Server\|Submit Form\|Switch Browser\|Table Cell Should Contain\|Table Column Should Contain\|Table Footer Should Contain\|Table Header Should Contain\|Table Row Should Contain\|Table Should Contain\|Textfield Should Contain\|Textfield Value Should Be\|Title Should Be\|Unselect Checkbox\|Unselect Frame\|Unselect From List\|Wait For Condition\|Wait For Flex Element\|Wait Until Page Contains\|Wait Until Page Contains Element\|Wait Until Page Loaded\|Xpath Should Match X Times\)\>"

"------------------------------------------------------------------------
" Numeric Constants
"------------------------------------------------------------------------
" Integer with - + or nothing in front
syn match robotNumber '\<\d\+\>'
syn match robotNumber '\<[-+]\d\+\>'

" Floating point number with decimal no E or e (+,-)
syn match robotNumber '\<\d\+\.\d*\>'
syn match robotNumber '\<[-+]\d\+\.\d*\>'

" Floating point like number with E and no decimal point (+,-)
syn match robotNumber '\<[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+\>'
syn match robotNumber '\<\d[[:digit:]]*[eE][\-+]\=\d\+\>'

" Floating point like number with E and decimal point (+,-)
syn match robotNumber '\<[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+\>'
syn match robotNumber '\<\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+\>'

" Special (escaped) character as defined in Robot's syntax.
syn match robotSpecial          display "\\\(\${.*}\|\\\|#\|[n|r|t]\)"

" As variables may be used next to each other, do a non-greedy match.
" Alternatively, match only alphanumeric chars inside brackets.
syn match robotScalarVariable  "\${.\{-}}"
syn match robotListVariable    "@{.\{-}}"

" Operators
syn match robotOperator     "==\|="

" Builtins
syn match robotBuiltin      "\c\<\(Call Method\|Catenate\|Comment\>\|Convert To Boolean\|Convert To Integer\|Convert To Number\|Convert To String\|Create List\|Evaluate\|Exit For Loop\|Fail\>\|Fatal Error\|Get Count\>\|Get Length\|Get Library Instance\|Get Time\|Get Variables\|Import Library\|Import Resource\|Import Variables\|Length Should Be\|Log\|Log Many\|Log Variables\|No Operation\|Regexp Escape\|Remove Tags\|Repeat Keyword\|Replace Variables\|Run Keyword\|Run Keyword And Continue On Failure\|Run Keyword And Expect Error\|Run Keyword And Ignore Error\|Run Keyword If\|Run Keyword If All Critical Tests Passed\|Run Keyword If All Tests Passed\|Run Keyword If Any Critical Tests Failed\|Run Keyword If Any Tests Failed\|Run Keyword If Test Failed\|Run Keyword If Test Passed\|Run Keyword If Timeout Occurred\|Run Keyword Unless\|Run Keywords\|Set Global Variable\|Set Library Search Order\|Set Log Level\|Set Suite Variable\|Set Tags\|Set Test Message\|Set Test Variable\|Set Variable\|Set Variable If\|Should Be Empty\|Should Be Equal\|Should Be Equal As Integers\|Should Be Equal As Numbers\|Should Be Equal As Strings\|Should Be True\|Should Contain\|Should Contain X Times\|Should End With\|Should Match\|Should Match Regexp\|Should Not Be Empty\|Should Not Be Equal\|Should Not Be Equal As Integers\|Should Not Be Equal As Numbers\|Should Not Be Equal As Strings\|Should Not Be True\|Should Not Contain\|Should Not End With\|Should Not Match\|Should Not Match Regexp\|Should Not Start With\|Should Start With\|Sleep\|Variable Should Exist\|Variable Should Not Exist\|Wait Until Keyword Succeeds\)\>"

" Common settings
syn match robotCommonSet  contained  "\c\[\(Documentation\|Timeout\)\]"

" Testcase settings
syn match robotTestCasesHeader contained "\c^\(\*\+\)\s*\(test cases\)\s*\1"
syn match robotTestcaseSet contained "\c\[\(Tags\|Setup\|Teardown\|Precondition\|Postcondition\|Template\)\]"
syn region robotTestCasesBlock start="\c^\(\*\+\)\s*\(test cases\)\s*\1" end="^\*\+"me=s-1 contains=robotKeywordName,robotCommonSet,robotTestcaseSet,robotTestCasesHeader,robotScalarVariable,robotListVariable,robotComment,robotStatement,robotCommonSet,robotFillerBackslash

" Settings (global)
let s:settings_section_start = ""
syn match robotSetup        contained "\c\(Suite\|Test\) \(Setup\|Teardown\|Precondition\|Postcondition\)"
syn match robotSettings     contained "\c\(Library\|Resource\|Variables\|Documentation\|Metadata\|Force Tags\|Default Tags\|Test Template\|Test Timeout\)"
syn match robotSettingsHeader contained "\c^\(\*\+\)\s*\(settings\)\s*\1"
syn region robotSettingsTable start="\c^\(\*\+\)\s*\(settings\)\s*\1" end="^\*\+"me=s-1 contains=robotSetup,robotSettings,robotSettingsHeader,robotComment,robotEllipsis,robotScalarVariable,robotListVariable,robotComment,robotString,robotFillerBackslash

" Keywords
syn match robotKeywordSet contained  "\c\[\(Arguments\|Return\)\]"
syn match robotKeywordsHeader contained "\c\(\*\+\)\s*\(user \)\?keywords\s*\1$"
syn match robotKeywordName contained '^\(\w \?\)\+'
syn region robotKeywordsTable start="\c\(\*\+\)\s*\(user \)\?keywords\s*\1$" end="^\*\+"me=s-1 contains=robotKeywordSet,robotKeywordsHeader,robotKeywordName,robotScalarVariable,robotListVariable,robotComment,robotStatement,robotCommonSet,robotString,robotEllipsis,robotFillerBackslash

" Variables
syn match robotVariablesHeader contained "\c\(\*\+\)\s*\(variables\)\s*\1$"
syn region robotVariablesTable start="\c^\(\*\+\)\s*\(variables\)\s*\1" end="^\*\+"me=s-1 contains=robotKeywordSet,robotVariablesHeader,robotScalarVariable,robotListVariable,robotComment,robotString,robotEllipsis,robotFillerBackslash

" Single-line comments
syn keyword robotTodo contained TODO FIXME XXX NOTE
syn match robotComment "#.*$" contains=robotTodo

" Constants/strings
syn region robotString          start='"' excludenl end='"' contains=robotScalarVariable,robotListVariable
syn match robotEllipsis         display "\.\.\."
syn match robotPath             display "\(\.\{1,2}\/\)\=\(\(\h\|\d\)\+\/\)\+\(\(\h\|\d\)\+\.\h\+\)\{,1}$"
execute 'syn match robotFillerBackslash contained "'.s:sep.'\\'.s:sep.'"'

" Statements
syn match robotStatement '\<\(IN\|IN RANGE\)\>'
syn match robotStatement ':FOR'



hi def link          robotComment   Comment
hi def link          robotBuiltin   Comment
hi def link             robotPath   Constant
hi def link     robotTestCaseName   Underlined
hi def link      robotKeywordName   Underlined
hi def link   robotKeywordsHeader   Special
hi def link   robotSettingsHeader   Special
hi def link  robotTestCasesHeader   Special
hi def link  robotVariablesHeader   Special
hi def link  robotFillerBackslash   Special
hi def link            robotSetup   Include
hi def link         robotSettings   Include
hi def link           robotImport   Include
hi def link        robotCommonSet   Keyword
hi def link       robotKeywordSet   Keyword
hi def link      robotTestcaseSet   Keyword
hi def link       seleniumLibrary   Keyword
hi def link           robotNumber   Number
hi def link         robotOperator   Operator
hi def link          robotSpecial   Special
hi def link        robotStatement   Statement
hi def link         robotEllipsis   String
hi def link           robotString   String
hi def link             robotTodo   Todo
hi def link   robotScalarVariable   Type
hi def link     robotListVariable   Type

let b:current_syntax = "robot"
"------------------------------------------------------------------------
let &cpo = s:cpo_save
unlet s:cpo_save
unlet s:sep
" vim600: set fdm=marker:
