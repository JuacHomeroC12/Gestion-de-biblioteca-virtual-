-- =============================================================================
-- SISTEMA DE BIBLIOTECA DIGITAL (DIGITAL LIBRARY SYSTEM)
-- Script DDL / DML Relacional - 3FN (Tercera Forma Normal)
-- Motor de Base de Datos: MySQL / MariaDB (InnoDB)
-- Cumplimiento Formativo: SENA ADSO - Ficha 3239188
-- Instructor: Carlos Julio Cadena | Equipo 08
-- =============================================================================

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
    CONSTRAINT uk_categories_name UNIQUE (name)
) ENGINE=InnoDB;

-- =============================================================================
-- 2. TABLA: authors (Autores con identificador normalizado ORCID/ISNI - RN-02)
-- =============================================================================
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_code VARCHAR(50) NOT NULL,
    name VARCHAR(150) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_authors_code UNIQUE (author_code)
) ENGINE=InnoDB;

-- =============================================================================
-- 3. TABLA: books (Catálogo de libros - RN-01, RN-05, RS-04)
-- =============================================================================
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    publication_year INT NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
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
-- =============================================================================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    document_number VARCHAR(20) NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_users_document UNIQUE (document_number)
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
    notes TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_loans_status CHECK (status IN ('ACTIVE', 'RETURNED', 'OVERDUE')),
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
CREATE INDEX idx_loans_status ON loans(status);
CREATE INDEX idx_loans_due_date ON loans(due_date);

-- =============================================================================
-- DATOS DE PRUEBA (SEED DATA PARA VERIFICACIÓN DEL MVP)
-- =============================================================================

-- Inserción de Categorías
INSERT INTO categories (name, description) VALUES
('Novela y Ficción', 'Obras narrativas de ficción literaria y novelas clásicas.'),
('Ciencia y Tecnología', 'Libros de informática, matemáticas e ingeniería.'),
('Historia y Filosofía', 'Ensayos históricos, crónicas y pensamiento filosófico.');

-- Inserción de Autores
INSERT INTO authors (author_code, name, nationality) VALUES
('0000-0002-1825-0097', 'Gabriel García Márquez', 'Colombiana'),
('0000-0001-5932-8411', 'Miguel de Cervantes Saavedra', 'Española'),
('0000-0003-4512-9901', 'Robert C. Martin', 'Estadounidense');

-- Inserción de Libros
INSERT INTO books (isbn, title, author_id, category_id, publication_year, is_available) VALUES
('978-0307474728', 'Cien años de soledad', 1, 1, 1967, FALSE),
('978-8424116286', 'Don Quijote de la Mancha', 2, 1, 1605, TRUE),
('978-0132350884', 'Clean Code: A Handbook of Agile Software Craftsmanship', 3, 2, 2008, TRUE),
('978-0307387738', 'El amor en los tiempos del cólera', 1, 1, 1985, TRUE);

-- Inserción de Usuarios
INSERT INTO users (document_number, full_name, phone, is_active) VALUES
('1075248911', 'Juan David Romero', '3124567890', TRUE),
('1075334812', 'Juan Diego Oteca', '3157891234', TRUE),
('1075998123', 'Jhojan Javier Melo', '3189912345', TRUE),
('1075000000', 'Carlos Inactivo', '3100000000', FALSE);

-- Inserción de Préstamos (Ejemplo activo y ejemplo devuelto)
INSERT INTO loans (book_id, user_id, loan_date, due_date, return_date, status, notes) VALUES
(1, 1, '2026-10-15', '2026-10-25', NULL, 'ACTIVE', 'Préstamo regular de 10 días'),
(2, 2, '2026-10-01', '2026-10-10', '2026-10-09', 'RETURNED', 'Devuelto a tiempo sin novedad');

-- =============================================================================
-- CONSULTAS DE VERIFICACIÓN (TEST QUERIES)
-- =============================================================================

-- Consulta 1: Catálogo completo con autor y categoría
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
ORDER BY b.title ASC;

-- Consulta 2: Libros en préstamo activo con datos del prestatario (RF-05 / HU-09)
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
WHERE l.status = 'ACTIVE';

-- Consulta 3: Verificación de regla RN-05 (Intento conceptual de eliminar libro prestado)
-- SELECT * FROM books WHERE id = 1 AND is_available = FALSE; -- Debe ser bloqueado por la lógica de negocio.
