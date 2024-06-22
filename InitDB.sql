CREATE DATABASE EVALUATEC;

USE EVALUATEC;

-- Create table Materias
CREATE TABLE Materias (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Auto-incrementing ID
  Nombre VARCHAR(255) NOT NULL
);

-- Create table Docente
CREATE TABLE Docente (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Auto-incrementing ID
  Nombre VARCHAR(255) NOT NULL,
  ApPaterno VARCHAR(255) NOT NULL,
  ApMaterno VARCHAR(255) NOT NULL,
  GradoEstudio VARCHAR(255),
  Foto VARCHAR(255)
);

-- Create table Departamento
CREATE TABLE Departamento (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Auto-incrementing ID
  Nombre VARCHAR(255) NOT NULL
);

-- Create table Alumno
CREATE TABLE Alumno (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Auto-incrementing ID
  Email VARCHAR(255) NOT NULL UNIQUE,
  Password VARCHAR(255) NOT NULL
);

-- Create table Puntaje
CREATE TABLE Puntaje (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Auto-incrementing ID
  ID_ALUMNO INT NOT NULL,
  ID_DOCENTE INT NOT NULL,
  Calificacion INT NOT NULL,
  Opinion TEXT,
  FOREIGN KEY (ID_ALUMNO) REFERENCES Alumno(ID),
  FOREIGN KEY (ID_DOCENTE) REFERENCES Docente(ID)
);

-- Create table Impartidas (Many-to-Many relationship between Docente and Materias)
CREATE TABLE Impartidas (
  ID_REGISTRO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Auto-incrementing ID
  ID_DOCENTE INT NOT NULL,
  ID_MATERIA INT NOT NULL,
  FOREIGN KEY (ID_DOCENTE) REFERENCES Docente(ID),
  FOREIGN KEY (ID_MATERIA) REFERENCES Materias(ID)
);

-- Create table Pertenecen (Many-to-Many relationship between Docente and Departamento)
CREATE TABLE Pertenecen (
  ID_REGISTRO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Auto-incrementing ID
  ID_DOCENTE INT NOT NULL,
  ID_DEPARTAMENTO INT NOT NULL,
  FOREIGN KEY (ID_DOCENTE) REFERENCES Docente(ID),
  FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES Departamento(ID)
);
