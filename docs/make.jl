using Documenter
using MSE  # tu módulo principal

makedocs(
    sitename = "Monitorización de la Salud Estructural (MSE)",
    modules = [MSE],
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
        "Introducción" => "index.md",
        "Ejemplos" => "ejemplos.md"
    ]
)

deploydocs(
    repo = "github.com:me1catrr/MSE.git",
    branch = "gh-pages",
)