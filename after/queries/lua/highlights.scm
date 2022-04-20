;; Keywords
(("return"   @keyword) (#set! conceal ""))
(("local"    @keyword) (#set! conceal "~"))
(("if"       @keyword) (#set! conceal "?"))
(("else"     @keyword) (#set! conceal "!"))
(("elseif"   @keyword) (#set! conceal "¿"))
(("function" @keyword) (#set! conceal "ﬦ"))
(("for"      @keyword) (#set! conceal ""))

;; Function names
((function_call name: (identifier) @function (#eq? @function "require")) (#set! conceal ""))
((function_call name: (identifier) @function (#eq? @function "print"  )) (#set! conceal ""))
((function_call name: (identifier) @function (#eq? @function "pairs"  )) (#set! conceal "P"))
((function_call name: (identifier) @function (#eq? @function "ipairs" )) (#set! conceal "I"))

;; table.
((dot_index_expression table: (identifier) @keyword  (#eq? @keyword  "math" )) (#set! conceal ""))

;; vim.*
(((dot_index_expression) @field (#eq? @field "vim.cmd"     )) (#set! conceal ""))
(((dot_index_expression) @field (#eq? @field "vim.api"     )) (#set! conceal ""))
(((dot_index_expression) @field (#eq? @field "vim.fn"      )) (#set! conceal "#"))
(((dot_index_expression) @field (#eq? @field "vim.g"       )) (#set! conceal "$"))
(((dot_index_expression) @field (#eq? @field "vim.schedule")) (#set! conceal ""))
(((dot_index_expression) @field (#eq? @field "vim.opt"     )) (#set! conceal "S"))
(((dot_index_expression) @field (#eq? @field "vim.o"       )) (#set! conceal "O"))
(((dot_index_expression) @field (#eq? @field "vim.bo"      )) (#set! conceal "B"))
(((dot_index_expression) @field (#eq? @field "vim.wo"      )) (#set! conceal "W"))
