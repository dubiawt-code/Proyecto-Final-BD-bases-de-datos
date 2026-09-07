Proyecto-Final-BD-bases-de-datos
Gestion Multi-Motor de Bases de Datos con Python y Peewee ORM
Sistema de Gestión y Reservas de Canchas Sintéticas (CanchaGO)

1. Integrantes del Proyecto
* Veronica Pulgarin
* Duban Lobo Zabala

2. Descripción de la Idea de Negocio
"CanchaGO" es una plataforma diseñada para automatizar la administración y reserva de espacios deportivos 

3. Problemática
Hoy en día, la mayoría de centros deportivos manejan sus reservas en papel o por chat. Esto causa que se reserven dos grupos en la misma cancha y hora, que los clientes cancelen a última hora dejando la cancha sola y perdiendo dinero, y que al final del día sea muy difícil llevar cuentas claras de los ingresos reales del negocio

4. Solución Propuesta
Crearemos un sistema fácil de usar que guardde toda la información en un solo lugar, permitiendonos ver las canchas disponibles en tiempo real, guardar los datos de tus clientes, agendar turnos sin que se crucen los horarios y llevar un control exacto de los pagos 

5. Alcance del Proyecto
El sistema permitirá ejecutar las siguientes funcionalidades:

Gestión de Canchas: Registrar, listar, actualizar y eliminar las canchas disponibles, clasificándolas por tipo de deporte y tarifa por hora
Gestión de Clientes: Guardar la información de los usuarios que realizan reservas (nombre, teléfono, correo electrónico)
Control de Reservas: Programar reservas asociando un cliente con una cancha en una fecha y hora específicas, evitando coincidencias de horario 
Manejo de Pagos y Cancelaciones: Registrar abonos o pagos totales de las reservas y permitir la cancelación de citas

4. Tecnologías a Utilizar
* Lenguaje de Programación: Python 3.x
* ORM: Peewee
* Base de Datos: PostgreSQL (Neon)
