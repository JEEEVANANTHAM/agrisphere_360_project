#!/bin/bash

echo "🌱 Setting up AgriSphere 360 Environment..."
echo "--------------------------------------------"

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# 1. Flutter Dependencies
echo "\n📦 Installing Flutter dependencies..."
if command_exists flutter; then
  flutter pub get
  echo "✅ Flutter dependencies installed."
else
  echo "⚠️ Flutter not found in PATH. Please ensure Flutter is installed and added to your PATH."
  echo "   You can run: export PATH=\"\$PATH:/path/to/flutter/bin\""
fi

# 2. Firebase Cloud Functions Dependencies
echo "\n⚡ Installing Cloud Functions dependencies..."
if command_exists npm; then
  cd functions
  npm install
  cd ..
  echo "✅ Cloud Functions dependencies installed."
else
  echo "⚠️ npm (Node.js) not found in PATH. Please install Node.js (v18+) to deploy functions."
fi

# 3. Environment Configuration
echo "\n🔑 Checking Environment Configuration..."
if [ ! -f .env ]; then
  echo "⚠️ .env file missing. Creating template..."
  cat <<EOF > .env
GOOGLE_MAPS_API_KEY=YOUR_KEY
GEMINI_API_KEY=YOUR_KEY
SENTINEL_HUB_CLIENT_ID=YOUR_ID
SENTINEL_HUB_CLIENT_SECRET=YOUR_SECRET
EOF
  echo "✅ Created .env file. Please update it with your actual keys."
else
  echo "✅ .env file exists."
fi

echo "\n--------------------------------------------"
echo "🚀 Setup Complete! Next Steps:"
echo "1. Update .env with your API keys."
echo "2. Run 'firebase init' to link your project if not done."
echo "3. Run 'flutter run' to start the app."
