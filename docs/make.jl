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
        "Temas" => [
        "Tema 1: Matemáticas SHM" => "temas/tema1.md"
    ]
)

deploydocs(
    repo = "github.com/me1catrr/MSE.git",
    push_preview = true
)
