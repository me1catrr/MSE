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

Esto es un ejemplo $x^2$

```julia-repl
julia> using Pkg

julia> Pkg.rm("Example")
  Updating `~/work/MSE/Project.toml`
  [7876af07] - Example v0.5.5
  Updating `~/work/MSE/Manifest.toml`
  [7876af07] - Example v0.5.5
```

!!! warning "This  is a warning"
    my warning message

Queremos resolver el sistema:

```math
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
```

!!! example "Example 1.1.2"
    Suppose $d = 2$. Taking $n = 0$ in (1.1.1), we enumerate

    $$1 + \frac{0}{4},\; 1 + \frac{1}{4},\; 1 + \frac{2}{4},\; 1 + \frac{3}{4}$$

    These are the only members of $\mathbb{F}$ in the semi-closed interval $[1,2)$, and they are separated by spacing $\frac{1}{4}$.

    Taking $n = 1$ doubles each of the values in the list above, and $n = -1$ halves them.  
    These give the floating-point numbers in $[2,4)$ and $[1/2,1)$, respectively.  
    The spacing between them also is doubled and halved, respectively.

#### Código en Julia:

```@example
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

```math
A^+ = V \Sigma^+ U^T
```
donde $A$ es una matriz, $U$ y $V$ son matrices ortogonales, y $\Sigma^+$ es la pseudoinversa de la matriz diagonal $\Sigma$.

#### Código en Julia:

```@example
using LinearAlgebra

# Cálculo de la pseudoinversa mediante SVD
A = [1 1; 1 2; 1 3]
pinv_A = pinv(A)

println("Pseudoinversa: ", pinv_A)
```
---

## 2. Transformadas y Series Temporales

### 2.1 Transformada de Fourier en Julia

Queremos analizar el espectro de una señal usando FFT:
La transformada discreta de Fourier (DFT) de una señal $x(n)$ de longitud $N$ se define como:

```math
X(k) = \sum_{n=0}^{N-1} x(n) e^{-j 2 \pi k n / N}
```

donde $X(k)$ representa el espectro en la frecuencia $k$.

#### Código en Julia:

```@example
using FFTW, Plots

# Señal simple (onda senoidal)
signal = sin.(2π .* (0:0.01:1))

# FFT
fft_result = abs.(fft(signal))

# Mostrar primeros valores en consola
println("FFT calculada: ", fft_result[1:10])

# Graficar el espectro
plot(fft_result, title="Espectro FFT", xlabel="Frecuencia (índice)", ylabel="Magnitud")
```

---

### 2.2 Modelos AR y ARMA (intro)

En procesamiento de señales, los modelos AR/ARMA son útiles para predicción:

```math
x_t = \sum_{i=1}^p \phi_i x_{t-i} + \epsilon_t
```

#### Código en Julia (ejemplo simple):

```@example
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

```math
K \phi = \lambda M \phi
```
donde $K$ es la matriz de rigidez, $M$ es la matriz demasa, $\lambda$ son los valores propios (frecuencias naturales al cuadrado), y $\phi$ son los modos naturales.
Queremos encontrar los valores propios y vectores propios de un sistema estructural.
Para un sistema con matrices de masa $M$ y rigidez $K$, el problema se formula como:    

```math
F = M^{-1} K
```
donde $F$ es la matriz del problema generalizado.
Los valores propios de $F$ nos dan las frecuencias naturales al cuadrado, y los vectores propios nos dan los modos naturales del sistema.   

#### Código en Julia:

```@example
using LinearAlgebra 
# Matrices de masa (M) y rigidez (K)
M = [2.0 0.0; 0.0 1.0]
K = [6.0 -2.0; -2.0 4.0]

# Problema generalizado
F = inv(M) * K
vals, vecs = eigen(F)

println("Valores propios (frecuencias^2): ", vals)
println("Vectores propios (modos): ", vecs)
```