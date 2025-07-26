using Documenter

makedocs(
    sitename = "Monitorización de la Salud Estructural (MSE)",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
        "Inicio" => "index.md"
    ]
)

deploydocs(
    repo = "github.com:me1catrr/MSE.git",
    branch = "gh-pages",
    devbranch = "main"
)

