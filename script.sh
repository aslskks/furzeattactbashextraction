#!/bin/bash

imagen="$1"
diccionario="$2"

while IFS= read -r password; do
  echo "Probando contraseña: $password"
  steghide extract -sf "$imagen" -p "$password" &>/dev/null
  if [ $? -eq 0 ]; then
    echo "Extracción exitosa con contraseña: $password"
    exit 0
  fi
done < "$diccionario"

echo "No se pudo extraer el archivo oculto. Se probaron todas las contraseñas."
exit 1
