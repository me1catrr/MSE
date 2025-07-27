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

## 1. Álgebra y Ecuaciones

### 1.1 Resolver un sistema sobredeterminado por mínimos cuadrados

Queremos resolver el sistema:

$$
A x \approx b, \quad
A =
\begin{bmatrix}
1 & 1 \\
1 & 2 \\
1 & 3
\end{bmatrix}, \quad
b =
\begin{bmatrix}
2 \\
2.5 \\
3.5
\end{bmatrix}
$$

#### Código en Julia:

```julia
using LinearAlgebra

# Definimos el sistema Ax ≈ b
A = [1 1; 1 2; 1 3]
b = [2.0, 2.5, 3.5]

# Solución por mínimos cuadrados
x = A \ b
println("Solución: ", x)
```

---

### 1.2 Pseudoinversa mediante SVD

La pseudoinversa se define como:

$$
A^+ = V \Sigma^+ U^T
$$

#### Código en Julia:

```julia
# Calculamos la descomposición SVD
U, S, V = svd(A)

# Pseudoinversa
A_pinv = V * Diagonal(1 ./ S) * U'
x_svd = A_pinv * b
println("Solución con SVD: ", x_svd)
```

---

## 2. Transformadas y Series Temporales

### 2.1 Transformada de Fourier en Julia

Queremos analizar el espectro de una señal usando FFT:

$$
X(k) = \sum_{n=0}^{N-1} x(n) e^{-j 2 \pi k n / N}
$$

#### Código en Julia:

```julia
using FFTW

# Señal simple (onda senoidal)
signal = sin.(2π .* (0:0.01:1))

# FFT
fft_result = abs.(fft(signal))

println("FFT calculada: ", fft_result[1:10])  # mostramos primeros 10 valores
```

---

### 2.2 Modelos AR y ARMA (intro)

En procesamiento de señales, los modelos AR/ARMA son útiles para predicción:

$$
x_t = \sum_{i=1}^p \phi_i x_{t-i} + \epsilon_t
$$

#### Código en Julia (ejemplo simple):

```julia
using Random

# Generamos una serie AR(1): x_t = 0.8 x_{t-1} + ruido
Random.seed!(1234)
n = 100
x = zeros(n)
for t in 2:n
    x[t] = 0.8 * x[t-1] + randn()
end

println("Serie AR(1): ", x[1:10])
```

---

### 3. Problema de valores propios (modos naturales)

Para un sistema MDOF, resolvemos:

$$
K \phi = \lambda M \phi
$$

#### Código en Julia:

```julia
# Matrices de masa (M) y rigidez (K)
M = [2.0 0.0; 0.0 1.0]
K = [6.0 -2.0; -2.0 4.0]

# Problema generalizado
F = inv(M) * K
vals, vecs = eigen(F)

println("Valores propios (frecuencias^2): ", vals)
println("Vectores propios (modos): ", vecs)
```