CREATE DATABASE TuMedico;
USE TuMedico;

-- Tabla para roles de usuario
CREATE TABLE Roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

INSERT INTO Roles (nombre) VALUES ('Paciente'), ('Medico'), ('Administrador');

-- Tabla para usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    identificacion VARCHAR(50) UNIQUE NOT NULL,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES Roles(id)
);

ALTER TABLE usuarios ADD rol INT(1);

CREATE TABLE Pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    fecha_nacimiento DATE,
    direccion VARCHAR(255),
    telefono VARCHAR(50),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

CREATE TABLE Medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    especialidad VARCHAR(100),
    numero_licencia VARCHAR(50) UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

CREATE TABLE Citas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    fecha_hora DATETIME,
    motivo TEXT,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(id)
);

CREATE TABLE Recetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT,
    medicamento TEXT,
    dosis TEXT,
    instrucciones TEXT,
    FOREIGN KEY (cita_id) REFERENCES Citas(id)
);

CREATE TABLE Comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT,
    comentario TEXT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cita_id) REFERENCES Citas(id)
);

CREATE TABLE Administradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

INSERT INTO Usuarios (nombre, email, password, identificacion, rol_id) VALUES 
('Admin', 'admin@tumedico.com', '12345', '123456789', 3);
INSERT INTO Administradores (usuario_id) VALUES (LAST_INSERT_ID());
