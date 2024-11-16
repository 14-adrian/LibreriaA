# Usar Python 3.10.4
FROM python:3.10.4-slim

# Variables de entorno
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Crear directorio de trabajo
WORKDIR /app

# Copiar el archivo de requerimientos
COPY requirements.txt /app/

# Instalar las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código de la aplicación
COPY . /app/

# Exponer el puerto 8000
EXPOSE 8000

# Comando para correr la app con Gunicorn
CMD ["gunicorn", "ActividadIntegradora.wsgi:application", "--bind", "0.0.0.0:8000"]
