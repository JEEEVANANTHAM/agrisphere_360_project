#!/bin/bash

# Configuration and Environment Setup
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Deploying AgriSphere 360 to Firebase Hosting (Free)...${NC}"

# Find Flutter (Similar logic to run_agrisphere.sh)
if ! command -v flutter &> /dev/null; then
  echo "⚠️ Flutter not found in standard PATH. Searching alternate locations..."
  COMMON_PATHS=(
    "$HOME/flutter/bin"
    "$HOME/development/flutter/bin"
    "/opt/flutter/bin"
    "/Applications/flutter/bin"
    "$HOME/Downloads/flutter/bin"
    "$HOME/Documents/flutter/bin"
  )
  for path in "${COMMON_PATHS[@]}"; do
    if [ -f "$path/flutter" ]; then
      export PATH="$PATH:$path"
      echo -e "${GREEN}✅ Found Flutter at $path${NC}"
      break
    fi
  done
fi

if ! command -v flutter &> /dev/null; then
  echo -e "${RED}❌ Flutter could not be found automatically.${NC}"
  read -p "👉 Drag and drop your 'flutter' folder here (or type the path): " FLUTTER_PATH
  FLUTTER_PATH="${FLUTTER_PATH%\"}"
  FLUTTER_PATH="${FLUTTER_PATH#\"}"
  if [ -d "$FLUTTER_PATH/bin" ]; then
    export PATH="$PATH:$FLUTTER_PATH/bin"
  elif [ -d "$FLUTTER_PATH" ] && [[ "$FLUTTER_PATH" == */bin ]]; then
     export PATH="$PATH:$FLUTTER_PATH"
  else
    echo -e "${RED}❌ Could not find 'bin' directory. Exiting.${NC}"
    exit 1
  fi
fi

# Check for Firebase CLI
if ! command -v firebase &> /dev/null; then
    echo -e "${RED}❌ Firebase CLI not found.${NC}"
    echo "Please install it by running: npm install -g firebase-tools"
    exit 1
fi

echo -e "\n📦 Building Flutter Web App (Release Mode)..."
flutter build web --release --wasm

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Build failed!${NC}"
    exit 1
fi

echo -e "\n🔥 Deploying to Firebase Hosting..."
firebase deploy --only hosting

if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}✅ Deployment Successful!${NC}"
    echo "Your app is now live on the URL provided above."
else
    echo -e "${RED}❌ Deployment failed. Please check the logs.${NC}"
    echo "Ensure you are logged in using 'firebase login' and have initialized the project correctly."
fi
