push!(LOAD_PATH, "../src/")
using Documenter
using MSE

makedocs(
    sitename = "Documentación de MSE",
    format = Documenter.HTML(),
    modules = [MSE],
    pages = [
        "Inicio" => "index.md",
        "Tutorial" => "tutorial.md",
        "Fórmulas" => "formulas.md",
        "API" => "api.md"
    ]
)

deploydocs(
    repo = "github.com/me1catrr/MSE.git",
    push_preview = true
)
# MSE Documentation
This package contains functions for handling series and statistics in Julia.