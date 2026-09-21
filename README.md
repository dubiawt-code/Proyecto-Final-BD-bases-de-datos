# FutbolGo - Sistema de Gestión para Canchas Sintéticas

## 1. Integrantes del Equipo
- Duban Lobo Zabala (Dubiawt)
- Verónica Pulgarin

## 2. Descripción del Negocio y Justificación
- **Contexto general del problema a resolver:** La falta de un control organizado en el alquiler de canchas sintéticas provoca cruces de horarios, desorden en los pagos de los clientes y pérdida de registros de las reservas.
- **Objetivo de la aplicación:** Ofrecer un sistema básico en Python con ORM Peewee para registrar clientes, gestionar la disponibilidad de las canchas, controlar el estado de las reservas y almacenar los datos de los pagos realizados.

## 3. Entidades Principales del Dominio
- **Cancha:** Guarda la información básica de la cancha (nombre, tipo de superficie y precio por hora).
- **Cliente:** Registra los datos de contacto de las personas que hacen reservas (nombre, teléfono y correo).
- **Reserva:** Conecta un cliente con una cancha en una fecha y horario específico. Relación 1:N con Cancha y Cliente.
- **Pago:** Registra los abonos y liquidaciones asociados a cada reserva. Relación 1:N con Reserva.

## 4. Matriz de Entornos y Conexiones
- **Motores y proveedores probados:**
  - SQLite (archivo local `futbolgo.db`)
  - MySQL (Aiven.io)
  - PostgreSQL (Neon.tech)
  - PostgreSQL (Render.com)

## 5. Instrucciones de Ejecución
- **Comando de instalación de librerías:** `pip install peewee psycopg2-binary pymysql`
- **Comando para ejecutar la aplicación:** `python app.py`
