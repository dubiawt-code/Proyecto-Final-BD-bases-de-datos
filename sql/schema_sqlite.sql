-- TABLA CANCHA
CREATE TABLE IF NOT EXISTS cancha (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    tipo_superficie TEXT NOT NULL,
    precio_hora REAL NOT NULL
);

-- TABLA CLIENTE
CREATE TABLE IF NOT EXISTS cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    telefono TEXT NOT NULL,
    correo TEXT NOT NULL
);

-- TABLA RESERVA
CREATE TABLE IF NOT EXISTS reserva (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cancha_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    fecha_reserva TEXT NOT NULL,
    hora_inicio TEXT NOT NULL,
    hora_fin TEXT NOT NULL,
    estado TEXT DEFAULT 'CONFIRMADA',
    FOREIGN KEY (cancha_id) REFERENCES cancha(id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- TABLA PAGO
CREATE TABLE IF NOT EXISTS pago (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    reserva_id INTEGER NOT NULL,
    monto REAL NOT NULL,
    fecha_pago TEXT DEFAULT CURRENT_TIMESTAMP,
    metodo_pago TEXT NOT NULL,
    FOREIGN KEY (reserva_id) REFERENCES reserva(id)
);