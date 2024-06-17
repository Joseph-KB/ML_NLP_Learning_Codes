#!/bin/bash

# ~/Desktop/Obsidian-1.4.16-arm64.AppImage &&
echo "Complete Machine Learning NLP Bootcamp MLOPS and Deployment by KRISH NAIK via UDEMY"
echo "-----OSTYPE-------$OSTYPE------------"

create_virtualenv(){
    echo "Creating Virtualenv PYTHON --VERSION 3.11"
    virtualenv venv -p "python3.11"
}

activate_venv_windows(){
    echo "Activating VENV on windows machine"
    source ./venv/Scripts/activate
}

activate_venv_linux(){
    echo "Activating VENV on linux machine"
    source ./venv/bin/activate
}

pip_install_requirements(){
    echo "Installing pip packeges from requirements.txt"
    pip install -r "requirements.txt" --upgrade-strategy=only-if-needed
}

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    if [[ ! -d "venv" ]]; then
        create_virtualenv
    fi
    activate_venv_windows
    pip_install_requirements

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ ! -d "venv" ]]; then
        create_virtualenv
    fi
    activate_venv_linux
    pip_install_requirements 

else
    echo "Unsupported OS : $OSTYPE"
    read -p "Only supported pip_install_requirementsWindows and Linux Press Enter to continue..."
fi

echo "Opening VS code"
code .
