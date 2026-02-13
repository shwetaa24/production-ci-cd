# 🚀 Setup Guide: Flask CI/CD Template

To get this pipeline running in under 5 minutes, follow these steps:

### 1. Docker Hub Setup
1. Log in to [Docker Hub](https://hub.docker.com/).
2. Go to **Account Settings** > **Security** > **New Access Token**.
3. Generate a token named `GitHub-Actions-Token` and copy it.

### 2. GitHub Secrets Configuration
In your GitHub Repo, go to **Settings > Secrets and Variables > Actions** and add:
- `DOCKERHUB_USERNAME`: Your Docker Hub ID.
- `DOCKERHUB_TOKEN`: The token you just created.

### 3. Push to Main
Once secrets are added, any push to the `main` branch will trigger:
1. **Linting** (Code quality check)
2. **Unit Tests**
3. **Security Scan** (Trivy)
4. **Automated Build & Push** to Docker Hub.