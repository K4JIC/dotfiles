"highlight structure
syntax match t_type "\<[ts]_[a-zA-Z0-9_]*\>"
hi def link t_type Type

"highlight function
syntax match cFunction "\<\h\w*\ze\_s*("
hi def link cFunction Identifier

"highlight macro
syntax match cMacro "\<[A-Z_]*\>"
hi def link cMacro Constant
