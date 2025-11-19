#!/bin/bash

NC="\033[0m"             
RED="\033[38;5;203m"     
GREEN="\033[38;5;114m"  
YELLOW="\033[38;5;180m"  
BLUE="\033[38;5;75m"     
MAGENTA="\033[38;5;139m"
CYAN="\033[38;5;73m"     
WHITE="\033[38;5;255m"   

echo -e "${BLUE}============================================================${NC}"
echo -e "${CYAN}         MACHINE LEARNING DEVELOPMENT KIT  ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo -e "${MAGENTA}         💻  Environment Setup  💻${NC}"
echo ""

echo -e "${BLUE}------------------------------------------------------------"
echo -e "[1/9] Installing Python, pip, and venv"
echo -e "------------------------------------------------------------${NC}"

if command -v python3 >/dev/null 2>&1; then
    echo -e "${GREEN}✔ Python is already installed.${NC}"
    echo -e "${WHITE}Python version:${NC} $(python3 --version)"
else
    echo -e "${RED}✖ Python not found. Installing...${NC}"
    sudo apt update && sudo apt install -y python3 || {
        echo -e "${RED}❌ Python installation failed.${NC}"
        exit 1
    }
fi

if command -v pip3 >/dev/null 2>&1; then
    echo -e "${GREEN}✔ pip is already installed.${NC}"
else
    echo -e "${YELLOW}⚠ pip not found. Installing...${NC}"
    sudo apt install -y python3-pip || {
        echo -e "${RED}❌ pip installation failed.${NC}"
        exit 1
    }
fi

if python3 -m venv --help >/dev/null 2>&1; then
    echo -e "${GREEN}✔ python3-venv is installed.${NC}"
else
    echo -e "${YELLOW}⚠ python3-venv missing. Installing...${NC}"
    sudo apt install -y python3.12-venv || {
        echo -e "${RED}❌ python3-venv installation failed.${NC}"
        exit 1
    }
fi

echo ""

echo -e "${BLUE}------------------------------------------------------------"
echo -e "[2/9] Creating Python Virtual Environment"
echo -e "------------------------------------------------------------${NC}"

read -p "$(echo -e "${WHITE}Enter full path for virtual environment:${NC} ")" VENV_PATH

if [ -z "$VENV_PATH" ]; then
    echo -e "${RED}❌ ERROR: Path cannot be empty.${NC}"
    exit 1
fi

PARENT_DIR=$(dirname "$VENV_PATH")

if [ ! -d "$PARENT_DIR" ]; then
    echo -e "${RED}❌ ERROR: Parent directory does not exist.${NC}"
    exit 1
fi

create_venv() {
    echo -e "${CYAN}→ Creating virtual environment...${NC}"
    if python3 -m venv "$VENV_PATH"; then
        echo -e "${GREEN}✔ Virtual environment created.${NC}"
    else
        echo -e "${YELLOW}⚠ Attempting to fix venv creation...${NC}"
        sudo apt install -y python3.12-venv
        python3 -m venv "$VENV_PATH" || {
            echo -e "${RED}❌ Failed to create virtual environment.${NC}"
            exit 1
        }
    fi
}

if [ -d "$VENV_PATH" ]; then
    if [ ! -f "$VENV_PATH/bin/activate" ]; then
        echo -e "${YELLOW}⚠ Existing folder is not a valid venv. Recreating...${NC}"
        rm -rf "$VENV_PATH"
        create_venv
    else
        echo -e "${GREEN}✔ Valid virtual environment detected.${NC}"
    fi
else
    create_venv
fi

echo -e "${BLUE}→ Activating virtual environment...${NC}"
source "$VENV_PATH/bin/activate" || {
    echo -e "${RED}❌ Could not activate virtual environment.${NC}"
    exit 1
}

echo -e "${CYAN}→ Upgrading pip...${NC}"
pip install --upgrade pip --break-system-packages 2>/dev/null || pip install --upgrade pip

echo -e "${GREEN}✔ Virtual environment is ready!${NC}"
echo ""

echo -e "${BLUE}------------------------------------------------------------"
echo -e "[3/9] Machine Learning Libraries"
echo -e "------------------------------------------------------------${NC}"

read -p "$(echo -e "${WHITE}Install core ML libraries (numpy, pandas, sklearn)? [Y/n]: ${NC}")" ML
if [[ "$ML" =~ ^[Yy]$ || -z "$ML" ]]; then
    echo -e "${CYAN}→ Installing core ML libraries...${NC}"
    pip install numpy pandas matplotlib seaborn scikit-learn scipy || {
        echo -e "${RED}❌ Failed to install ML libraries.${NC}"
        exit 1
    }
fi

read -p "$(echo -e "${WHITE}Install Jupyter Notebook & Lab? [Y/n]: ${NC}")" JP
if [[ "$JP" =~ ^[Yy]$ || -z "$JP" ]]; then
    echo -e "${CYAN}→ Installing Jupyter...${NC}"
    pip install notebook jupyterlab || {
        echo -e "${RED}❌ Failed to install Jupyter.${NC}"
        exit 1
    }
    echo -e "${GREEN}✔ Jupyter installed.${NC}"
fi

read -p "$(echo -e "${WHITE}Install Git? [Y/n]: ${NC}")" GT
if [[ "$GT" =~ ^[Yy]$ || -z "$GT" ]]; then
    echo -e "${CYAN}→ Installing Git...${NC}"
    sudo apt install -y git
    echo -e "${GREEN}✔ Git installed.${NC}"
fi

read -p "$(echo -e "${WHITE}Install Visual Studio Code? [Y/n]: ${NC}")" VC
if [[ "$VC" =~ ^[Yy]$ || -z "$VC" ]]; then
    echo -e "${CYAN}→ Installing VS Code...${NC}"
    sudo apt install -y wget gpg apt-transport-https
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc |
        gpg --dearmor |
        sudo tee /usr/share/keyrings/ms_vscode_key.gpg >/dev/null
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms_vscode_key.gpg] \
https://packages.microsoft.com/repos/vscode stable main" |
        sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null

    sudo apt update
    sudo apt install -y code
    echo -e "${GREEN}✔ VS Code installed.${NC}"
fi

echo ""
echo -e "${GREEN}============================================================"
echo -e "           Setup Completed Successfully! "
echo -e "============================================================${NC}"
echo ""
