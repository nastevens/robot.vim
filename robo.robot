# Copyright 2012 Nitor Creations Oy
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file tests/demonstrates many of the syntax coloring features of the robot editor.
# Some syntax errors are deliberate, but some may be accidental. Please refer to documentation as needed.

***Settings*** # lol
...  bogus but ignored
Library     OperatingSystem
...  bogus but ignored
 Resource   resource.txt
    # foo

* Settings    *
...  bogus
Library     OperatingSystem  arg
Library  OperatingSystem  WITH NAME  os
Resource   resource.txt  no arg allowed
Variables  lol.py  arg  arg2
Library     
...  OperatingSystem
    # foo
...  namedarg=HELLO
...  WiTH NaME
...  os
Force Tags  forced tag 1  forced tag 2
Default Tags  default tag 1  default tag 2
Test Setup  Default Setup  arg1  arg2  ${TEST_NAME} 
Test Teardown  Default Teardown  arg1  arg2
Test Template  Default Template  arg1?  arg2?
Test Template  ${NOTSUPPORTED_IN_2.6.3}
Test Timeout   12s  CUSTOM ERROR MESSAGE HERE  WITH NAME

Documentation  This is the coolest thing  in *the* _universe_
...            including, but not limited to http://news.ycombinator.com/
Metadata  version  2.0
Metadata  info  no info  available
Suite Setup  Selenium2Driver  lol
Suite Teardown  Selenium3Driver  lal  # 3D river
Library  @{name_and_args_is_error}
Library  ${name}  @{args}  # is ok
Suite Setup  @{error}
Suite Teardown  @{error}
Default Tags  @{ok}
Suite Setup  \  lol  # \ is keyword here
Suite Teardown  \  :FOR  ${lol}  IN  @{list}  # \ is keyword here
Suite Teardown  :FOR  ${lol}  IN  @{list}  # :FOR is keyword here
Test Setup  ${var} =  :FOR  ${lol}  IN  @{list}  # :FOR is keyword here, TODO is ${var} allowed here?
Test Setup  \  ${var} =  :FOR  ${lol}  IN  @{list}  # \ is keyword here
Test Setup  ${var} =  \  :FOR  ${lol}  IN  @{list}  # \ is keyword here

***Variables***  this blabber should be ignored  without warnings
${MESSAGE}  Hello, world!
${MESSAGE2} =  Hello, world!
@{hello}  Hello  worldz
...       of  multiverses
@{yoyo}  @{hello}  +1
${MESSAGE}  Hello, worl  d! ${OTHERMESSAGE}
${MESSAGE}  Hello, worl  d! ${OTHERMESSAGE}
{MESSAGE}  Hello, worl  d! ${OTHERMESSAGE}
MESSAGE}  Hello, worl  d! ${OTHERMESSAGE}
MESSAGE  Hello, worl  d! ${OTHERMESSAGE}
${MESS}AGE}  Hello, worl  d! ${OTHERMESSAGE}
    # foo

***Test Cases***
    # foo
...  bogus  continuation
    ...   another bogus

Simple
    [Documentation]  valid  lorem ipsum  dolor sit amet and other Documentation
    [Tags]  sampletag1  sampletag2
    [Setup]  SomeKeyword  somearg
    [Teardown]  ${foo} =  OtherKeyword  otherarg
    [Template]  TKeyword  targ1?  targ2?
    [Template]  \  TKeyword  targ1?  targ2?  # \ is keyword here
    [Template]  :FOR  ${lol}  IN  @{list}  # :FOR is keyword here
    [Setup]  ${var} =  :FOR  ${lol}  IN  @{list}  # :FOR is keyword here, TODO is ${var} allowed here?
    [Timeout]  12s  SUPER FAILURE!!
	...  TODO this is probably also a bogus continuation
	# this is broken in 2.6.3:
	[Template]  ${var}
	# broken settings:
    [LoremIpsum]  lol
    [Arguments]  lol
    [Return]  lol
	Call
    ...   first parameter
    ...   second parameter
\   ...   ${somearg}
...  fourth parameter, wrongly indented

Default & named args
    Call something  arg3=val3  arg2=val2  arg1=${foo}

Env vars
    Log  %{JAVA_HOME}  %{file.encoding}

My Test  [Documentation]  Example test
	...  that continues on the next line
    Log         ${MESSAGE}
    My Keyword  /tmp
    # foo
    Call foo  \  arg2  \  arg4

Another Test  Call on first line  with argument
    Should Be Equal  ${MESSAGE}  Hello, world!
    ${val} =  Get Value
    ${val1}  ${val2} =  Get Values
    ${val1}  ${val2}  @{valn} =  Get Values
    @{valn} =  Get Values
    ${val1}
    ...  ${val2}
    ...  @{valn} =
    ...  # lol
    ...  Get Values
    ...  lol
    ...  foo
    ${val1}
    ...  ${val2}
    ...  @{valn} =
    ...  Get Values
    ...  # lol
    ...  lol
    ...  foo
    ${val1}
    ...  ${val2}
    ...  # lol this breaks it.. but what does robot framework react to this? 
    ...  @{valn} =
    ...  Get Values
    ...  lol
    # fail cases:
    ${val1}  \  ${val2}

BDD büllshitt  # perhaps the BDD keywords could be in italics or something?
    Given I suck at robot framework
    When I try to do something
    And It's late in the afternoon
    And I'm in the office
    Then Fail should happen
    Log  EPIC SUCCESS

***Keywords***
...  bogus  continuation
    ...  another bogus
    # foo
