// lib/services/openai_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIService {
  static final _apiKey = dotenv.env['OPENAI_API_KEY'];
  static const _endpoint = 'https://api.openai.com/v1/chat/completions';

  static Future<String> getChatResponse(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": "You are a friendly wellness coach helping users with mental well-being."},
            {"role": "user", "content": message},
          ]
        }),
      );

      final Map<String, dynamic> json = jsonDecode(response.body);
      return json['choices'][0]['message']['content'].trim();
    } catch (e) {
      return "Oops! Something went wrong. Please try again.";
    }
  }
}
