-- Datos para Cancha
INSERT INTO cancha (nombre, tipo_superficie, precio_hora) VALUES
('Cancha 1', 'Sintética confama', 60000),
('Cancha 2', 'Sintética poly deportivo', 90000),
('Cancha 3', 'Sintética el carmen', 150000),
('Cancha 4', 'Sintética 12 de octubre', 60000),
('Cancha 5', 'Sintética Calazans', 80000);

-- Datos para Cliente
INSERT INTO cliente (nombre, telefono, correo) VALUES
('Carlos Gomez', '3001112233', 'carlos@mail.com'),
('Ana Martinez', '3104445566', 'ana@mail.com'),
('Pedro Lopez', '3207778899', 'pedro@mail.com'),
('Maria Rodriguez', '3150001122', 'maria@mail.com'),
('Luis Hernandez', '3013334455', 'luis@mail.com');

-- Datos para Reserva
INSERT INTO reserva (cancha_id, cliente_id, fecha_reserva, hora_inicio, hora_fin, estado) VALUES
(1, 1, '2026-10-01', '18:00:00', '19:00:00', 'CONFIRMADA'),
(2, 2, '2026-10-01', '19:00:00', '20:00:00', 'CONFIRMADA'),
(3, 3, '2026-10-02', '20:00:00', '22:00:00', 'CONFIRMADA'),
(4, 4, '2026-10-02', '17:00:00', '18:00:00', 'CANCELADA'),
(5, 5, '2026-10-03', '18:00:00', '20:00:00', 'CONFIRMADA');

-- Datos para Pago
INSERT INTO pago (reserva_id, monto, metodo_pago) VALUES 
(1, 60000, 'Nequi'),
(2, 90000, 'Efectivo'),
(3, 300000, 'Tarjeta'),
(4, 245000, 'N/A'),
(5, 160000, 'Bancolombia');
