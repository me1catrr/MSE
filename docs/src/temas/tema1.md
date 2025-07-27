# Tema 1: Matemáticas para SHM

Este tema introduce herramientas matemáticas fundamentales para el análisis de estructuras y señales en **Structural Health Monitoring (SHM)**.

---

## Contenidos

- **Álgebra y Ecuaciones**
  - Números complejos en dinámica estructural
  - Operaciones con vectores y matrices
  - Sistemas lineales sobredeterminados
  - Inversión de matrices y pseudoinversa
  - Descomposición en valores singulares (**SVD**)
  - Problemas de valores propios y modos naturales
- **Transformadas y Series Temporales**
  - Transformada de Laplace
  - Series y Transformada de Fourier
  - Polos y ceros en funciones racionales
  - Modelado en espacio de estados
  - Z-transform
  - Series temporales (AR, ARMA)
  - Introducción a la transformada de Hilbert

---

## 1. Álgebra y Ecuaciones

### ✅ Resolver un sistema sobredeterminado por **mínimos cuadrados**

Supongamos el sistema:

$$
A x \approx b,\quad
A =
\begin{bmatrix}
1 & 1 \\
1 & 2 \\
1 & 3
\end{bmatrix}, \quad
b = \begin{bmatrix} 2 \\ 2.5 \\ 3.5 \end{bmatrix}
$$

Queremos minimizar:

$$
\| Ax - b \|_2^2
$$

#### **Código en Julia**

```julia
using LinearAlgebra

# Matriz A y vector b
A = [1 1; 1 2; 1 3]
b = [2.0, 2.5, 3.5]

# Solución por mínimos cuadrados
x = A \ b
println("Solución: ", x)