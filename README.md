Sistema de Gestión y Reservas de Canchas Sintéticas (CanchaGO)

1. Integrantes del Equipo
- Verónica Pulgarin
- Duban Lobo Zabala

2. Descripción del Negocio y Justificación
- Hoy en día la mayoría de centros deportivos manejan sus reservas en papel o por chat, Esto causa que se reserven dos grupos en la misma cancha y hora, que los clientes cancelen a última hora dejando la cancha sola y perdiendo dinero y que al final del día sea difícil llevar cuentas claras de los ingresos reales...
- Objetivo de la aplicación: Crearemos un sistema fácil de usar que guarde toda la información en un solo lugar, permitiéndonos ver las canchas disponibles en tiempo real, guardar los datos de los clientes, agendar turnos sin que se crucen los horarios y llevar un control exacto de los pagos

3. Entidades Principales del Dominio
- Cancha: Representa los espacios deportivos disponibles y Contiene detalles como tipo de deporte y tarifa por hora. Relación de 1:N con Reserva
- Cliente: Registra los datos de los usuarios que reservan (nombre, teléfono, correo) Relación de 1:N con Reserva
- Reserva: Vincula a un Cliente con una Cancha en una fecha y hora específicas. Controla la disponibilidad y evita cruces. Relación de 1:N con pago
- Pago: Mantiene el registro de los pagos totales de las reservas realizadas

4. Matriz de Entornos y Conexiones: Motores y proveedores probados:
  - PostgreSQL (Neon.tech)
  