Simple keyword  [Arguments]  ${path}  ${extension}=.java  @{rest}
    Say hello

For x in list
    [Arguments]
    ...  ${path}
\   ...  ${alternative_line_continuation}
    :FOR  ${item}  IN  @{list}
    \  Say hello to  ${item}
\   \  Say goodbye to  ${item}
    :FOR  ${item1}  ${item2}  IN  @{list}
    \  Say hello to  ${item}
    \  Say goodbye to  ${item}
    :FOR  ${number}  IN RANGE  42  # 0 - 41
    \  Count to  ${number}
    :FOR  ${number}  IN RANGE  3  6  # 3 - 5
    \  Count to  ${number}
    :FOR  ${number}  IN RANGE  0  25  10  # 0, 10, 20
    \  Count to  ${number}
    Exit For Loop  # TODO warning: fails outside for loop
    :FOR  ${item1}  ${item2}  IN  @{list}
    \  ${foo}  \  ${bar} =  Say goodbye to  ${item}  # second \ denotes first argument to keyword ${foo}
    \  ${foo}  ${bar} =  \  Say hello to  ${item}  # second \ denotes "empty" keyword
    \  ${foo}  ${bar} =  Say goodbye to  ${item}
    \  :FOR  ${item1}  ${item2}  IN  @{list}
    \  \  Say hello to  ${item}
    \  \  ${foo}  ${bar} =  Say goodbye to  ${item}

Recursive keywords
    Run Keyword  Log  Hello
    Run Keyword If  1 < 2  Log  Hello
    Run Keyword  Run Keyword If  1 < 2  Run Keyword If  2 < 3  Run Keyword And Continue On Failure  Log  Awesome  Awesome  Awesome  Awesome  Awesome
    Repeat Keyword  5  Echo  LOL
    Wait Until Keyword Succeeds  2 min  5 sec  Log  Epic success

My Keyword is the ${foo} greatest
    # Not-allowed tags:
    [Arguments]  using arguments here is an error because they
    ...          are embedded in the keyword name
    [Tags]  foo
    [Setup]  foo
    [Template]  foo
    [LoremIpsum]  lol
    # These are ok:
    [Documentation]
    [Teardown]  foo
    [Timeout]  12s  slow keyword is too slow
    Array entry  @{array}[0]
    Directory Should Exist  ${path} # ${fooled}
    Directory Sho${foo}uld Exist    ${path}  lol${path}lol  # not ${fooled}  at all
    Directory Should Exis\##t    ${path}  lol${path}lol
    Fooo
    Fooo 
    Fooo  
    Fooo   
    Fooo    
    Fooo	
    Fooo	foo
    Fooo    foo
    Fooo   foo
    Fooo  foo
    Fooo foo
    Fooo\
    Fooo \
    Fooo  \
    Fooo   \
    Fooo\ 
    Fooo\  
    Fooo\   
    Fooo\    
    Bar\  \  \  zot
    Bar \ \ \ zot
    ${lol} =  Keyword
    [Return]  ${lol}  ${lol}
    #hello world

Madness combo
  Variable madness with regulular expressions like 123 or 4444
  Variable madness with regulular expressions like ABC or 4444  # no match
  Variable madness with regulular expressions like 123 or 444   # ---"----

Variable madness with regulular expressions like ${varname:\d+} or ${varname2:\d{4\}}
    No operation

A broken regexp should result in an error: ${fail:*}
    No comments

Number variables
  Should be integer  ${80}
  Should be float  ${3.14159265358979323846264338327950}
  Should be equal  ${0b1011}  ${11}
  Should be equal  ${0o10}  ${8}
  Should be equal  ${0xff}  ${255}
  Should be equal  ${0B1010}  ${0XA}

Other specials
  Echo  ${true}  ${false}  ${None}  ${null}

One Space      Should Be Equal  ${SPACE}        \ \
Four Spaces    Should Be Equal  ${SPACE * 4}    \ \ \ \ \
Ten Spaces     Should Be Equal  ${SPACE * 10}   \ \ \ \ \ \ \ \ \ \ \
Quoted Space   Should Be Equal  "${SPACE}"      " "
Quoted Spaces  Should Be Equal  "${SPACE * 2}"  " \ "
Empty          Should Be Equal  ${EMPTY}        \

Automatic variables
  Echo  ${TEST NAME}
  ...   @{TEST TAGS}
  ...   ${TEST STATUS}
  ...   ${TEST MESSAGE}
  ...   ${PREV TEST NAME}
  ...   ${PREV TEST STATUS}
  ...   ${PREV TEST MESSAGE}
  ...   ${SUITE NAME}
  ...   ${SUITE SOURCE}
  ...   ${SUITE STATUS}
  ...   ${SUITE MESSAGE}
  ...   ${OUTPUT FILE}
  ...   ${LOG FILE}
  ...   ${REPORT FILE}
  ...   ${SUMMARY FILE}
  ...   ${DEBUG FILE}
  ...   ${OUTPUT DIR}

Extended variable syntax
  Lol  ${OBJECT.name}  ${OBJECT.greet('Fit')}  ${DICTIONARY[2]}
  ${string} =  Set Variable  LOLLER
  ${number} =  Set Variable  ${-2}
  Rofl  ${string.upper()}  ${string * 2}  ${number * 10 + 5}  ${number.__abs__()}  

Varvarvar
  ${x} =  Set Variable  silly
  ${reallysilly} =  Set Variable  LMAO
  Log  ${really${x}}  # TODO why wouldn't this cut at the first } as exampled in regexps earlier?
