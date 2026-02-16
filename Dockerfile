# Use a slim version for smaller image size (Security + Speed)
FROM python:3.11-slim

WORKDIR /app

# Copy and install dependencies first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt  # <--- ADD THIS LINE

# Security updates
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

COPY . .

# Run as non-root user for security
RUN useradd -m myuser
USER myuser

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]