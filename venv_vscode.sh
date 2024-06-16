#!/bin/bash

# ~/Desktop/Obsidian-1.4.16-arm64.AppImage &&
echo "Complete Machine Learning NLP Bootcamp MLOPS and Deployment by KRISH NAIK via UDEMY"
echo "------------$OSTYPE------------"
read -p "Press Enter to continue..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" =="win32" ]]; then
    echo "Activating VENV on windows machine"
    . ./venv/Scripts/activate
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Activating VENV on linux machine"
    . ./venv/bin/activate
else
    echo "Unsupported OS : $OSTYPE"
fi

code .
