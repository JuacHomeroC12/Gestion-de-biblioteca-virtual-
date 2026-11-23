-- =============================================================================
-- SISTEMA DE BIBLIOTECA DIGITAL (DIGITAL LIBRARY SYSTEM)
-- Script DDL / DML Relacional - 3FN (Tercera Forma Normal)
-- Motor de Base de Datos: MySQL 8.0.16+ / MariaDB 10.4+ (InnoDB)
-- Cumplimiento Formativo: SENA ADSO - Ficha 3239188
-- Instructor: Carlos Julio Cadena | Equipo 08
-- Codificación del archivo: UTF-8 (sin BOM). Todos los textos usan ortografía
-- completa en español (tildes y eñes), soportada por utf8mb4.
-- =============================================================================

-- Fuerza la conexión del cliente a utf8mb4 para que tildes y eñes se
-- almacenen correctamente sin importar la configuración de la consola.
SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

DROP DATABASE IF EXISTS digital_library;
CREATE DATABASE digital_library
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE digital_library;

-- =============================================================================
-- 1. TABLA: categories (Categorías temáticas de libros)
-- =============================================================================
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_categories_name UNIQUE (name),
    CONSTRAINT chk_categories_name CHECK (CHAR_LENGTH(TRIM(name)) >= 3)
) ENGINE=InnoDB;

-- =============================================================================
-- 2. TABLA: authors (Autores con identificador normalizado ORCID/ISNI - RN-02)
-- Formato validado: 16 caracteres en bloques de 4 (0000-0000-0000-000X);
-- el último carácter es un dígito de control que puede ser 'X'.
-- =============================================================================
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_code VARCHAR(50) NOT NULL,
    name VARCHAR(150) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_authors_code UNIQUE (author_code),
    CONSTRAINT chk_authors_code CHECK (
        author_code REGEXP '^[0-9]{4}-?[0-9]{4}-?[0-9]{4}-?[0-9]{3}[0-9Xx]$'
    ),
    CONSTRAINT chk_authors_name CHECK (CHAR_LENGTH(TRIM(name)) >= 3)
) ENGINE=InnoDB;

-- =============================================================================
-- 3. TABLA: books (Catálogo de libros - RN-01, RN-05)
-- NOTA: La eliminación de libros se implementa como BAJA LÓGICA (is_deleted).
-- La FK fk_loans_books ON DELETE RESTRICT se mantiene para preservar el
-- historial de préstamos. La condición de baja válida es:
--   is_available = TRUE (sin préstamo activo - RN-05)
--   AND is_deleted = FALSE (no dado de baja previamente)
-- El libro solo desaparece del catálogo activo; sus registros en loans
-- se conservan para auditoría.
-- Formato ISBN validado: ISBN-10 (9 dígitos + dígito o 'X') o ISBN-13
-- (13 dígitos); se admiten guiones y espacios como separadores.
-- =============================================================================
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    publication_year INT NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_books_year CHECK (publication_year BETWEEN 1000 AND 2100),
    CONSTRAINT chk_books_isbn CHECK (
        REPLACE(REPLACE(isbn, '-', ''), ' ', '') REGEXP '^([0-9]{9}[0-9Xx]|[0-9]{13})$'
    ),
    CONSTRAINT chk_books_title CHECK (CHAR_LENGTH(TRIM(title)) >= 3),
    CONSTRAINT uk_books_isbn UNIQUE (isbn),
    CONSTRAINT fk_books_authors FOREIGN KEY (author_id)
        REFERENCES authors(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_books_categories FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =============================================================================
-- 4. TABLA: users (Usuarios habilitados para préstamos - RN-03, RN-04)
-- Documento: solo dígitos, entre 6 y 15. Teléfono: exactamente 10 dígitos.
-- =============================================================================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    document_number VARCHAR(20) NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_users_document UNIQUE (document_number),
    CONSTRAINT chk_users_document CHECK (document_number REGEXP '^[0-9]{6,15}$'),
    CONSTRAINT chk_users_phone CHECK (phone REGEXP '^[0-9]{10}$'),
    CONSTRAINT chk_users_name CHECK (CHAR_LENGTH(TRIM(full_name)) >= 3)
) ENGINE=InnoDB;

