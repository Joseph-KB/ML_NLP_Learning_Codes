#!/bin/bash

VIRTUALEN_FILE_NAME="venv"
PYTHON_VERSION="python3.11"

echo "Complete Machine Learning NLP Bootcamp MLOPS and Deployment by KRISH NAIK via UDEMY"
echo "-----OSTYPE-------$OSTYPE------------"

create_virtualenv(){
    echo "Pip installing virtualenv if not installed"
    pip install --user "virtualenv==20.26.2"
    echo "Creating Virtualenv PYTHON --VERSION $PYTHON_VERSION"
    virtualenv $VIRTUALEN_FILE_NAME -p "$PYTHON_VERSION"
}

activate_venv_windows(){
    echo "Activating VENV on windows machine"
    source ./$VIRTUALEN_FILE_NAME/Scripts/activate
}

activate_venv_linux(){
    echo "Activating VENV on linux machine"
    source ./$VIRTUALEN_FILE_NAME/bin/activate
}

pip_install_requirements(){
    echo "Installing pip packeges from requirements.txt"
    pip install -r "requirements.txt" --upgrade-strategy=only-if-needed
}

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    if [[ ! -d "$VIRTUALEN_FILE_NAME" ]]; then
        create_virtualenv
    fi
    activate_venv_windows
    pip_install_requirements

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ ! -d "$VIRTUALEN_FILE_NAME" ]]; then
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
