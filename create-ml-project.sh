#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: mlcreate <project_name>"
    exit 1
fi

PROJECT_NAME="$1"

echo "Creating ML project: $PROJECT_NAME"

# Create folder structure
mkdir -p "$PROJECT_NAME"/{data,notebooks,src,models,logs,results}

# Create virtual environment
python3 -m venv "$PROJECT_NAME/venv"

# Create .env template
cat <<EOF > "$PROJECT_NAME/.env"
# Add your environment variables here
EOF

# Create starter requirements.txt
cat <<EOF > "$PROJECT_NAME/requirements.txt"
numpy
pandas
matplotlib
scikit-learn
EOF

# Create project.json metadata
cat <<EOF > "$PROJECT_NAME/project.json"
{
  "name": "$PROJECT_NAME",
  "description": "Machine Learning project created using Developer-Tool-Kit",
  "created_on": "$(date +%Y-%m-%d)",
  "python_version": "$(python3 --version | awk '{print $2}')",
  "environment": "$PROJECT_NAME/venv",
  "toolkit_version": "1.0.0"
}
EOF

echo "Project created in: $(pwd)/$PROJECT_NAME"
echo "Activate the environment with:"
echo "  source $PROJECT_NAME/venv/bin/activate"