-- =============================================================================
-- 5. TABLA: loans (Registro transaccional de préstamos y devoluciones - RF-05, RF-06)
-- =============================================================================
CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    active_book_id INT GENERATED ALWAYS AS (IF(status = 'ACTIVE', book_id, NULL)) VIRTUAL,
    notes TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_loans_status CHECK (status IN ('ACTIVE', 'RETURNED', 'OVERDUE')),
    CONSTRAINT chk_loans_due_date CHECK (due_date >= loan_date),
    CONSTRAINT chk_loans_return_date CHECK (return_date IS NULL OR return_date >= loan_date),
    CONSTRAINT uk_loans_active_book UNIQUE (active_book_id),
    CONSTRAINT fk_loans_books FOREIGN KEY (book_id)
        REFERENCES books(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_loans_users FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =============================================================================
-- ÍNDICES DE RENDIMIENTO (RNF-04)
-- =============================================================================
CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_users_full_name ON users(full_name);
CREATE INDEX idx_loans_status ON loans(status);
CREATE INDEX idx_loans_due_date ON loans(due_date);

-- =============================================================================
-- DATOS DE PRUEBA (SEED DATA PARA VERIFICACIÓN DEL MVP)
-- =============================================================================

-- Inserción de Categorías
INSERT INTO categories (name, description) VALUES
('Novela y Ficción', 'Obras narrativas de ficción literaria y novelas clásicas.'),
('Ciencia y Tecnología', 'Libros de informática, matemáticas e ingeniería de software.'),
('Historia y Filosofía', 'Ensayos históricos, crónicas y pensamiento filosófico.');

-- Inserción de Autores (identificadores normalizados ISNI para literatura y ORCID para técnico)
INSERT INTO authors (author_code, name, nationality) VALUES
('0000-0001-2141-4109', 'Gabriel García Márquez', 'Colombiana'),
('0000-0001-2144-5430', 'Miguel de Cervantes Saavedra', 'Española'),
('0000-0003-4512-9901', 'Robert C. Martin', 'Estadounidense');

-- Inserción de Libros (is_deleted = FALSE por defecto en todos)
INSERT INTO books (isbn, title, author_id, category_id, publication_year, is_available) VALUES
('978-0307474728', 'Cien años de soledad', 1, 1, 1967, FALSE),
('978-8424116286', 'Don Quijote de la Mancha', 2, 1, 1605, TRUE),
('978-0132350884', 'Clean Code: A Handbook of Agile Software Craftsmanship', 3, 2, 2008, TRUE),
('978-0307387738', 'El amor en los tiempos del cólera', 1, 1, 1985, TRUE);

-- Inserción de Usuarios
INSERT INTO users (document_number, full_name, phone, is_active) VALUES
('1075248911', 'Juan David Romero Calderón', '3124567890', TRUE),
('1075334812', 'Juan Diego Oteca Pedreros', '3157891234', TRUE),
('1075998123', 'Jhojan Javier Melo Avella', '3189912345', TRUE),
('1075000000', 'Carlos Gómez Andrade', '3100000000', FALSE);

-- Inserción de Préstamos (ejemplo activo y ejemplo devuelto)
INSERT INTO loans (book_id, user_id, loan_date, due_date, return_date, status, notes) VALUES
(1, 1, '2026-10-15', '2026-10-25', NULL, 'ACTIVE', 'Préstamo regular de 10 días'),
(2, 2, '2026-10-01', '2026-10-10', '2026-10-09', 'RETURNED', 'Devuelto a tiempo sin novedad');

-- =============================================================================
-- CONSULTAS DE VERIFICACIÓN (TEST QUERIES)
-- Todas las consultas al catálogo DEBEN filtrar is_deleted = FALSE
-- para mostrar únicamente libros activos en inventario.
-- =============================================================================

-- Consulta 1: Catálogo activo completo con autor y categoría (excluye bajas lógicas)
SELECT
    b.id AS book_id,
    b.title,
    b.isbn,
    a.name AS author_name,
    c.name AS category_name,
    b.publication_year,
    IF(b.is_available, 'Disponible', 'No disponible') AS availability
FROM books b
JOIN authors a ON b.author_id = a.id
JOIN categories c ON b.category_id = c.id
WHERE b.is_deleted = FALSE
ORDER BY b.title ASC;

-- Consulta 2: Libros en préstamo activo con datos del prestatario (RF-05)
SELECT
    l.id AS loan_id,
    b.title AS book_title,
    u.full_name AS borrower_name,
    u.phone AS borrower_phone,
    l.loan_date,
    l.due_date,
    l.status
FROM loans l
JOIN books b ON l.book_id = b.id
JOIN users u ON l.user_id = u.id
WHERE l.status = 'ACTIVE'
  AND b.is_deleted = FALSE;

-- =============================================================================
-- CONSULTAS DE VERIFICACIÓN DE RN-05 (BAJA LÓGICA - SOFT DELETE)
-- =============================================================================

-- Las verificaciones 3a a 3c se ejecutan dentro de una transacción que se
-- revierte al final (ROLLBACK), para que los datos semilla queden intactos
-- y coincidan con los del prototipo navegable (propuestas-prototipo/).
START TRANSACTION;

-- Verificación 3a: Baja lógica válida (libro 2 disponible, préstamo RETURNED)
-- El libro 2 tiene is_available = TRUE -> la baja lógica DEBE proceder.
UPDATE books SET is_deleted = TRUE WHERE id = 2 AND is_available = TRUE;

-- Verificación 3b: El libro 2 NO debe aparecer en el catálogo activo
SELECT id, title, is_available, is_deleted FROM books WHERE is_deleted = FALSE;

-- Verificación 3c: El historial de loans se conserva íntegro (auditoría)
SELECT l.id, l.status, l.loan_date, l.return_date, b.title
FROM loans l
JOIN books b ON l.book_id = b.id
WHERE l.book_id = 2;

-- Se revierte la baja demostrativa: el libro 2 vuelve a estar activo en el catálogo.
ROLLBACK;

-- Verificación 3d: Intento de baja lógica sobre libro con préstamo ACTIVO
-- El libro 1 tiene is_available = FALSE -> la validación de negocio debe BLOQUEAR
-- esta operación ANTES de ejecutar el UPDATE (control en lógica de aplicación).
-- La siguiente sentencia NO debe ejecutarse en producción; es solo demostrativa:
-- UPDATE books SET is_deleted = TRUE WHERE id = 1 AND is_available = TRUE;
-- Resultado esperado: 0 rows affected (la condición is_available = TRUE no se cumple).

-- =============================================================================
-- CONSULTAS DE VERIFICACIÓN: UNICIDAD DE PRÉSTAMO ACTIVO POR LIBRO
-- =============================================================================

-- Verificación 4: El libro 1 ya tiene un préstamo 'ACTIVE' (id = 1).
-- El siguiente intento de registrar otro préstamo activo para el mismo libro
-- es BLOQUEADO directamente por el motor MySQL mediante la restricción uk_loans_active_book:
-- INSERT INTO loans (book_id, user_id, loan_date, due_date, status)
-- VALUES (1, 2, '2026-10-26', '2026-11-05', 'ACTIVE');
-- Resultado esperado: ERROR 1062 (23000): Duplicate entry '1' for key 'uk_loans_active_book'

-- =============================================================================
-- CONSULTAS DE VERIFICACIÓN: VALIDACIÓN DE FORMATOS EN EL MOTOR (Obs 06)
-- Las siguientes inserciones son rechazadas por las restricciones CHECK.
-- Se dejan comentadas para no interrumpir la ejecución del script:
-- INSERT INTO books (isbn, title, author_id, category_id, publication_year)
-- VALUES ('hola', 'Libro de prueba', 1, 1, 2020);
--   -> ERROR 3819: Check constraint 'chk_books_isbn' is violated.
-- INSERT INTO users (document_number, full_name, phone) VALUES ('1', 'Ana', '31A');
--   -> ERROR 3819: Check constraint 'chk_users_document' is violated.
-- INSERT INTO authors (author_code, name, nationality) VALUES ('abc', 'Autor', 'Colombiana');
--   -> ERROR 3819: Check constraint 'chk_authors_code' is violated.
-- =============================================================================

-- =============================================================================
-- CONSULTAS DE VERIFICACIÓN: BÚSQUEDAS PARCIALES CON LIKE (RF-07 / HU-07)
-- Nota de rendimiento: un patrón con comodín inicial ('%texto%') no puede usar
-- el índice B-Tree idx_books_title; para catálogos grandes la aplicación usa
-- primero el patrón por prefijo ('texto%'), que sí aprovecha el índice, y
-- recurre al patrón por contenido solo si no hay resultados.
-- =============================================================================

-- Consulta 5: Búsqueda parcial de libros activos por coincidencia en título o ISBN (RF-07)
SELECT b.id, b.title, b.isbn, a.name AS author_name, c.name AS category_name, b.is_available
FROM books b
JOIN authors a ON b.author_id = a.id
JOIN categories c ON b.category_id = c.id
WHERE (b.title LIKE '%Cien%' OR b.isbn LIKE '%0307%')
  AND b.is_deleted = FALSE;

-- Consulta 6: Filtro predictivo de lectores habilitados por coincidencia en nombre o documento (RF-03 / RF-05)
SELECT id, document_number, full_name, phone
FROM users
WHERE is_active = TRUE
  AND (full_name LIKE '%David%' OR document_number LIKE '%1075%');

-- Consulta 7: Búsqueda de autores por apellido o código para el asistente '?' de la consola (Obs 01)
SELECT id, author_code, name, nationality
FROM authors
WHERE name LIKE '%García%' OR author_code LIKE '0000-0001%'
ORDER BY name ASC;
