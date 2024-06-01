CREATE DATABASE gymsy


-- Creación de la tabla Rol
CREATE TABLE Rol (
    id_role INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(20) NOT NULL,
    rol_inactivo BIT DEFAULT 0 NOT NULL

    CONSTRAINT PK_Id_Rol PRIMARY KEY (id_rol) 
);

-- Creación de la tabla Usuario con las restricciones adicionales
CREATE TABLE Usuario (
    id_usuario INT  IDENTITY(1,1),
    id_rol INT,
    apodo VARCHAR(20) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    avatar_url VARCHAR(100) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
    numero_telefono VARCHAR(100) NOT NULL,
    sexo CHAR(1)  NOT NULL,
    usuario_inactivo BIT DEFAULT 0 NOT NULL,

    CONSTRAINT PK_Id_Usuario PRIMARY KEY (id_usuario) ,
    CONSTRAINT FK_Usuario_Rol FOREIGN KEY (id_rol) REFERENCES Rol(id_role),
    CONSTRAINT Check_Sexo CHECK (sexo IN ('M', 'F'))
);

-- Creación de la tabla TipoDePago
CREATE TABLE TipoDePago (
    id_tipo_pago INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    tipo_pago_inactivo BIT  DEFAULT 0 NOT NULL
);

-- Creación de la tabla Pago
CREATE TABLE Pago (
    id_pago INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT NOT NULL, -- Debería haber una tabla Usuario con id_usuario
    id_tipo_pago INT NOT NULL, -- Referencia a la tabla TipoDePago
    cbu_destino VARCHAR(22) NOT NULL,
    cbu_origen VARCHAR(22) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    inactivo_pago BIT DEFAULT 0 NOT NULL,

    CONSTRAINT FK_Pago_Usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT FK_Pago_TipoDePago FOREIGN KEY (id_tipo_pago) REFERENCES TipoDePago(id_tipo_pago)
);


-- Creación de la tabla PlanEntrenamiento
CREATE TABLE PlanEntrenamiento (
    id_plan_entrenamiento INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT NOT NULL, -- El usuario tipo instructor encargado del plan de entrenamiento
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT,
    plan_entrenamiento_inactivo BIT DEFAULT 0 NOT NULL,

    CONSTRAINT FK_PlanEntrenamiento_Instructor FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Creación de la tabla AlumnoSuscripcion
CREATE TABLE AlumnoSuscripcion (
    id_alumno_suscripcion INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT NOT NULL, 
    id_plan_entrenamiento INT NOT NULL, 
    fecha_expiracion DATE NOT NULL,

    CONSTRAINT FK_AlumnoSuscripcion_Usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT FK_AlumnoSuscripcion_PlanEntrenamiento FOREIGN KEY (id_plan_entrenamiento) REFERENCES PlanEntrenamiento(id_plan_entrenamiento)
);

-- Creación de la tabla EstadoFisico
CREATE TABLE EstadoFisico (
    id_estado_fisico INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(100) NOT NULL,
    peso DECIMAL(5, 2) NOT NULL,
    altura DECIMAL(5, 2) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
    notas TEXT,
    inactivo_estado_fisico BIT DEFAULT 0 NOT NULL,
    id_alumno_suscripcion INT NOT NULL, -- Referencia a la tabla AlumnoSuscripcion
    imagen_url VARCHAR(100),

    CONSTRAINT FK_EstadoFisico_AlumnoSuscripcion FOREIGN KEY (id_alumno_suscripcion) REFERENCES AlumnoSuscripcion(id_alumno_suscripcion)
);
