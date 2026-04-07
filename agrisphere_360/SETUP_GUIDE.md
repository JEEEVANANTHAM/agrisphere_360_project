# 🚀 AgriSphere 360 Setup Guide

Since automated setup encountered environment issues, please follow these manual steps to finalize your development environment.

## 1. Environment Variables & PATH
Ensure `flutter` and `npm` are in your system PATH.
Add the following to your `~/.zshrc` or `~/.bash_profile` if not already present:
```bash
export PATH="$PATH:[path-to-flutter-sdk]/bin"
export PATH="$PATH:/usr/local/bin/npm" # Verify npm path
```
Reload your shell: `source ~/.zshrc`.

## 2. Install Dependencies
Run the following commands in your terminal from the project root (`agrisphere_360/`):

### Flutter
```bash
flutter pub get
```

### Cloud Functions (Node.js)
```bash
cd functions
npm install
cd ..
```

## 3. Firebase Configuration
1. **Initialize Firebase**:
   ```bash
   firebase login
   firebase init
   ```
   - Select: **Firestore**, **Functions**, **Storage**, **Emulators** (optional).
   - Use existing project ID or create new.
   - For Firestore rules, choose `firestore.rules`.
   - For Storage rules, choose `storage.rules`.

2. **Enable Vertex AI**:
   - ✅ **Completed**: I have already enabled the Vertex AI API for your project `agrisphere-360`.
   - You can verify this in the [Google Cloud Console](https://console.cloud.google.com/vertex-ai?project=agrisphere-360).

## 4. API Keys Setup
Update the `.env` file in the root directory with your keys:
- **Google Maps API Key**: Get fro  [Google Cloud Console > APIs > Credentials](https://console.cloud.google.com/apis/credentials).
- **Gemini API Key**: Get from [Google AI Studio](https://makersuite.google.com/).
- **Sentinel Hub**: Register at [Sentinel Hub](https://www.sentinel-hub.com/) for satellite data access.

## 5. Run the Application
```bash
flutter run
```
