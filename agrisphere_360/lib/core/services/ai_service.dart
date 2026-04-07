import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logger/logger.dart';

class AiService {
  late final GenerativeModel? _model;
  final Logger _logger = Logger();
  bool _isInitialized = false;

  AiService() {
    _init();
  }

  void _init() {
    try {
      final apiKey = dotenv.env['GEMINI_API_KEY'];
      if (apiKey == null || apiKey.isEmpty) {
        _logger.w('GEMINI_API_KEY not found in .env');
        return;
      }
      _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
      _isInitialized = true;
    } catch (e) {
      _logger.e('Failed to initialize AI Service: $e');
    }
  }

  Future<String> ask(String prompt) async {
    if (!_isInitialized || _model == null) {
      return "AI Service is not initialized. Please check your API key.";
    }

    try {
      final content = [Content.text(prompt)];
      final response = await _model!.generateContent(content);
      return response.text ?? "I couldn't generate a response.";
    } catch (e) {
      _logger.e('Error generating content: $e');
      return "Sorry, I encountered an error: $e";
    }
  }

  Future<String> getCropAdvice(String crop, String problem) async {
    final prompt = "I am a farmer growing $crop. I am facing this problem: $problem. "
        "Please provide a short, actionable advice.";
    return ask(prompt);
  }
}
