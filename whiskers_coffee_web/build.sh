#!/bin/bash

# Salir inmediatamente si un comando falla
set -e

FLUTTER_VERSION="3.16.9" # ¡Importante! Cambia esto a tu versión de Flutter
FLUTTER_CHANNEL="stable" # O "beta", "dev" si usas otra

# Directorio donde se instalará el SDK de Flutter
FLUTTER_SDK_DIR="$HOME/flutter_sdk"

echo "--- Iniciando el proceso de build de Flutter para Vercel ---"

# Descargar o clonar el SDK de Flutter
if [ ! -d "$FLUTTER_SDK_DIR" ]; then
    echo "Clonando el SDK de Flutter versión $FLUTTER_VERSION en el canal $FLUTTER_CHANNEL..."
    git clone https://github.com/flutter/flutter.git "$FLUTTER_SDK_DIR" --depth 1 -b "$FLUTTER_CHANNEL"
else
    echo "El directorio del SDK de Flutter ya existe. Saltando clonación."
fi

# Añadir Flutter al PATH para la ejecución de este script
export PATH="$FLUTTER_SDK_DIR/bin:$PATH"

# Cambiar a la versión específica de Flutter
# NOTA: si ya clonaste por rama, esto puede no ser estrictamente necesario,
# pero asegura que estamos en la versión correcta.
cd "$FLUTTER_SDK_DIR"
git checkout $FLUTTER_VERSION
flutter doctor # Opcional: para verificar la instalación
cd - # Volver al directorio original del proyecto

echo "--- Versión de Flutter en uso: ---"
flutter --version

echo "--- Obteniendo dependencias de Flutter (flutter pub get) ---"
flutter pub get

echo "--- Construyendo la aplicación web de Flutter (flutter build web) ---"
flutter build web --release # Siempre usa --release para producción

echo "--- ¡Build de Flutter Web completado! ---"