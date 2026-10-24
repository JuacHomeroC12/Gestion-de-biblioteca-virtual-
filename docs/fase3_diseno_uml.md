# FASE 3: DISEÑO Y MODELADO UML
## Sistema de Biblioteca Digital

> **Programa:** Análisis y Desarrollo de Software (ADSO) — SENA  
> **Ficha:** 3239188 | **Centro:** Centro de la Industria, la Empresa y los Servicios (CIES) — Neiva  
> **Instructor:** Carlos Julio Cadena  
> **Equipo 08:** Juan David Romero Calderón, Juan Diego Oteca Pedreros, Jhojan Javier Melo Avella  

---

## 1. Introducción al Diseño Arquitectónico

La Fase 3 traduce las especificaciones funcionales y de negocio consolidadas en las Fases 1 y 2 en un modelo estructural y dinámico bajo el paradigma de **Programación Orientada a Objetos (POO)**. 

El diseño se estructura en un patrón arquitectónico en tres capas desacopladas:
1. **Capa de Modelo (Dominio):** Clases de entidad que representan la realidad del negocio con encapsulamiento estricto (`Autor`, `Libro`, `Usuario`, `Prestamo`).
2. **Capa de Servicio (Lógica de Negocio):** Controlador transaccional (`GestionLibros`) que administra las colecciones dinámicas en memoria (`ArrayList`), ejecuta las validaciones y hace cumplir las reglas de negocio (RN-01 a RN-05).
3. **Capa de Presentación (Vista CLI):** Controlador de interfaz de consola (`SubmenuGestionLibros`) responsable de la interacción con el operador, captura segura con `Scanner` y presentación de menús.

---

## 2. Diagrama de Casos de Uso del Sistema (MVP)

Representa los límites del sistema, el actor primario (**Bibliotecario**) y las interacciones transaccionales del MVP con sus relaciones de inclusión (`<<include>>`) y extensión (`<<extend>>`).

```mermaid
flowchart LR
    subgraph Sistema ["Sistema de Biblioteca Digital (MVP)"]
        CU01(["CU-01: Registrar Libro"])
        CU02(["CU-02: Registrar Autor"])
        CU03(["CU-03: Registrar Usuario"])
        CU04(["CU-04: Consultar Disponibilidad"])
        CU05(["CU-05: Prestar Libro"])
        CU06(["CU-06: Registrar Devolución"])
        CU07(["CU-07: Buscar Libros"])
        CU08(["CU-08: Editar / Eliminar Registro"])
        
        VAL_ISBN(["Validar ISBN Único (RN-01)"])
        VAL_AUT(["Validar Identificador Autor (RN-02)"])
        VAL_DOC(["Validar Documento Único (RN-03)"])
        VER_ACT(["Verificar Usuario Activo y Libro Disponible"])
        VER_PRES(["Verificar Préstamo Activo (RN-05)"])
        ALERT_RET(["Generar Alerta Devolución con Retraso"])
        
        CU01 -.->|"<<include>>"| VAL_ISBN
        CU02 -.->|"<<include>>"| VAL_AUT
        CU03 -.->|"<<include>>"| VAL_DOC
        CU05 -.->|"<<include>>"| VER_ACT
        CU08 -.->|"<<include>>"| VER_PRES
        ALERT_RET -.->|"<<extend>>"| CU06
    end

    Bibliotecario((Bibliotecario))
    
    Bibliotecario --> CU01
    Bibliotecario --> CU02
    Bibliotecario --> CU03
    Bibliotecario --> CU04
    Bibliotecario --> CU05
    Bibliotecario --> CU06
    Bibliotecario --> CU07
    Bibliotecario --> CU08
```

---

## 3. Diagrama de Clases del Dominio y Servicios

Presenta la topología de clases, tipos de datos, visibilidad de atributos y signaturas de métodos, unificando todos los atributos acordados:

