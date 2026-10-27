# 🛠️ SOLUCIÓN DE ERRORES COMUNES EN GIT
## Módulo 01 — Guía de Rescate Rápido

Esta guía contiene la solución inmediata a los problemas más frecuentes que pueden ocurrir durante el trabajo colaborativo con Git.

---

## 🛑 Caso 1: "Hice cambios o commits en `main` por error sin darme cuenta"

**Problema:** Te pusiste a trabajar y olvidaste crear una rama secundaria. Si intentas hacer push a `main`, romperás las reglas del proyecto.

**Solución paso a paso:**
1. **NO HAGAS PUSH**.
2. Crea una nueva rama con los cambios que ya hiciste:
   ```powershell
   git branch docs/mi-nueva-tarea
   ```
3. Regresa la rama `main` al estado del servidor sin perder nada:
   ```powershell
   git checkout main
   git reset --hard origin/main
   ```
4. Cámbiate a tu nueva rama para continuar:
   ```powershell
   git checkout docs/mi-nueva-tarea
   ```
*Tus cambios ahora están a salvo en tu rama y `main` quedó intacto.*

---

## ⚡ Caso 2: "Git dice que hay CONFLICTO (CONFLICT) al hacer pull o merge"

**Problema:** Dos integrantes editaron el mismo archivo al mismo tiempo y Git no sabe cuál versión conservar.

**Solución paso a paso:**
1. Abre el archivo en conflicto dentro de **Visual Studio Code**.
2. Verás marcas de este tipo:
   ```text
   <<<<<<< HEAD (Tus cambios locales)
   docs/pdf/Fase4_Base_de_Datos_Sistema_Biblioteca_Digital.pdf
   =======
   docs/pdf/Fase4_Base_de_Datos.pdf
   >>>>>>> origin/develop (Cambios remotos)
   ```
3. Encima de ese bloque, VS Code te mostrará botones útiles:
   - *Accept Current Change* (Conservar lo tuyo).
   - *Accept Incoming Change* (Conservar lo que viene de GitHub).
   - *Accept Both Changes* (Conservar ambos).
4. Elige la versión correcta, elimina las marcas `<<<<<<<`, `=======` y `>>>>>>>`, y guarda el archivo.
5. Confirma la resolución del conflicto en la terminal:
   ```powershell
   git add .
   git commit -m "chore(git): resolver conflicto de integracion con develop"
   ```

---

## 🔒 Caso 3: "Git me pide credenciales o me rechaza el push (Permission denied / 403)"

**Problema:** Tu computador no tiene permisos para subir cambios al repositorio `JuacHomeroC12/Gestion-de-biblioteca-virtual-`.

**Solución:**
1. Dile al líder del proyecto (Juan David Romero) que te agregue como **Colaborador** en GitHub:
   - En GitHub: *Settings* -> *Collaborators* -> *Add people* -> Escribir tu usuario de GitHub (`joteca3-afk` o `Melo-JJMA`).
2. Revisa tu correo o tus notificaciones en GitHub y **acepta la invitación**.
3. En Windows, ve a:
   - *Panel de Control* -> *Cuentas de usuario* -> *Administrador de credenciales* -> *Credenciales de Windows*.
   - Busca `git:https://github.com` y verifica que esté asociado a tu cuenta con un *Personal Access Token (PAT)* con permisos de `repo`.

---

## 🗑️ Caso 4: "Agregué o subí un archivo temporal que no debía (ej. `.docx`, `.tmp`, `.zip`)"

**Problema:** Subiste un archivo binario innecesario y quieres sacarlo del repositorio sin borrarlo de tu máquina.

**Solución:**
```powershell
# Quitar el archivo del seguimiento de Git pero dejarlo en tu disco duro:
git rm --cached ruta/del/archivo/innecesario.docx

# Registrar el cambio:
git commit -m "chore(git): retirar archivo temporal del seguimiento de versiones"

# Asegurarse de que esté en el .gitignore para que no vuelva a pasar:
echo "*.tmp" >> .gitignore
echo "*~$*.docx" >> .gitignore
```
