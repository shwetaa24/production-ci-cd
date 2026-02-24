FROM python:3.11-slim

WORKDIR /app

# Mam's point 2.2 & 3.1: Force update OS and core python tools to fix nested vulnerabilities
RUN apt-get update && apt-get upgrade -y && \
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m myuser
EXPOSE 5000
USER myuser

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]