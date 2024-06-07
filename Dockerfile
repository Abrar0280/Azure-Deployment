# Use the official Python image from the Docker Hub
FROM python:3.8-slim-buster

# Set environment variables to prevent Python from writing pyc files and buffering stdout/stderr
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app
COPY . /app

RUN apt update -y && apt install awscli -y

RUN pip install --upgrade pip

RUN pip install -r requirements.txt
CMD ["python", "app.py"]