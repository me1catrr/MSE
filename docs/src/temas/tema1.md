# Tema 1: Matemáticas para SHM

Este tema introduce herramientas matemáticas fundamentales para el análisis de estructuras y señales en **Structural Health Monitoring (SHM)**.

---

## Contenidos

- Álgebra y Ecuaciones
- Números complejos en dinámica estructural
- Operaciones con vectores y matrices
- Sistemas lineales sobredeterminados
- Inversión de matrices y pseudoinversa
- Descomposición en valores singulares (SVD)
- Problemas de valores propios y modos naturales
- Transformadas y Series Temporales
- Transformada de Laplace
- Series y Transformada de Fourier
- Polos y ceros en funciones racionales
- Modelado en espacio de estados
- Z-transform
- Series temporales (AR, ARMA)
- Introducción a la transformada de Hilbert

---

## Prácticas en Julia

### 1. Resolver un sistema sobredeterminado por mínimos cuadrados
```@example
using LinearAlgebra

# Sistema sobredeterminado Ax ≈ b
A = [1 1; 1 2; 1 3]
b = [2.0, 2.5, 3.5]

# Solución por mínimos cuadrados
x = A \ b