# Шаг 1: Берем официальный базовый образ Python
FROM python:3.9-slim

# Шаг 2: Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Шаг 3: Копируем файл с зависимостями и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Шаг 4: Копируем код нашего приложения
COPY app.py .

# Шаг 5: Указываем команду для запуска приложения при старте контейнера
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:5000", "app:app"]