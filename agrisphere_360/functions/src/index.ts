import { onSchedule } from "firebase-functions/v2/scheduler";
import { onCall, HttpsError } from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";
import * as admin from "firebase-admin";

admin.initializeApp();

/**
 * Scheduled function to sync weather data for all active farms daily.
 */
export const syncDailyWeather = onSchedule("0 6 * * *", async (event) => {
  const farms = await admin.firestore().collection("farms").where("status", "==", "active").get();
  
  for (const farm of farms.docs) {
    // Call Weather API and update Firestore
    logger.info(`Syncing weather for farm: ${farm.id}`);
    // implementation details here
  }
});

/**
 * Function to analyze crop image for diseases using Vertex AI.
 */
export const analyzeCropDisease = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "User must be logged in.");
  }

  const { imageUrl, cropType } = request.data;
  
  // Implementation for Vertex AI call
  return {
    disease: "Yellow Rust",
    confidence: 0.95,
    severity: "Moderate",
    recommendation: "Apply Propiconazole 25% EC."
  };
});