```mermaid
classDiagram
    direction TB

    %% CAPA DE PRESENTACIÓN (VISTA)
    class SubmenuGestionLibros {
        -gestionLibros: GestionLibros
        -scanner: Scanner
        +SubmenuGestionLibros(gestionLibros: GestionLibros)
        +mostrarMenu(): void
        -registrar(): void
        -buscarPorId(): void
        -buscarPorTitulo(): void
        -modificar(): void
        -eliminar(): void
        -verificarDisponibilidad(): void
        -menuReportes(): void
        -imprimirLista(titulo: String, lista: List~Libro~): void
    }

    %% CAPA DE SERVICIO (LÓGICA)
    class GestionLibros {
        -listaLibros: List~Libro~
        -listaAutores: List~Autor~
        -listaUsuarios: List~Usuario~
        -listaPrestamos: List~Prestamo~
        +GestionLibros()
        +registrarAutor(autor: Autor): boolean
        +registrarUsuario(usuario: Usuario): boolean
        +registrarLibro(libro: Libro): boolean
        +buscarPorId(id: int): Libro
        +buscarPorIsbn(isbn: String): Libro
        +buscarPorTitulo(titulo: String): List~Libro~
        +modificarLibro(id: int, nuevoTitulo: String, nuevoAutor: Autor, nuevaCategoria: String): boolean
        +eliminarLibro(id: int): boolean
        +consultarDisponibilidad(id: int): boolean
        +realizarPrestamo(idLibro: int, documentoUsuario: String, dias: int): boolean
        +registrarDevolucion(idPrestamo: int): boolean
        +obtenerListadoGeneral(): List~Libro~
        +obtenerLibrosDisponibles(): List~Libro~
        +obtenerLibrosPrestados(): List~Libro~
    }

    %% CAPA DE MODELO (ENTIDADES)
    class Autor {
        -identificador: String
        -nombre: String
        -nacionalidad: String
        +Autor(identificador: String, nombre: String, nacionalidad: String)
        +getIdentificador(): String
        +setIdentificador(identificador: String): void
        +getNombre(): String
        +setNombre(nombre: String): void
        +getNacionalidad(): String
        +setNacionalidad(nacionalidad: String): void
        +toString(): String
    }

    class Libro {
        -id: int
        -titulo: String
        -isbn: String
        -autor: Autor
        -anioPublicacion: int
        -categoria: String
        -disponible: boolean
        +Libro(id: int, titulo: String, isbn: String, autor: Autor, anioPublicacion: int, categoria: String, disponible: boolean)
        +getId(): int
        +setId(id: int): void
        +getTitulo(): String
        +setTitulo(titulo: String): void
        +getIsbn(): String
        +setIsbn(isbn: String): void
        +getAutor(): Autor
        +setAutor(autor: Autor): void
        +getAnioPublicacion(): int
        +setAnioPublicacion(anioPublicacion: int): void
        +getCategoria(): String
        +setCategoria(categoria: String): void
        +isDisponible(): boolean
        +setDisponible(disponible: boolean): void
        +toString(): String
    }

    class Usuario {
        -documentoIdentidad: String
        -nombre: String
        -telefono: String
        -activo: boolean
        +Usuario(documentoIdentidad: String, nombre: String, telefono: String, activo: boolean)
        +getDocumentoIdentidad(): String
        +setDocumentoIdentidad(documentoIdentidad: String): void
        +getNombre(): String
        +setNombre(nombre: String): void
        +getTelefono(): String
        +setTelefono(telefono: String): void
        +isActivo(): boolean
        +setActivo(activo: boolean): void
        +toString(): String
    }

    class Prestamo {
        -idPrestamo: int
        -usuario: Usuario
        -libro: Libro
        -fechaPrestamo: String
        -fechaLimiteDevolucion: String
        -estado: String
        +Prestamo(idPrestamo: int, usuario: Usuario, libro: Libro, fechaPrestamo: String, fechaLimiteDevolucion: String)
        +getIdPrestamo(): int
        +getUsuario(): Usuario
        +setUsuario(usuario: Usuario): void
        +getLibro(): Libro
        +setLibro(libro: Libro): void
        +getFechaPrestamo(): String
        +getFechaLimiteDevolucion(): String
        +getEstado(): String
        +setEstado(estado: String): void
        +finalizarPrestamo(): void
        +toString(): String
    }

    %% RELACIONES
    SubmenuGestionLibros ..> GestionLibros : invoca métodos
    GestionLibros o-- Libro : administra lista
    GestionLibros o-- Autor : administra lista
    GestionLibros o-- Usuario : administra lista
    GestionLibros o-- Prestamo : administra lista
    Libro --> "1" Autor : escrito por
    Prestamo --> "1" Libro : involucra
    Prestamo --> "1" Usuario : realizado a
```

