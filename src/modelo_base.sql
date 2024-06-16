CREATE DATABASE gymsy


-- Creación de la tabla Rol
CREATE TABLE Rol (
    id_rol INT IDENTITY(1,1),
    nombre VARCHAR(20) NOT NULL,
    rol_inactivo BIT DEFAULT 0 NOT NULL

    CONSTRAINT ROL_PK_ID_ROL PRIMARY KEY (id_rol) 
);

-- Creación de la tabla Usuario con las restricciones adicionales
CREATE TABLE Usuario (
    id_usuario INT  IDENTITY(1,1),
    id_rol INT,
    apodo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    avatar_url VARCHAR(100) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
    fecha_nacimiento DATETIME NOT NULL,
    numero_telefono VARCHAR(100) NOT NULL,
    sexo CHAR(1)  NOT NULL,
    usuario_inactivo BIT DEFAULT 0 NOT NULL,

    CONSTRAINT USUARIO_PK_ID_USUARIO PRIMARY KEY (id_usuario) ,
    CONSTRAINT USUARIO_FK_USUARIO_ROL FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
    CONSTRAINT USUARIO_CHECK_SEXO CHECK (sexo IN ('M', 'F'))
);

-- Creación de la tabla TipoDePago
CREATE TABLE TipoDePago (
    id_tipo_pago INT IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    tipo_pago_inactivo BIT  DEFAULT 0 NOT NULL

    CONSTRAINT TIPODEPAGO_PK_ID_TIPO_PAGO PRIMARY KEY (id_tipo_pago)
);

-- Creación de la tabla Pago
CREATE TABLE Pago (
    id_pago INT IDENTITY(1,1),
    id_usuario INT NOT NULL, -- Debería haber una tabla Usuario con id_usuario
    id_tipo_pago INT NOT NULL, -- Referencia a la tabla TipoDePago
    cbu_destino VARCHAR(22) NOT NULL,
    cbu_origen VARCHAR(22) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    inactivo_pago BIT DEFAULT 0 NOT NULL,

    CONSTRAINT PAGO_PK_ID_PAGO PRIMARY KEY (id_pago),
    CONSTRAINT PAGO_FK_PAGO_USUARIO FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT PAGO_FK_PAGO_TIPOPAGO FOREIGN KEY (id_tipo_pago) REFERENCES TipoDePago(id_tipo_pago)
);


-- Creación de la tabla PlanEntrenamiento
CREATE TABLE PlanEntrenamiento (
    id_plan_entrenamiento INT  IDENTITY(1,1),
    id_entrenador INT NOT NULL, -- El usuario tipo instructor encargado del plan de entrenamiento
    precio DECIMAL(10, 2) NOT NULL,
    descripcion VARCHAR(MAX) NOT NULL,
    plan_entrenamiento_inactivo BIT DEFAULT 0 NOT NULL,

    CONSTRAINT PLANENTRENAMIENTO_PK_ID_PLAN_ENTRENAMIENTO PRIMARY KEY (id_plan_entrenamiento),
    CONSTRAINT FK_PLANENTRENAMIENTO_INSTRUCTOR FOREIGN KEY (id_entrenador) REFERENCES Usuario(id_usuario)
);

-- Creación de la tabla AlumnoSuscripcion
CREATE TABLE AlumnoSuscripcion (
    id_alumno_suscripcion INT IDENTITY(1,1),
    id_alumno INT NOT NULL, 
    id_plan_entrenamiento INT NOT NULL, 
    fecha_expiracion DATE NOT NULL,

    CONSTRAINT ALUMNOSUSCRIPCION_PK_ID_ALUMNO_SUSCRIPCION PRIMARY KEY (id_alumno_suscripcion),
    CONSTRAINT ALUMNOSUSCRIPCION_FK_AlumnoSuscripcion_Usuario FOREIGN KEY (id_alumno) REFERENCES Usuario(id_usuario),
    CONSTRAINT ALUMNOSUSCRIPCION_FK_AlumnoSuscripcion_PlanEntrenamiento FOREIGN KEY (id_plan_entrenamiento) REFERENCES PlanEntrenamiento(id_plan_entrenamiento)
);

-- Creación de la tabla EstadoFisico
CREATE TABLE EstadoFisico (
    id_estado_fisico INT IDENTITY(1,1),
    titulo VARCHAR(100) NOT NULL,
    peso DECIMAL(5, 2) NOT NULL,
    altura DECIMAL(5, 2) NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
    notas VARCHAR(MAX) NOt NULL,
    estado_fisico_inactivo BIT DEFAULT 0 NOT NULL,
    id_alumno_suscripcion INT NOT NULL,
    imagen_url VARCHAR(100) NOT  NULL,

    CONSTRAINT ESTADOFISICO_PK_ID_ESTADO_FISICO PRIMARY KEY (id_estado_fisico),
    CONSTRAINT ESTADOFISICO_FK_EstadoFisico_AlumnoSuscripcion FOREIGN KEY (id_alumno_suscripcion) REFERENCES AlumnoSuscripcion(id_alumno_suscripcion)
);
