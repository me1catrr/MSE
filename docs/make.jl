# Cargar librerías
push!(LOAD_PATH, "../src")
using Documenter
using MSE  # Tu módulo principal

makedocs(
    sitename = "Documentación de MSE",
    format = Documenter.HTML(
    assets = ["../assets/custom.css"],
    prettyurls = false,
    mathengine = Documenter.MathJax(),
    edit_link = nothing
    ),
    modules = [MSE],
    pages = [
        "Inicio" => "index.md",
        "Tutorial" => "tutorial.md",
        "Fórmulas" => "formulas.md",
        "API" => "api.md",
        "Temas" => [
            "Tema 1: Matemáticas SHM" => "temas/tema1.md"
        ]
    ]
)

# Configuración para GitHub Pages (opcional si despliegas)
deploydocs(
    repo = "github.com/me1catrr/MSE.git",  # Cambia por tu repo
    devbranch = "main",                    # Corrige el warning de "master"
    push_preview = true
)