---

## 4. Diagramas de Secuencia (Interacción y Flujo Dinámico)

### 4.1. Prestar Libro (CU-05 / RN-04)
Modela el proceso transaccional de salida de un libro con validación del estado del usuario y disponibilidad física del ejemplar.

```mermaid
sequenceDiagram
    autonumber
    actor B as Bibliotecario
    participant V as :SubmenuGestionLibros
    participant S as :GestionLibros
    participant U as u:Usuario
    participant L as l:Libro
    participant P as p:Prestamo

    B ->> V: Selecciona "Prestar Libro"
    V -->> B: Solicita Documento Usuario, ID Libro y Días
    B ->> V: Ingresa datos requeridos
    V ->> S: realizarPrestamo(idLibro, docUsuario, dias)
    
    S ->> U: isActivo()
    U -->> S: true (Usuario Habilitado)
    
    S ->> L: isDisponible()
    L -->> S: true (Ejemplar en Anaquel)
    
    create participant P
    S ->> P: new Prestamo(id, u, l, fechaActual, fechaLimite)
    
    S ->> L: setDisponible(false)
    L -->> S: void
    
    S -->> V: true
    V -->> B: Muestra "Préstamo registrado exitosamente"
```

---

### 4.2. Registrar Devolución (CU-06)
Modela el reintegro de un ejemplar, el cierre del préstamo y el control de fecha límite para emitir la advertencia correspondiente.

```mermaid
sequenceDiagram
    autonumber
    actor B as Bibliotecario
    participant V as :SubmenuGestionLibros
    participant S as :GestionLibros
    participant P as p:Prestamo
    participant L as l:Libro

    B ->> V: Selecciona "Registrar Devolución"
    V -->> B: Solicita ID del Préstamo
    B ->> V: Ingresa ID del Préstamo
    V ->> S: registrarDevolucion(idPrestamo)
    
    S ->> P: getEstado()
    P -->> S: "Activo"
    
    S ->> P: finalizarPrestamo()
    P -->> S: void
    
    S ->> P: getLibro()
    P -->> S: l
    
    S ->> L: setDisponible(true)
    L -->> S: void
    
    S -->> V: true
    V -->> B: Muestra "Devolución procesada y libro disponible"
```

---

### 4.3. Eliminar Libro con Validación de Préstamo Activo (CU-08 / RN-05)
Ilustra el cumplimiento estricto de la regla de integridad de inventario RN-05.

```mermaid
sequenceDiagram
    autonumber
    actor B as Bibliotecario
    participant V as :SubmenuGestionLibros
    participant S as :GestionLibros
    participant L as l:Libro

    B ->> V: Selecciona "Eliminar Libro"
    V -->> B: Solicita ID del Libro
    B ->> V: Ingresa ID del Libro
    V ->> S: eliminarLibro(idLibro)
    
    S ->> L: isDisponible()
    alt Libro Prestado (disponible == false)
        L -->> S: false (Prestado)
        S -->> V: false (Operación denegada por RN-05)
        V -->> B: Alerta "No se puede eliminar un libro con préstamo activo"
    else Libro Disponible (disponible == true)
        L -->> S: true (Disponible)
        S ->> S: listaLibros.remove(l)
        S -->> V: true
        V -->> B: Muestra "Libro eliminado del catálogo exitosamente"
    end
```

