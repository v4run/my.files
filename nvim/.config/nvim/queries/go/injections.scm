((raw_string_literal) @sql
 (.match? @sql "^`.*-- SQL")
(#offset! @sql 0 1 0 -1))
