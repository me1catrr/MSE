push!(LOAD_PATH, joinpath(@__DIR__, ".."))  # Añade la raíz del repo al LOAD_PATH

using Documenter
using MSE  # Ahora se podrá cargar desde src/MSE.jl

makedocs(
    sitename = "Monitorización de la Salud Estructural (MSE)",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    modules = [MSE],
    pages = [
        "Inicio" => "index.md"
    ]
)

deploydocs(
    repo = "github.com:me1catrr/MSE.git",
    branch = "gh-pages",
    devbranch = "main"
)
