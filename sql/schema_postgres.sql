-- TABLA CANCHA
CREATE TABLE IF NOT EXISTS cancha (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo_superficie VARCHAR(50) NOT NULL,
    precio_hora NUMERIC(10,2) NOT NULL CHECK (precio_hora > 0)
);

-- TABLA CLIENTE
CREATE TABLE IF NOT EXISTS cliente (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL
);

-- TABLA RESERVA
CREATE TABLE IF NOT EXISTS reserva (
    id SERIAL PRIMARY KEY,
    cancha_id INT NOT NULL,
    cliente_id INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado VARCHAR(20) DEFAULT 'CONFIRMADA',
    FOREIGN KEY (cancha_id) REFERENCES cancha(id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- TABLA PAGO
CREATE TABLE IF NOT EXISTS pago (
    id SERIAL PRIMARY KEY,
    reserva_id INT NOT NULL,
    monto NUMERIC(10,2) NOT NULL CHECK (monto > 0),
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    metodo_pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (reserva_id) REFERENCES reserva(id)
);