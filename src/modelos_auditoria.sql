CREATE TABLE Rol_Audit (
    audit_id INT IDENTITY(1,1),
    id_rol INT,
    nombre VARCHAR(20),
    rol_inactivo BIT,
    operation_type CHAR(1), -- I=Insert, U=Update, D=Delete
    operation_date DATETIME DEFAULT GETDATE(),
    CONSTRAINT ROL_AUDIT_PK_AUDIT_ID PRIMARY KEY (audit_id)
);


CREATE TABLE Usuario_Audit (
    audit_id INT IDENTITY(1,1),
    id_usuario INT,
    id_rol INT,
    apodo VARCHAR(20),
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    avatar_url VARCHAR(100),
    contrasena VARCHAR(100),
    fecha_creacion DATETIME,
    numero_telefono VARCHAR(100),
    sexo CHAR(1),
    usuario_inactivo BIT,
    operation_type CHAR(1), -- I=Insert, U=Update, D=Delete
    operation_date DATETIME DEFAULT GETDATE(),
    CONSTRAINT USUARIO_AUDIT_PK_AUDIT_ID PRIMARY KEY (audit_id)
);

CREATE TABLE TipoDePago_Audit (
    audit_id INT IDENTITY(1,1),
    id_tipo_pago INT,
    nombre VARCHAR(50),
    tipo_pago_inactivo BIT,
    operation_type CHAR(1), -- I=Insert, U=Update, D=Delete
    operation_date DATETIME DEFAULT GETDATE(),
    CONSTRAINT TIPODEPAGO_AUDIT_PK_AUDIT_ID PRIMARY KEY (audit_id)
);

CREATE TABLE Pago_Audit (
    audit_id INT IDENTITY(1,1),
    id_pago INT,
    id_usuario INT,
    id_tipo_pago INT,
    cbu_destino VARCHAR(22),
    cbu_origen VARCHAR(22),
    fecha_creacion DATETIME,
    monto DECIMAL(10, 2),
    inactivo_pago BIT,
    operation_type CHAR(1), -- I=Insert, U=Update, D=Delete
    operation_date DATETIME DEFAULT GETDATE(),
    CONSTRAINT PAGO_AUDIT_PK_AUDIT_ID PRIMARY KEY (audit_id)
);
CREATE TABLE PlanEntrenamiento_Audit (
    audit_id INT IDENTITY(1,1),
    id_plan_entrenamiento INT,
    id_usuario INT,
    precio DECIMAL(10, 2),
    descripcion VARCHAR(MAX),
    plan_entrenamiento_inactivo BIT,
    operation_type CHAR(1), -- I=Insert, U=Update, D=Delete
    operation_date DATETIME DEFAULT GETDATE(),
    CONSTRAINT PLANENTRENAMIENTO_AUDIT_PK_AUDIT_ID PRIMARY KEY (audit_id)
);

CREATE TABLE AlumnoSuscripcion_Audit (
    audit_id INT IDENTITY(1,1),
    id_alumno_suscripcion INT,
    id_usuario INT,
    id_plan_entrenamiento INT,
    fecha_expiracion DATE,
    operation_type CHAR(1), -- I=Insert, U=Update, D=Delete
    operation_date DATETIME DEFAULT GETDATE(),
    CONSTRAINT ALUMNOSUSCRIPCION_AUDIT_PK_AUDIT_ID PRIMARY KEY (audit_id)
);


CREATE TABLE EstadoFisico_Audit (
    audit_id INT IDENTITY(1,1),
    id_estado_fisico INT,
    titulo VARCHAR(100),
    peso DECIMAL(5, 2),
    altura DECIMAL(5, 2),
    fecha_creacion DATETIME,
    notas VARCHAR(MAX),
    estado_fisico_inactivo BIT,
    id_alumno_suscripcion INT,
    imagen_url VARCHAR(100),
    operation_type CHAR(1), -- I=Insert, U=Update, D=Delete
    operation_date DATETIME DEFAULT GETDATE(),
    CONSTRAINT ESTADOFISICO_AUDIT_PK_AUDIT_ID PRIMARY KEY (audit_id)
);
