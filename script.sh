#!/bin/bash

imagen = "$1"
diccionario="$2"

while IFS= read -r password; do
  echo "Probando contrasena: $password" 
  steghide extract -sf "$imagen" -p "$password" &>/dev/null
  if [ $? -eq 0]; then
    echo "Extraccion exitosa con contraseña: $password¨
    exit 0
  fi
done < "$diccionario"

echo "No se pudo extraer el arachivo oculto. Se probaron todas las contraseñas."
exit 1