---

## 5. Diagramas de Actividades (Lógica de Procesos)

### 5.1. Proceso de Registro de Libro (CU-01 / RN-01)

```mermaid
flowchart TD
    Inicio([Inicio]) --> OpReg[Bibliotecario selecciona 'Registrar Libro']
    OpReg --> IngDatos[Ingresa: ID, Título, Autor, Año, ISBN, Categoría]
    IngDatos --> RecibeDatos[Sistema recibe los datos]
    RecibeDatos --> ValISBN{¿El ISBN ya existe en el catálogo?}
    
    ValISBN -- Sí (Duplicado) --> ErrorISBN[Muestra: 'Registro ISBN existente']
    ErrorISBN --> FinErr([Fin con Error])
    
    ValISBN -- No (Único) --> CreaLibro[Instancia nuevo objeto Libro con disponible = true]
    CreaLibro --> GuardaMemoria[Almacena libro en lista en memoria]
    GuardaMemoria --> ExitoMsg[Muestra: 'Libro registrado correctamente']
    ExitoMsg --> Fin([Fin Exitoso])
```

---

### 5.2. Proceso de Préstamo de Libro (CU-05 / RN-04)

```mermaid
flowchart TD
    Inicio([Inicio]) --> SelecPrestar[Bibliotecario selecciona 'Prestar Libro']
    SelecPrestar --> IngresaPrestamo[Ingresa Documento de Usuario, ID Libro y Días]
    IngresaPrestamo --> BuscaUsuario[Sistema busca Usuario por Documento]
    
    BuscaUsuario --> ValUsuario{¿Usuario existe y está activo?}
    ValUsuario -- No --> ErrUsuario[Muestra: 'Usuario no registrado o inactivo']
    ErrUsuario --> FinErr1([Fin con Rechazo])
    
    ValUsuario -- Sí --> BuscaLibro[Sistema busca Libro por ID]
    BuscaLibro --> ValLibro{¿Libro existe y está disponible?}
    
    ValLibro -- No --> ErrLibro[Muestra: 'El libro solicitado no está disponible']
    ErrLibro --> FinErr2([Fin con Rechazo])
    
    ValLibro -- Sí --> GenPrestamo[Instancia objeto Préstamo con fecha límite]
    GenPrestamo --> CambiaEstado[Cambia estado del libro a disponible = false]
    CambiaEstado --> Confirma[Muestra: 'Préstamo registrado exitosamente']
    Confirma --> Fin([Fin Exitoso])
```

---

### 5.3. Proceso de Devolución y Control de Retraso (CU-06)

```mermaid
flowchart TD
    Inicio([Inicio]) --> SelecDev[Bibliotecario selecciona 'Registrar Devolución']
    SelecDev --> IngresaID[Ingresa ID del Préstamo o Libro]
    IngresaID --> BuscaPrestamo[Sistema busca Préstamo Activo]
    
    BuscaPrestamo --> ValPrestamo{¿Existe préstamo activo?}
    ValPrestamo -- No --> ErrPrestamo[Muestra: 'Préstamo no encontrado o ya finalizado']
    ErrPrestamo --> FinErr([Fin con Error])
    
    ValPrestamo -- Sí --> CierraPrestamo[Marca préstamo como finalizado]
    CierraPrestamo --> LiberaLibro[Cambia estado del libro a disponible = true]
    LiberaLibro --> ValFecha{¿Fecha actual supera la fecha límite?}
    
    ValFecha -- No --> MsgTiempo[Muestra: 'Devolución registrada a tiempo']
    ValFecha -- Sí --> MsgRetraso[Muestra Alerta: 'Devolución registrada con retraso']
    
    MsgTiempo --> Fin([Fin Exitoso])
    MsgRetraso --> Fin
```
