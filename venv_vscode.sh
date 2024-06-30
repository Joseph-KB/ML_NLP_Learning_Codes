#!/bin/bash

VIRTUALENV_FILE_NAME="venv"
PYTHON_VERSION="python3"

echo "Complete Machine Learning NLP Bootcamp MLOPS and Deployment by KRISH NAIK via UDEMY"
echo "-----OSTYPE-------$OSTYPE------------"

install_virtualenv(){
    echo "Pip installing virtualenv if not installed"
    pip install --user "virtualenv==20.26.2"
}

create_venv_windows(){
    echo "Creating Virtualenv --"$VIRTUALENV_FILE_NAME" PYTHON --VERSION $PYTHON_VERSION"
    python -m venv $VIRTUALENV_FILE_NAME -p "$PYTHON_VERSION"
}

create_venv_linux(){
    echo "Creating Virtualenv --"$VIRTUALENV_FILE_NAME" PYTHON --VERSION $PYTHON_VERSION"
    virtualenv $VIRTUALENV_FILE_NAME -p "$PYTHON_VERSION"
}

activate_venv_windows(){
    echo "Activating VENV on windows machine"
    source ./$VIRTUALENV_FILE_NAME/Scripts/activate
}

activate_venv_linux(){
    echo "Activating VENV on linux machine"
    source ./$VIRTUALENV_FILE_NAME/bin/activate
}

pip_install_requirements(){
    echo "Installing pip packeges from requirements.txt"
    pip install -r "requirements.txt" --upgrade-strategy=only-if-needed
}

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    if [[ ! -d "$VIRTUALENV_FILE_NAME" ]]; then
        install_virtualenv
        create_venv_windows
    fi
    activate_venv_windows
    pip_install_requirements

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ ! -d "$VIRTUALENV_FILE_NAME" ]]; then
        install_virtualenv
        create_venv_linux
    fi
    activate_venv_linux
    pip_install_requirements 

else
    echo "Unsupported OS : $OSTYPE"
    read -p "Only supported pip_install_requirementsWindows and Linux Press Enter to continue..."
fi

echo "Opening VS code"
code .
