#!/bin/bash

# Configuration and Environment Setup
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🌱 Starting AgriSphere 360 Environment Setup...${NC}"

# Try to find Flutter in common locations if not in PATH
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

# Check for Flutter again
if ! command -v flutter &> /dev/null; then
  echo -e "${RED}❌ Flutter could not be found automatically.${NC}"
  echo -e "Please locate your Flutter SDK installation folder."
  read -p "👉 Drag and drop your 'flutter' folder here (or type the path): " FLUTTER_PATH
  # Remove quotes if dragged and dropped
  FLUTTER_PATH="${FLUTTER_PATH%\"}"
  FLUTTER_PATH="${FLUTTER_PATH#\"}"
  # Check if bin exists in path
  if [ -d "$FLUTTER_PATH/bin" ]; then
    export PATH="$PATH:$FLUTTER_PATH/bin"
    echo -e "${GREEN}✅ Added Flutter to PATH: $FLUTTER_PATH/bin${NC}"
  elif [ -d "$FLUTTER_PATH" ] && [[ "$FLUTTER_PATH" == */bin ]]; then
     export PATH="$PATH:$FLUTTER_PATH"
     echo -e "${GREEN}✅ Added Flutter to PATH: $FLUTTER_PATH${NC}"
  else
    echo -e "${RED}❌ Could not find 'bin' directory in provided path. Exiting.${NC}"
    exit 1
  fi
fi

if ! command -v flutter &> /dev/null; then
   echo -e "${RED}❌ Still cannot run flutter. Please check your installation.${NC}"
   exit 1
fi

echo -e "${GREEN}✅ Flutter found: $(which flutter)${NC}"

# Check for Node.js/NPM (for Cloud Functions)
if ! command -v npm &> /dev/null; then
    echo "⚠️ npm (Node.js) not found. Checking alternate locations..."
    COMMON_NPM_PATHS=(
        "/usr/local/bin"
        "/opt/homebrew/bin"
        "$HOME/.nvm/versions/node/*/bin" # This requires finding the specific version dir
    )
    # Simple check for brew or local bin
    if [ -f "/usr/local/bin/npm" ]; then
        export PATH="$PATH:/usr/local/bin"
    elif [ -f "/opt/homebrew/bin/npm" ]; then
        export PATH="$PATH:/opt/homebrew/bin"
    fi
fi

if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm (Node.js) not found. Cloud Functions deployment will be skipped.${NC}"
else
    echo -e "${GREEN}✅ npm found: $(which npm)${NC}"
    echo "📦 Installing Cloud Functions dependencies..."
    cd "$PROJECT_DIR/functions"
    npm install
    cd "$PROJECT_DIR"
fi


echo -e "\n📦 Installing Flutter dependencies..."
flutter pub get

# Check if .env exists
if [ ! -f "$PROJECT_DIR/.env" ]; then
    echo -e "${RED}⚠️ .env file missing. Creating template...${NC}"
    cat <<EOF > .env
GOOGLE_MAPS_API_KEY=YOUR_KEY
GEMINI_API_KEY=YOUR_KEY
SENTINEL_HUB_CLIENT_ID=YOUR_ID
SENTINEL_HUB_CLIENT_SECRET=YOUR_SECRET
FIREBASE_PROJECT_ID=agrisphere-360
EOF
    echo "✅ Created .env. Please open it and add your API keys!"
fi

echo -e "\n${GREEN}🚀 Setup Complete! You can now run the app with:${NC}"
echo "flutter run"

# Ask to run immediately
read -p "Do you want to run the app now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    flutter run
fi
