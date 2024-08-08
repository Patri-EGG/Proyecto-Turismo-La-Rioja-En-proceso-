#!/bin/bash
# Cambia el directorio al lugar donde se encuentra el notebook
cd "$(dirname "$0")"

# Agregar un mensaje al archivo de log para verificar la ejecución
echo "Script started at $(date)" >> cron.log

# Ejecuta el notebook y guarda el resultado en un archivo de salida
jupyter nbconvert --to notebook --execute daily-commit.ipynb --output output.ipynb

# Agregar un mensaje al archivo de log después de ejecutar el notebook
echo "Notebook executed at $(date)" >> cron.log

# Configurar Git
git config --global user.email "triciax1@gmail.com"
git config --global user.name "Patri-EGG"

# Añadir y hacer commit de los cambios
git add daily-commit.txt output.ipynb
git commit -m "Daily commit"

# Hacer push de los cambios a GitHub
git push

# Agregar un mensaje al archivo de log después de hacer push
echo "Changes pushed to GitHub at $(date)" >> cron.log


