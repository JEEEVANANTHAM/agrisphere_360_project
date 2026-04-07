---
description: How to obtain and configure API keys for AgriSphere 360
---

# 🔑 API Key Setup Workflow

This workflow guides you through obtaining the necessary API keys for AgriSphere 360.

## 1. Google Maps API Key
**URL**: [https://console.cloud.google.com/google/maps-apis/credentials](https://console.cloud.google.com/google/maps-apis/credentials)
1. Complete the "Welcome" setup if prompted.
2. Click **Create Credentials** -> **API Key**.
3. Copy the generated key.
4. Paste it into `.env` as `GOOGLE_MAPS_API_KEY`.

## 2. Google Gemini API Key
**URL**: [https://aistudio.google.com/app/apikey](https://aistudio.google.com/app/apikey)
1. Accept the terms of service if prompted.
2. Click **Create API Key**.
3. Select your Google Cloud project (or create a new one).
4. Copy the key.
5. Paste it into `.env` as `GEMINI_API_KEY`.

## 3. Sentinel Hub Credentials
**URL**: [https://apps.sentinel-hub.com/dashboard/#/account/settings](https://apps.sentinel-hub.com/dashboard/#/account/settings)
1. Log in or Sign up.
2. Go to **User Settings** -> **OAuth Clients**.
3. Create a new OAuth Client.
4. Copy the `Client ID` and `Client Secret`.
5. Paste them into `.env` as `SENTINEL_HUB_CLIENT_ID` and `SENTINEL_HUB_CLIENT_SECRET`.

## 4. Final Step
Once you have pasted all keys into your `.env` file, simply tell me "I have updated the keys", and I will proceed with the setup.
