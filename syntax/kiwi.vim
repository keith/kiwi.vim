" Vim Syntax File
" Language: Kiwi flavored Objective-C
" Maintainer: Keith Smiley <keithbsmiley@gmail.com>
" Last Change: 2014 Feb 12

if exists('b:current_syntax')
  finish
endif

runtime! syntax/objc.vim
runtime! syntax/cocoa_keywords.vim
runtime! syntax/objc_enhanced.vim
unlet! b:current_syntax

syntax region kiwiSpec matchgroup=kiwiBounds start=/\vSPEC_BEGIN/ end=/\vSPEC_END/ containedin=ALLBUT,kiwiBlock fold contains=ALL

syntax keyword kiwiKeywords registerMatchers containedin=ALLBUT,objcString,cCommentL
syntax keyword kiwiGroups afterAll afterEach beforeAll beforeEach context describe it specify let nextgroup=kiwiBlock containedin=ALLBUT,objcString,cCommentL

" Requires matchgroup=noop for correct start/end/folding
"  this is caused by something in the imported objc.vim
syntax region kiwiBlock matchgroup=noop start=/\v\(\^\{/ end=/\v\}\);/ containedin=ALLBUT,kiwiCommentBlock fold contains=ALLBUT,kiwiSpec
syntax region kiwiBlock matchgroup=noop start=/\v\((\@".*"|\w*),\s*\^\{/ end=/\v\}\);/ containedin=ALLBUT,kiwiCommentBlock fold contains=ALLBUT,kiwiSpec

syntax keyword kiwiResultBlockStart theBlock nextgroup=kiwiResultBlock containedin=ALLBUT,objcString,cCommentL
syntax region kiwiResultBlock matchgroup=noop start=/\v\(\^\{/ end=/\v\}\)/ containedin=ALLBUT,kiwiCommentBlock fold contains=ALLBUT,kiwiSpec

" Pending specs, make the entire nested block a comment
syntax keyword kiwiPending pending nextgroup=kiwiCommentBlock containedin=ALLBUT,objcString
syntax region kiwiCommentBlock matchgroup=kiwiCommentBlock start=/\v\(\@".*",\s*\^\{/ end=/\v\}\);/ containedin=ALL fold contains=NONE

syntax keyword kiwiExpectations and andReturn arguments beBetween beEmpty beFalse beGreaterThan beGreaterThanOrEqualTo beIdenticalTo beInTheIntervalFrom beKindOfClass beLessThan beLessThanOrEqualTo beMemberOfClass beNil beNo beNonNil beTrue beWithin beYes beZero by change conformToProtocol contain containObjects containObjectsInArray containString endWithString equal forClass forProtocol have haveAtLeast haveAtMost haveCountOf haveCountOfAtLeast haveCountOfAtMost matchPattern mock mockForClass mockForProtocol mockWithName nullMock nullMockForClass nullMockForProtocol nullMockWithName of options receive receiveAndReturn receiveWithCount receiveWithCountAtLeast receiveWithCountAtMost respondToSelector should shouldEventually shouldNot shouldNotEventually startWithString stub to withArguments withCount withCountAtLeast withCountAtMost withDelta containedin=ALLBUT,kiwiCommentBlock,objcString,cCommentL

syntax keyword kiwiMacros expectFutureValue shouldEventuallyBeforeTimingOutAfter shouldNotEventuallyBeforeTimingOutAfter theValue containedin=ALLBUT,kiwiCommentBlock,objcString,cCommentL

highlight default link kiwiBounds Structure

highlight default link kiwiKeywords Function
highlight default link kiwiGroups Function

highlight default link kiwiResultBlockStart Function

highlight default link kiwiPending Comment
highlight default link kiwiCommentBlock Comment

highlight default link kiwiExpectations Function
highlight default link kiwiMacros Type

let c_no_curly_error = 1
let b:current_syntax = 'kiwi'
