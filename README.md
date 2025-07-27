# MSE.jl

[![Build Status](https://github.com/me1catrr/MSE/actions/workflows/docs.yml/badge.svg)](https://github.com/me1catrr/MSE/actions)
[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://me1catrr.github.io/MSE/dev/)

Paquete **MSE** en Julia, diseñado para ofrecer herramientas matemáticas y utilidades básicas con soporte de documentación en línea.

---

## 📚 Documentación
La documentación completa está disponible en:
👉 [https://me1catrr.github.io/MSE/dev/](https://me1catrr.github.io/MSE/dev/)

Incluye:
- Ejemplos de uso
- API completa con funciones exportadas
- Fórmulas matemáticas en LaTeX

---

## ⚡ Instalación

Para instalar el paquete desde el repositorio local o GitHub:

```julia
using Pkg
Pkg.add(url="https://github.com/me1catrr/MSE.git")
```

---

## ✅ Uso básico

```julia
using MSE

# Operaciones básicas
suma(2, 3)       # → 5
producto(4, 5)   # → 20
```

---

## 🔍 Estructura del proyecto
```
MSE/
├── src/
│   └── MSE.jl
├── docs/
│   ├── make.jl
│   └── src/
│       ├── index.md
│       ├── tutorial.md
│       ├── api.md
│       └── formulas.md
└── .github/workflows/docs.yml
```

---

## 💡 Contribuir
¡Pull requests bienvenidos! Si tienes sugerencias o mejoras:
1. Haz un fork del proyecto.
2. Crea una rama (`feature-nueva`).
3. Abre un Pull Request.

---

## ⚠ Licencia
Este proyecto está bajo licencia MIT. Consulta el archivo [LICENSE](LICENSE).