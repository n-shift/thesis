;; Hide
((predicate type: (predicate_type) @none) (#set! conceal ""))
(("#"                              @none) (#set! conceal ""))
(("@"                              @none) (#set! conceal ""))


;; Conceal predicate names
((predicate name: (identifier) @keyword (#eq? @keyword "eq" )) (#set! conceal "="))
((predicate name: (identifier) @keyword (#eq? @keyword "set")) (#set! conceal "הּ"))

;; Conceal named nodes
((named_node name: (identifier) @keyword (#eq? @keyword "function_call"       )) (#set! conceal "ﬦ"))
((named_node name: (identifier) @keyword (#eq? @keyword "dot_index_expression")) (#set! conceal "."))
