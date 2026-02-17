# 🚀 Setup Guide: Flask CI/CD Template

To get this pipeline running in under 5 minutes, follow these steps:

---

### 1️⃣ Docker Hub Setup
1. Log in to [Docker Hub](https://hub.docker.com/).
2. Go to **Account Settings** > **Security** > **New Access Token**.
3. Generate a token named `GitHub-Actions-Token` and **copy it immediately**.

### 2️⃣ GitHub Secrets Configuration
In your GitHub Repository, navigate to **Settings > Secrets and Variables > Actions** and click **New repository secret** for each of these:
- **DOCKERHUB_USERNAME**: Your Docker Hub ID.
- **DOCKERHUB_TOKEN**: The token you just created.

### 3️⃣ Trigger the Pipeline
Once secrets are added, any push to the `main` branch will automatically trigger the workflow:
1. **Linting**: Checks for code quality (flake8).
2. **Unit Tests**: Runs `pytest` to ensure app stability.
3. **Security Scan**: Uses **Trivy** to scan the Docker image for vulnerabilities.
4. **Build & Push**: Automates the push to your Docker Hub repository.

---

### 🛠️ Local Development (Manual Run)
If you want to run the app on your machine without Docker:
1. `python -m venv venv`
2. `source venv/bin/activate` (or `venv\Scripts\activate` on Windows)
3. `pip install -r requirements.txt`
4. `python app.py`

*Your app will be live at: **http://127.0.0.1:5000***

> **Note for Docker Users**: When running via Docker, the app uses **Gunicorn** for production-grade performance. Access it at the same address after running your `docker run` command.