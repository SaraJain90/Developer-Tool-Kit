
![bash](https://img.shields.io/badge/language-bash-orange)
![Platform](https://img.shields.io/badge/OS-Linux-blue)
![Version](https://img.shields.io/badge/Version-1.0.0-green)


# Developer-Tool-Kit

The Developer Tool Kit is a collection of five practical UNIX shell scripts designed
to simplify and automate daily tasks performed by developers. These tools aim to
improve productivity, reduce repetitive tasks, and enhance the command-line
workflow. Each script focuses on a specific real-world requirement—from interacting
with AI, to managing version control, organizing directory structures, setting up
environments, and maintaining personal task lists.

# USAGES

## setup - This will initialise venv.
```bash
setup
```

## gpt - AI Assistant in Terminal
```bash
gpt <prompt here>
```

## mytree - Directory Structure Viewer

```bash
mytree
```

## gish - Git Automation Script
```bash
gish
```

## todo – Lightweight To-Do Manager

```bash
  todo init
  todo "task message"
  todo display
  todo done <sequence>
```


## CLONE THE REPO
```bash
git clone https://github.com/SaraJain90/Developer-Tool-Kit.git
cd Developer-Tool-Kit
```
## INSTALL ZENITY
```bash
sudo apt install zenity
```


## ADD to path
### ZSH
```bash
DIR="$(pwd)"
echo 'export PATH="$PATH:'"$DIR"'"' >> ~/.zshrc
source ~/.zshrc
```
### BASH
```bash
DIR="$(pwd)"
echo 'export PATH="$PATH:'"$DIR"'"' >> ~/.bashrc
source ~/.bashrc
```
## Setup gemini API Key
### ZSH
```bash
echo 'export GEMINI_API_KEY="API"' >> ~/.zshrc
source ~/.zshrc
```
### BASH
```bash
echo 'export GEMINI_API_KEY="API"' >> ~/.bashrc
source ~/.bashrc
```
//for testing