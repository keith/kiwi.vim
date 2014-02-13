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
highlight default link kiwiBounds Structure

syntax keyword kiwiKeywords registerMatchers containedin=ALLBUT,objcString,cCommentL

syntax keyword kiwiGroups afterAll afterEach beforeAll beforeEach context describe it specify let nextgroup=kiwiBlock containedin=ALLBUT,objcString,cCommentL

highlight default link kiwiKeywords Function
highlight default link kiwiGroups Function

" Requires matchgroup=noop for correct start/end/folding
"  this is caused by something in the imported objc.vim
syntax region kiwiBlock matchgroup=noop start=/\v\(\^(AsyncBlock)?\s*\{/ end=/\v\}\);/ containedin=ALLBUT,kiwiCommentBlock fold contains=ALLBUT,kiwiSpec
syntax region kiwiBlock matchgroup=noop start=/\v\(\@".*",\s\^(AsyncBlock)?\s*\{/ end=/\v\}\);/ containedin=ALLBUT,kiwiCommentBlock fold contains=ALLBUT,kiwiSpec


" Pending specs, make the entire nested block a comment
syntax keyword kiwiPending pending nextgroup=kiwiCommentBlock containedin=ALLBUT,objcString
syntax region kiwiCommentBlock matchgroup=kiwiCommentBlock start=/\v\(\@".*",\s\^(AsyncBlock)?\s*\{/ end=/\v\}\);/ containedin=ALL fold contains=NONE

highlight default link kiwiPending Comment
highlight default link kiwiCommentBlock Comment

syntax keyword kiwiExpectations beEmpty beFalse beGreaterThan beGreaterThanOrEqualTo beIdenticalTo beKindOfClass beLessThan beLessThanOrEqualTo beMemberOfClass beNil beNo beNonNil beTrue beYes beZero conformToProtocol contain containObjects containObjectsInArray containString endWithString equal have haveAtLeast haveAtMost haveCountOf haveCountOfAtLeast haveCountOfAtMost matchPattern mock mockForClass mockForProtocol mockWithName nullMock nullMockForClass nullMockForProtocol nullMockWithName receive receiveAndReturn receiveWithCount receiveWithCountAtLeast receiveWithCountAtMost respondToSelector should shouldEventually shouldNot shouldNotEventually startWithString stub containedin=ALLBUT,kiwiCommentBlock,objcString,cCommentL
highlight default link kiwiExpectations Function

syntax keyword kiwiMacros expectFutureValue shouldEventuallyBeforeTimingOutAfter shouldNotEventuallyBeforeTimingOutAfter theValue containedin=ALLBUT,kiwiCommentBlock,objcString,cCommentL

highlight default link kiwiMacros Type

syntax region kiwiMethods matchgroup=kiwiMethod start=/\vbeBetween:/ end=/\vand:/ containedin=ALLBUT,kiwiCommentBlock,objcString,cCommentL contains=ALLBUT,kiwiBlock,kiwiPending,kiwiExpectations oneline
highlight def link kiwiMethod Function

" let c_no_curly_error = 1
" let b:current_syntax = 'kiwi'
