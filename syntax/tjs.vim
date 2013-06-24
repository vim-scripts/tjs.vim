" Vim syntax file
" Language:	TJS2
" Maintainer:	Aixile <amane.nagatsuki@gmail.com>	
" Last Change:	2013 Jun 24

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if v:version < 600
    syntax clear
elseif exists('b:current_syntax')
    finish
endif

syn keyword tjs2CommentTodo		TODO FIXME XXX contained
syn match	tjs2LineComment		"\/\/.*" contains=@Spell,tjs2CommentTodo 
syn region  tjs2Comment			start="/\*"  end="\*/" contains=@Spell,tjs2CommentTodo
syn match 	tjs2Special			"\\\([abfnrtv'"\\]\|\([xX]\x\+\)\)" contained
syn region	tjs2StringD			start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=tjs2Special,@Spell
syn region	tjs2StringS			start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=tjs2Special,@Spell
syn region	tjs2Octet			start="<%" end="%>"
syn region  tjs2RegexpString	start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gil]\{0,3\}\s*$+ end=+/[gil]\{0,3\}\s*[;.,)\]}]+me=e-1 oneline
syn region 	tjs2PreCondit		start="^\s*@\s*if\>" skip="\\$" end="$"  keepend contains=tjs2Comment,tjs2LineComment,tjs2Numbers,tjs2Value,tjs2Operator,tjs2Boolean
syn match	tjs2PreCondit		display "^\s*@\s*endif\>"
syn match	tjs2LinePreCondit	"@set.*" contains=tjs2Comment,tjs2LineComment,tjs2Numbers,tjs2Value,tjs2Operator,tjs2Boolean

syn keyword tjs2Statement		return with
syn	keyword tjs2Boolean			true false 
syn keyword tjs2Conditional		if else switch
syn keyword tjs2Branch			break continue
syn keyword tjs2Typedef			this super global
syn keyword tjs2Identifier		var getter setter
syn keyword tjs2Type			const extends int real string void octet
syn keyword tjs2ClassType		Exception Array Date Dictionary Math RegExp
syn keyword tjs2Label			case default
syn keyword tjs2Exception		try catch throw 
syn keyword tjs2Repeat			while for do
syn keyword tjs2Operator		new delete invalidate isvalid delete instanceof typeof incontextof 
syn keyword tjs2Structure		class
syn keyword tjs2Value			null Infinity NaN
syn keyword tjs2Reserved		in enum debugger import export goto private public synchronized static finally protected

syn case ignore
syn match	tjs2Numbers			display transparent "\<\d\|\.\d" contains=tjs2Number,tjs2Hex,tjs2Bin,tjs2Oct,tjs2Float
syn	match	tjs2Number			display	contained "\d\+\>"
syn match	tjs2Hex				display contained "0x\x\+\>"
syn match	tjs2Bin				display contained "0b[01]\+\>"
syn	match	tjs2Oct				display	contained "0\o\+\>"
syn match	tjs2Float			display contained "\d\+\.\d*\(e[-+]\=\d\+\)\="
syn match	tjs2Float			display contained "\.\d\+\(e[-+]\=\d\+\)\=\>"
syn match	tjs2Float			display contained "\d\+e[-+]\=\d\+\>"
syn match	tjs2Float			display contained "0x\x*\.\x\+p[-+]\=\d\+\>"
syn match	tjs2Float			display contained "0x\x\+\.\=p[-+]\=\d\+\>"
syn match	tjs2Float			display contained "0b[01]*\.[01]\+p[-+]\=\d\+\>"
syn match	tjs2Float			display contained "0b[01]\+\.\=p[-+]\=\d\+\>"
syn match	tjs2Float			display contained "0\o*\.\o\+p[-+]\=\d\+\>"
syn match	tjs2Float			display contained "0\o\+\.\=p[-+]\=\d\+\>"
syn case match

syn keyword	tjs2Function		function property
syn match	tjs2Braces	"[{}[\]]\|\(%[[\]]\)"
syn match	tjs2Parens	"[()]"



" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tjs2_syntax_inits")
  if version < 508
    let did_tjs2_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink tjs2CommentTodo	Todo
  HiLink tjs2LineComment	Comment
  HiLink tjs2Comment		Comment
  HiLink tjs2Statement		Statement
  HiLink tjs2Boolean		Boolean
  HiLink tjs2Conditional	Conditional
  HiLink tjs2Branch			Conditional
  HiLink tjs2Typedef		Typedef
  HiLink tjs2Identifier		Identifier
  HiLink tjs2Type			StorageClass
  HiLink tjs2ClassType		Type
  HiLink tjs2Label			Label
  HiLink tjs2Exception		Exception
  HiLink tjs2Repeat			Repeat
  HiLink tjs2Operator		Operator
  HiLink tjs2Structure		Structure
  HiLink tjs2Value			Constant
  HiLink tjs2Reserved		Keyword

  HiLink tjs2Special		Special
  HiLink tjs2StringD		String
  HiLink tjs2StringS		String
  HiLink tjs2Octet			String
  HiLink tjs2RegexpString	String
  HiLink tjs2PreCondit		PreCondit
  HiLink tjs2LinePreCondit	PreCondit

  HiLink tjs2Number			Number
  HiLink tjs2Hex			Number
  HiLink tjs2Bin			Number
  HiLink tjs2Oct			Number
  HiLink tjs2Float			Float

  HiLink tjs2Function		Function
  HiLink tjs2Braces			Function


  delcommand HiLink
endi

let b:current_syntax = 'tjs'
