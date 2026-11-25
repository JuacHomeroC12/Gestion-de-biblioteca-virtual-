# 🚀 GUÍA DE TRABAJO EN GIT Y FLUJO DE RAMAS
## Módulo 01 — Control de Versiones para el Equipo

Esta guía explica el procedimiento exacto que deben seguir **Juaco**, **Melo** y **Juan David** para trabajar en el proyecto desde sus computadores personales, garantizando que sus nombres y usuarios de GitHub queden registrados en el historial de aportes evaluable por el SENA.

---

## 👤 1. Configuración Inicial Obligatoria (Solo se hace una vez)

Abre la terminal (**PowerShell** o **Git Bash**) en tu computador y ejecuta los dos comandos correspondientes a tu nombre:

### Si eres Juan David Romero:
```powershell
git config --global user.name "Juan David Romero Calderon"
git config --global user.email "juanchomero12@gmail.com"
```

### Si eres Juan Diego Oteca ("Juaco"):
```powershell
git config --global user.name "Juan Diego Oteca Pedreros"
git config --global user.email "tu_correo_registrado_en_github@gmail.com"
```

### Si eres Jhojan Javier Melo ("Melo"):
```powershell
git config --global user.name "Jhojan Javier Melo Avella"
git config --global user.email "tu_correo_registrado_en_github@gmail.com"
```

> **Verificación:** Ejecuta `git config user.name` y `git config user.email`. Debe mostrar exactamente tu nombre y correo. Si no lo haces, tus commits saldrán como anónimos o asignados a otra persona.

---

## 🌿 2. Flujo de Ramas (GitFlow Simplificado)

El repositorio utiliza dos ramas principales y ramas secundarias por tarea:

```text
main (Producción / Evaluaciones cerradas del instructor)
  ▲
  │ (Merge o Pull Request formal)
develop (Integración diaria del equipo)
  ▲
  ├── docs/fase4-pdf-oteca     <-- Rama creada por Juaco para subir el PDF de Fase 4
  └── docs/fase2-pdf-melo      <-- Rama creada por Melo para subir el PDF de Fase 2
```

> ⚠️ **REGLA ABSOLUTA:** **NUNCA hagas commits directos sobre la rama `main`**. Trabajar directo en `main` descuenta puntos en la evaluación técnica del SENA.

---

## 💻 3. Paso a Paso para Realizar una Tarea

Sigue estos 6 pasos cada vez que vayas a realizar una entrega:

### Paso 3.1: Actualizar tu repositorio local
Antes de empezar a trabajar, asegúrate de tener la versión más reciente que está en GitHub:
```powershell
git checkout develop
git pull origin develop
```

### Paso 3.2: Crear tu propia rama de trabajo
Crea una rama con un nombre descriptivo según lo que vayas a hacer:
- Si vas a subir un documento o PDF:
  ```powershell
  # Ejemplo para Juan Diego:
  git checkout -b docs/fase4-pdf-oteca

  # Ejemplo para Jhojan Melo:
  git checkout -b docs/fase2-pdf-melo
  ```
- Si vas a programar una función (Fase 5 o 6):
  ```powershell
  git checkout -b feat/interfaz-login-usuario
  ```

### Paso 3.3: Trabajar y guardar los archivos
Copia tu archivo PDF en la carpeta `docs/pdf/` o edita los archivos correspondientes en tu editor.

### Paso 3.4: Preparar los cambios (`git add`)
Revisa qué archivos modificaste:
```powershell
git status
```
Agrega solo el archivo que corresponde a tu tarea (ejemplo para Fase 4):
```powershell
git add docs/pdf/Fase4_Base_de_Datos_Sistema_Biblioteca_Digital.pdf
```

### Paso 3.5: Registrar tu commit con formato formal
Escribe un mensaje claro siguiendo la guía de Conventional Commits:
```powershell
git commit -m "docs(pdf): incorporar documento formal fase 4 en pdf con portada sena e indice"
```

### Paso 3.6: Subir tu rama a GitHub (`git push`)
Sube la rama a GitHub usando el comando:
```powershell
git push -u origin NOMBRE_DE_TU_RAMA
```
*(Reemplaza `NOMBRE_DE_TU_RAMA` por el nombre que creaste en el paso 3.2).*

---

## 🔗 4. Integrar los Cambios a `develop` (Pull Request)

Una vez subida tu rama a GitHub:
1. Ve al repositorio en el navegador: `https://github.com/JuacHomeroC12/Gestion-de-biblioteca-virtual-`.
2. Verás un botón amarillo que dice **"Compare & pull request"**. Haz clic en él.
3. Asegúrate de que la rama base sea **`develop`** (no `main`).
4. Escribe un título descriptivo y haz clic en **"Create pull request"**.
5. Revisa que no haya conflictos y haz clic en **"Merge pull request"**.

¡Listo! Con esto, tu aporte queda oficialmente contabilizado en las estadísticas de GitHub.
