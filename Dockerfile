# Use a slim version for smaller image size (Security + Speed)
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
# Run as non-root user for security
RUN useradd -m myuser
USER myuser
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
