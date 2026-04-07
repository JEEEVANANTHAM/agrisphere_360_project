# AgriSphere 360 - Production-Ready Smart Agriculture App

AgriSphere 360 is an enterprise-level precision farming platform built using Flutter and the Google Cloud/Firebase ecosystem. It provides farmers, agronomists, and admins with a comprehensive suite of tools for farm management, AI-driven advisory, and market intelligence.

## 🚀 Features

- **Precision Farming**: GPS boundary drawing and area calculation.
- **Satellite Monitoring**: NDVI health index and vegetation stress alerts.
- **AI-Driven Advisory**: Personalized crop insights powered by Google Gemini.
- **Disease Detection**: Image-based detection using Vertex AI.
- **Financial Analytics**: Tracking expenses, income, and profit/loss.
- **Market Intelligence**: Live mandi prices and trend predictions.
- **Offline Capability**: Local data caching for remote farming areas.
- **Enterprise Security**: Role-based access control via Firestore Security Rules.

## 🏗 Tech Stack

- **Frontend**: Flutter (Material 3, Clean Architecture, MVVM)
- **Backend**: Firebase Auth, Cloud Firestore, Firebase Storage
- **AI/ML**: Google Vertex AI, Gemini API
- **Cloud**: Google Cloud Run, Cloud Functions (Node.js 20)
- **Maps**: Google Maps SDK

## 📂 Project Structure

```
agrisphere_360/
├── lib/
│   ├── core/           # Core utilities, theme, and constants
│   ├── data/           # Data layer (models, repositories, data sources)
│   ├── domain/         # Domain layer (entities, repository interfaces, usecases)
│   ├── presentation/   # UI layer (pages, widgets, blocs)
│   └── main.dart       # App entry point
├── assets/             # Images, fonts, and lottie animations
├── firestore.rules     # Secure database rules
├── firebase.json       # Firebase configuration
└── pubspec.yaml        # Dependencies
```

## ⚙️ Setup & Deployment

1. **Clone the repository**
2. **Install Flutter**: Ensure you have the latest stable version of Flutter.
3. **Firebase Setup**:
   - Create a project on [Firebase Console](https://console.firebase.google.com/).
   - Enable Authentication (Email, Google).
   - Create a Firestore database and Storage bucket.
   - Run `firebase init` to link the project.
   - Deploy security rules: `firebase deploy --only firestore:rules`.
4. **Environment Config**:
   - Add your Gemini API key and Sentinel Hub credentials to `.env`.
5. **Run the app**:
   ```bash
   flutter pub get
   flutter run
   ```

## 🔐 Security

The application uses Role-Based Access Control (RBAC):
- **Farmer**: Manage own farms and view reports.
- **Agronomist**: View assigned farms and provide recommendations.
- **Admin**: System-wide analytics and user management.

## 📄 License
MIT License
