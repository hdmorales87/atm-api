# ATM API

API REST para un sistema de cajero automático (ATM) construido con Ruby on Rails.

## Comandos Fundamentales de Ruby

### Gestión de Gems
```bash
# Instalar una gem específica
gem install nombre_gem

# Ver gems instaladas
gem list

# Ver información de una gem específica
gem info nombre_gem

# Actualizar gems
gem update

# Desinstalar una gem
gem uninstall nombre_gem
```

### Ejecución de Ruby
```bash
# Ejecutar un archivo Ruby
ruby archivo.rb

# Ejecutar código Ruby inline
ruby -e "puts 'Hola Mundo'"

# Ver versión de Ruby
ruby -v
```

## Comandos Fundamentales de Rails

### Crear un Nuevo Proyecto
```bash
# Crear nuevo proyecto Rails
rails new nombre_proyecto

# Crear proyecto sin tests mínimos
rails new nombre_proyecto --minimal

# Crear proyecto con opciones específicas
rails new nombre_proyecto --api --database=postgresql
```

### Gestión de Dependencias (Bundler)
```bash
# Instalar dependencias del Gemfile
bundle install

# Actualizar dependencias
bundle update

# Agregar una gem al Gemfile e instalarla
bundle add nombre_gem

# Ver dependencias instaladas
bundle show
```

### Base de Datos
```bash
# Crear la base de datos
rails db:create

# Ejecutar migraciones pendientes
rails db:migrate

# Revertir la última migración
rails db:rollback

# Revertir múltiples migraciones
rails db:rollback STEP=3

# Ver estado de las migraciones
rails db:migrate:status

# Resetear la base de datos (borra y recrea)
rails db:reset

# Cargar datos semilla (seed)
rails db:seed

# Preparar base de datos para pruebas
rails db:test:prepare
```

### Generadores
```bash
# Generar un modelo
rails g model User name:string email:string

# Generar un controlador
rails g controller Users index show

# Generar un scaffold (modelo + controlador + vistas)
rails g scaffold Post title:string body:text

# Generar una migración
rails g migration AddColumnToTable column:type

# Generar un API scaffold (sin vistas)
rails g api:scaffold Product name:string price:decimal
```

### Consola Rails
```bash
# Abrir consola Rails (modo desarrollo)
rails console
# o
rails c

# Abrir consola en modo prueba
rails console test
# o
rails c test

# Abrir consola en modo producción
rails console production

# Recargar código en la consola
reload!
```

### Servidor
```bash
# Iniciar servidor de desarrollo
rails server
# o
rails s

# Iniciar servidor en puerto específico
rails s -p 4000

# Iniciar servidor con entorno específico
rails s -e production
```

### Rutas
```bash
# Ver todas las rutas de la aplicación
rails routes

# Ver rutas que coinciden con un patrón
rails routes | grep users

# Ver rutas en formato conciso
rails routes --expanded
```

### Tareas Generales
```bash
# Ver todas las tareas disponibles
rails -T

# Ver tareas de un namespace específico
rails -T db

# Ejecutar una tarea específica
rails task_name
```

### Debugging
```bash
# Agregar breakpoint en el código
debugger

# En Rails 8.1+, usar el debugger nativo
# Cuando el servidor se detiene en un breakpoint:
# locals - ver variables locales
# params - ver parámetros
# continue o c - continuar ejecución
# step o s - avanzar una línea
# next o n - avanzar al siguiente método
# help - ver todos los comandos
```

## Estructura del Proyecto

```
app/
├── controllers/    # Controladores de la aplicación
├── models/         # Modelos de ActiveRecord
├── views/          # Vistas (no usado en API only)
├── helpers/        # Helpers de vista
├── mailers/        # Mailers
└── jobs/           # Jobs en segundo plano

config/             # Configuración de la aplicación
db/                 # Archivos de base de datos y migraciones
lib/                # Librerías y extensiones
log/                # Logs de la aplicación
public/             # Archivos públicos
test/               # Tests
tmp/                # Archivos temporales
vendor/             # Código de terceros
```

## API Endpoints

### Consultar Saldo
```bash
GET /api/v1/balance?account_number={account_number}
```

### Depositar
```bash
POST /api/v1/deposit
Content-Type: application/json

{
  "account_number": "{account_number}",
  "amount": 100
}
```

### Retirar
```bash
POST /api/v1/withdraw
Content-Type: application/json

{
  "account_number": "{account_number}",
  "amount": 50
}
```

## Convenciones de Rails

- **Nombres de modelos**: Singular, PascalCase (ej: `BankAccount`)
- **Nombres de tablas**: Plural, snake_case (ej: `bank_accounts`)
- **Nombres de controladores**: Plural, PascalCase (ej: `BankAccountsController`)
- **Nombres de archivos**: snake_case (ej: `bank_account.rb`)
- **Foreign keys**: `modelo_id` (ej: `user_id`)

## Testing

```bash
# Ejecutar todos los tests
rails test

# Ejecutar tests específicos
rails test test/models/user_test.rb

# Ejecutar tests en paralelo
rails test:parallel
```

## Ruby Version

Ruby 4.0.7

## System Dependencies

- SQLite3 (database)
- Puma (web server)
- Rails 8.1.4
