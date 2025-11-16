# Developer-Tool-Kit

## CLONE THE REPO
```bash
git clone https://github.com/SaraJain90/Developer-Tool-Kit.git
cd Developer-Tool-Kit
```

## ADD to path
### ZSH
```bash
DIR="$(pwd)
echo 'export PATH="$PATH:'"$DIR"'"' >> ~/.zshrc
source ~/.zshrc
```
### BASH
```bash
DIR="$(pwd)
echo 'export PATH="$PATH:'"$DIR"'"' >> ~/.bashrc
source ~/.bashrc
```
## Setup gemini API Key
### BASH
```bash
echo 'export GEMINI_API_KEY="your api key here"' >> ~/.zshrc
source ~/.zshrc
```
### ZSH
```bash
echo 'export GEMINI_API_KEY="your api key here"' >> ~/.bashrc
source ~/.bashrc
```