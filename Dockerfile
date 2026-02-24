# Use a slim version for smaller image size (Security + Speed)
FROM python:3.11-slim

WORKDIR /app

# Copy and install dependencies first for better caching
COPY requirements.txt .
# Mam's Point 2.1: Removed the tutorial comment
RUN pip install --no-cache-dir -r requirements.txt

# Security updates
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

COPY . .

# Run as non-root user for security
RUN useradd -m myuser

# Mam's Point 2.2: Added EXPOSE to document the listening port
EXPOSE 5000

USER myuser

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]