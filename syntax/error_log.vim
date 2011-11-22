" Vim syntax file
" Language:    error_log
" Maintainer:  Ruslan Osmanov <rrosmanov at gmail dot com>
" Last Change: Thu Sep  1 15:30:52 MSD 2011
" Version:     1.0

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Always ignore case
syn case ignore

" General keywords which don't fall into other categories
syn keyword error_logKeyword 			error warning notice 

" Special values
syn keyword error_logSpecial         	referer client

" Strings (single- and double-quote)
syn region error_logString           start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region error_logString           start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers and hexidecimal values
syn match error_logNumber            "-\=\<[0-9]*\>"
syn match error_logNumber            "-\=\<[0-9]*\.[0-9]*\>"
syn match error_logNumber            "-\=\<[0-9][0-9]*e[+-]\=[0-9]*\>"
syn match error_logNumber            "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match error_logNumber            "\<0x[abcdefABCDEF0-9]*\>"

" IP addresses
syn match error_logIP            	"-\=\<[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\>"

syn region error_logOperator         start="referrer\:" end="" contains=ALL

" URI
syn match error_logURI            	"http\:\/\/[^ ]*"

" Date 
syn match error_logDate 			"\[[0-9]*\/[a-zA-Z]\{3\}\/\d\{4\}:\d\{2\}:\d\{2\}:\d\{2\} +\d\{4\}\]"
syn match error_logDate				"\[[a-zA-Z]\{3\} [a-zA-Z]\{3\} \d\{2\} \d\{2\}:\d\{2\}:\d\{2\} \d\{4\}\]"

" Domain
syn match error_logDomain            "\(www\.\)\?[a-z0-9\-\_]*\.\(ru\|com\|by\|uz\|ua\|kz\|su\|net\|org\)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_error_log_syn_inits")
	if version < 508
		let did_error_log_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink error_logKeyword         Statement
	HiLink error_logIP				Type
	HiLink error_logSpecial  	    Special
	HiLink error_logString          String
	HiLink error_logNumber          Number
	HiLink error_logDate			Comment 
	HiLink error_logURI				Underlined 
	HiLink error_logDomain			Underlined 

	delcommand HiLink
endif

let b:current_syntax = "error_log"
" vim:sw=4:
