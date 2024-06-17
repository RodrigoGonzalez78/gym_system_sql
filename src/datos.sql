
--Insertar los roles en el siguiente orden 

-- Insertar el rol de Administrador
INSERT INTO Rol (nombre)
VALUES ('Administrador');

-- Insertar el rol de Instructor
INSERT INTO Rol (nombre)
VALUES ('Instructor');

-- Insertar el rol de Cliente
INSERT INTO Rol (nombre)
VALUES ('Cliente');

INSERT INTO Rol (nombre)
VALUES ('Recepcionista');



--Isertar Usuarios

--Admin
Insert into Usuario(id_rol,apodo,nombre,apellido,avatar_url,contrasena, fecha_nacimiento, numero_telefono,sexo,usuario_inactivo)
values(1,'admin','adminNombre','adminApellido','','$2a$11$netRERtai.UGKsvpsuVmP.oK6LpZlIH9o49yuS0hJjtvGrEh11652', DATEADD(year, -40, GETDATE()),1,'M',0)

-- Insertar un recepcionista
INSERT INTO Usuario(id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_nacimiento,numero_telefono, sexo, usuario_inactivo)
VALUES (4, 'recepcionista1', 'Juan', 'Perez', '', '$2a$11$netRERtai.UGKsvpsuVmP.oK6LpZlIH9o49yuS0hJjtvGrEh11652', DATEADD(year, -27, GETDATE()), 1234567890, 'M', 0);

-- Insertar tres instructores
INSERT INTO Usuario(id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_nacimiento, numero_telefono, sexo, usuario_inactivo)
VALUES 
(2, 'instructor1', 'Ana', 'Gomez', '', '$2a$11$GqikCjTprRXoyo.KYS3d6OWIa9Fa0NCdN6o4HiT3a/lJ3.AURZaim', DATEADD(year, -40, GETDATE()), 2345678901, 'F', 0),
(2, 'instructor2', 'Luis', 'Martinez', '', '$2a$11$GqikCjTprRXoyo.KYS3d6OWIa9Fa0NCdN6o4HiT3a/lJ3.AURZaim', DATEADD(year, -23, GETDATE()),3456789012, 'M', 0),
(2, 'instructor3', 'Maria', 'Lopez', '', '$2a$11$GqikCjTprRXoyo.KYS3d6OWIa9Fa0NCdN6o4HiT3a/lJ3.AURZaim', DATEADD(year, -30, GETDATE()),4567890123, 'F', 0);

-- Insertar tres clientes
INSERT INTO Usuario(id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_nacimiento, numero_telefono, sexo, usuario_inactivo)
VALUES 
(3, 'cliente1', 'Carlos', 'Fernandez', '', '$2a$11$82xLfp64da9CjjbHT2Kcx.Da7Qk67Hvmj0yiZ3fAbVFn1ZASl7Z9y', DATEADD(year, -20, GETDATE()),5678901234, 'M', 0),
(3, 'cliente2', 'Elena', 'Rodriguez', '', '$2a$11$82xLfp64da9CjjbHT2Kcx.Da7Qk67Hvmj0yiZ3fAbVFn1ZASl7Z9y', DATEADD(year, -40, GETDATE()),6789012345, 'F', 0),
(3, 'cliente3', 'Miguel', 'Sanchez', '', '$2a$11$82xLfp64da9CjjbHT2Kcx.Da7Qk67Hvmj0yiZ3fAbVFn1ZASl7Z9y', DATEADD(year, -50, GETDATE()),7890123456, 'M', 0);

INSERT INTO TipoDePago (nombre) VALUES 
('Tarjeta de Crédito'),
('Transferencia Bancaria'),
('Efectivo');
INSERT INTO Pago (id_usuario, id_tipo_pago, cbu_destino, cbu_origen, monto) VALUES 
(6, 1, '0000000000000000000000', '1111111111111111111111', 1000.00),
(7, 2, '0000000000000000000000', '2222222222222222222222', 1500.00),
(8, 3, '0000000000000000000000', '3333333333333333333333', 2000.00);
INSERT INTO PlanEntrenamiento (id_entrenador, precio, descripcion) VALUES 
(9, 500.00, 'Plan de entrenamiento básico'),
(10, 750.00, 'Plan de entrenamiento intermedio'),
(11, 1000.00, 'Plan de entrenamiento avanzado');
INSERT INTO AlumnoSuscripcion (id_alumno, id_plan_entrenamiento, fecha_expiracion) VALUES 
(6, 1, '2025-06-17'),
(7, 2, '2025-06-17'),
(8, 3, '2025-06-17');
INSERT INTO EstadoFisico (titulo, peso, altura, notas, id_alumno_suscripcion, imagen_url) VALUES 
('Estado inicial Carlos', 70.0, 1.75, 'Estado físico inicial de Carlos', 1, 'img/carlos.png'),
('Estado inicial Elena', 65.0, 1.65, 'Estado físico inicial de Elena', 2, 'img/elena.png'),
('Estado inicial Miguel', 80.0, 1.80, 'Estado físico inicial de Miguel', 3, 'img/miguel.png');


SELECT * FROM Rol

SELECT avatar_url FROM Usuario
