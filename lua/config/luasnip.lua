local ls = require("luasnip")
local snip = ls.snippet
local parse = ls.parser.parse_snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamic = ls.dynamic_node

local date = function() return {os.date("%Y-%m-%d")} end
local template = [[
\documentclass{article}
% METADATA
\title{$1}
\date{$2}
\author{$3}

% DOCUMENT
\begin{document}
\pagenumbering{gobble}
\maketitle
\newpage
\pagenumbering{arabic}

% TEXT

$0

\end{document}
]]
local ru_template = [[
\documentclass{article}
% METADATA
\title{$1}
\date{$2}
\author{3}

% PACKAGES
%% Russian language support
\usepackage[T2A]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[russian]{babel}

%% Hyphenation rules
\usepackage{hyphenat}
\hyphenation{ма-те-ма-ти-ка вос-ста-нав-ли-ва-ть}

% DOCUMENT
\begin{document}
\pagenumbering{gobble}
\maketitle
\newpage
\pagenumbering{arabic}

% TEXT
$0
\end{document}
]]
local env = [[
\begin{$1}
    $0
\end{$1}
]]

ls.add_snippets("all", {
    snip({
        trig = "today",
        name = "Today",
        dscr = "Today's date in YYYY-MM-DD",
    }, {
            text(date())
        })
})

ls.add_snippets("tex", {
    parse({
        trig = "template",
        name = "Template",
        dscr = "Template for english latex documents",
    }, template),
    parse({
        trig = "ru",
        name = "Russian Template",
        dscr = "Template for russian latex documents",
    }, ru_template),
    parse({
        trig = "env",
        name = "Environment",
        dscr = "Encapsulate in env",
    }, env),
})
