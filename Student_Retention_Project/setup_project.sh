#!/bin/bash

# Define Project Name
PROJECT_NAME="StudentRetentionApp"

echo "🚀 Starting project setup for '$PROJECT_NAME'..."

# 1. Create Root Directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# 2. Create Backend Structure
echo "📂 Creating Backend structure..."
mkdir -p backend/artifacts
mkdir -p backend/schemas

# Create Backend Files
touch backend/main.py
touch backend/database.py
touch backend/models.py
touch backend/ai_service.py
# Create an empty init file to make it a package
touch backend/__init__.py 

# 3. Create Frontend Structure
echo "📂 Creating Frontend structure..."
mkdir -p frontend/src/components

# Create Frontend Files
touch frontend/src/App.js
touch frontend/src/index.js
touch frontend/src/components/PredictionForm.jsx
touch frontend/src/components/AdminDashboard.jsx
touch frontend/package.json

# 4. Create Root Configuration Files
echo "📄 Creating configuration files..."

# Create requirements.txt from your provided list
cat <<EOT >> requirements.txt
fastapi
uvicorn
sqlalchemy
python-multipart
pydantic
scikit-learn
tensorflow
joblib
EOT

# Create .gitignore from your provided list
cat <<EOT >> .gitignore
# Backend (Python)
backend/venv/
__pycache__/
*.pyc
*.pyo
*.pyd
*.db

backend/artifacts/
*.joblib
*.keras

# Frontend (Node/React)
frontend/node_modules/
frontend/build/
frontend/.env

# General
.DS_Store
.env
*.log
EOT

# Create a placeholder Dockerfile
cat <<EOT >> Dockerfile
# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy backend code
COPY backend/ ./backend/

# Expose port
EXPOSE 8000

# Run command
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
EOT

# Create README.md
cat <<EOT >> README.md
# Student Retention MVC Web App

A collaborative web application for predicting student retention using machine learning.

## Structure
- **backend/**: FastAPI app & Machine Learning logic
- **frontend/**: React User Interface
- **artifacts/**: Where your trained .keras models go

## Quick Start
1. Install dependencies: \`pip install -r requirements.txt\`
2. Run backend: \`uvicorn backend.main:app --reload\`
EOT

echo "✅ Project '$PROJECT_NAME' created successfully!"
echo "👉 Next Steps:"
echo "   1. Copy your 'student_retention_model.keras', 'scaler.joblib', and 'model_features.json' into '$PROJECT_NAME/backend/artifacts/'"
echo "   2. Open the folder in VS Code: 'code $PROJECT_NAME'"