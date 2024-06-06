
--Insertar los roles en el siguiente orden 

-- Insertar el rol de Administrador
INSERT INTO Rol (nombre, rol_inactivo)
VALUES ('Administrador');

-- Insertar el rol de Instructor
INSERT INTO Rol (nombre, rol_inactivo)
VALUES ('Instructor');

-- Insertar el rol de Cliente
INSERT INTO Rol (nombre, rol_inactivo)
VALUES ('Cliente');

--Nuevos Usuarios ejemplo

-- Insertar un usuario Administrador
INSERT INTO Usuario (id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo)
VALUES (1, 'admin', 'AdminNombre', 'AdminApellido', 'http://example.com/avatar_admin.png', 'admin_contrasena', GETDATE(), '1234567890', 'M', 0);

-- Insertar un usuario Instructor
INSERT INTO Usuario (id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo)
VALUES (2, 'instr', 'InstrNombre', 'InstrApellido', 'http://example.com/avatar_instr.png', 'instr_contrasena', GETDATE(), '0987654321', 'F', 0);

-- Insertar un usuario Cliente
INSERT INTO Usuario (id_rol, apodo, nombre, apellido, avatar_url, contrasena, fecha_creacion, numero_telefono, sexo, usuario_inactivo)
VALUES (3, 'cliente', 'ClienteNombre', 'ClienteApellido', 'http://example.com/avatar_cliente.png', 'cliente_contrasena', GETDATE(), '1122334455', 'M', 0);
