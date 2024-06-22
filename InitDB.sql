CREATE DATABASE EVALUATEC;

USE EVALUATEC;

-- Create table Materias
CREATE TABLE Materias (
  ID int PRIMARY KEY,
  Nombre varchar(255) NOT NULL
);

-- Create table Docente
CREATE TABLE Docente (
  ID int PRIMARY KEY,
  Nombre varchar(255) NOT NULL,
  ApPaterno varchar(255) NOT NULL,
  ApMaterno varchar(255) NOT NULL,
  GradoEstudio varchar(255),
  Foto varchar(255)
);

-- Create table Departamento
CREATE TABLE Departamento (
  ID int PRIMARY KEY,
  Nombre varchar(255) NOT NULL
);

-- Create table Alumno
CREATE TABLE Alumno (
  ID int PRIMARY KEY,
  Email varchar(255) NOT NULL UNIQUE,
  Password varchar(255) NOT NULL
);

-- Create table Puntaje
CREATE TABLE Puntaje (
  ID int PRIMARY KEY,
  ID_ALUMNO int NOT NULL,
  ID_DOCENTE int NOT NULL,
  Calificacion int NOT NULL,
  Opinion text,
  FOREIGN KEY (ID_ALUMNO) REFERENCES Alumno(ID),
  FOREIGN KEY (ID_DOCENTE) REFERENCES Docente(ID)
);

-- Create table Impartidas (Many-to-Many relationship between Docente and Materias)
CREATE TABLE Impartidas (
  ID_REGISTRO int PRIMARY KEY,
  ID_DOCENTE int NOT NULL,
  ID_MATERIA int NOT NULL,
  FOREIGN KEY (ID_DOCENTE) REFERENCES Docente(ID),
  FOREIGN KEY (ID_MATERIA) REFERENCES Materias(ID)
);

-- Create table Pertenecen (Many-to-Many relationship between Docente and Departamento)
CREATE TABLE Pertenecen (
  ID_REGISTRO int PRIMARY KEY,
  ID_DOCENTE int NOT NULL,
  ID_DEPARTAMENTO int NOT NULL,
  FOREIGN KEY (ID_DOCENTE) REFERENCES Docente(ID),
  FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES Departamento(ID)
);
