push!(LOAD_PATH, joinpath(@__DIR__, "..")) # para encontrar tu módulo

using Documenter
using MSE

makedocs(
    sitename = "Monitorización de la Salud Estructural (MSE)",
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