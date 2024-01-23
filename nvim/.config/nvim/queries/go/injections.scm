((raw_string_literal) @injection.content
	(#match? @injection.content "^`-- sql")
	(#set! injection.language "sql")
	(#offset! @injection.content 0 1 0 -1))

