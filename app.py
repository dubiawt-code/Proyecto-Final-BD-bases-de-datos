import datetime
from peewee import *


# 1. SELECCIÓN DE MOTOR DE BASE DE DATOS
# Opciones: 'SQLITE', 'NEON', 'AIVEN', 'RENDER'

MOTOR_ACTIVO = 'NEON'

# 2. CONFIGURACIÓN DE CONEXIONES CLOUD / LOCAL

if MOTOR_ACTIVO == 'SQLITE':
    db = SqliteDatabase('futbolgo.db')

elif MOTOR_ACTIVO == 'NEON':
    db = PostgresqlDatabase(
        'neondb',
        user='neondb_owner',
        password='npg_UMgSeZ50lVvQ',
        host='ep-noisy-wind-b4f2j98r-pooler.c-6.us-east-2.aws.neon.tech',
        port=5432,
        sslmode='require',
    )


elif MOTOR_ACTIVO == 'AIVEN':
    db = MySQLDatabase(
        'defaultdb',
        user='avnadmin',
        password='YOUR_AIVEN_PASSWORD', 
        host='YOUR_AIVEN_HOST',          
        port=18361
    )

elif MOTOR_ACTIVO == 'RENDER':
    db = PostgresqlDatabase(
        'futbolgo_db',
        user='futbolgo_user',
        password='YOUR_RENDER_PASSWORD', 
        host='YOUR_RENDER_HOST',         
        port=5432,
        sslmode='require'
    )

# 3. DEFINICIÓN DE MODELOS (ENTIDADES PEEWEE)

class BaseModel(Model):
    class Meta:
        database = db

class Cancha(BaseModel):
    nombre = CharField(max_length=100)
    tipo_superficie = CharField(max_length=50)
    precio_hora = DecimalField(max_digits=10, decimal_places=2)

class Cliente(BaseModel):
    nombre = CharField(max_length=100)
    telefono = CharField(max_length=20)
    correo = CharField(max_length=100)

class Reserva(BaseModel):
    cancha = ForeignKeyField(Cancha, backref='reservas')
    cliente = ForeignKeyField(Cliente, backref='reservas')
    fecha_reserva = DateField()
    hora_inicio = TimeField()
    hora_fin = TimeField()
    estado = CharField(default='CONFIRMADA')

class Pago(BaseModel):
    reserva = ForeignKeyField(Reserva, backref='pagos')
    monto = DecimalField(max_digits=10, decimal_places=2)
    fecha_pago = DateTimeField(default=datetime.datetime.now)
    metodo_pago = CharField(max_length=50)

# 4. LÓGICA DE EJECUCIÓN Y OPERACIONES CRUD

def inicializar_bd():
    db.connect()
    print(f"\n==========================================")
    print(f"CONECTADO EXITOSAMENTE AL MOTOR: {MOTOR_ACTIVO}")
    print(f"==========================================")
    db.create_tables([Cancha, Cliente, Reserva, Pago])

def probar_crud():
    print("\n1. Insertando registros de prueba")
    cancha1 = Cancha.create(
        nombre='Cancha 1 - Confama',
        tipo_superficie='Sintética',
        precio_hora=60000.00
    )
    cliente1 = Cliente.create(
        nombre='Carlos Gomez',
        telefono='3001112233',
        correo='carlos@mail.com'
    )
    reserva1 = Reserva.create(
        cancha=cancha1,
        cliente=cliente1,
        fecha_reserva='2026-10-01',
        hora_inicio='18:00:00',
        hora_fin='19:00:00',
        estado='CONFIRMADA'
    )
    pago1 = Pago.create(
        reserva=reserva1,
        monto=60000.00,
        metodo_pago='Nequi'
    )
    print("Registros creados correctamente.")
 
    print("\n2. Consultando datos relacionales")
    query = (Reserva
             .select(Reserva, Cliente, Cancha)
             .join(Cliente)
             .switch(Reserva)
             .join(Cancha))
    
    for r in query:
        print(f"Reserva ID: {r.id} | Cliente: {r.cliente.nombre} | Cancha: {r.cancha.nombre} | Estado: {r.estado}")

    print("\n3. Actualizando estado de la reserva...")
    reserva1.estado = 'FINALIZADA'
    reserva1.save()
    print(f"Reserva {reserva1.id} actualizada a estado: {reserva1.estado}")

    print("\n4. Limpiando registros de prueba")
    pago1.delete_instance()
    reserva1.delete_instance()
    cliente1.delete_instance()
    cancha1.delete_instance()
    print("Registros de prueba eliminados correctamente...")

if __name__ == '__main__':
    inicializar_bd()
    probar_crud()
    db.close()
    print(f"\nConexión a {MOTOR_ACTIVO} cerrada correctamente... \n")