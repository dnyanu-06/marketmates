import 'dart:convert';
import 'package:http/http.dart' as http;

class LibreTranslationService {
  final String baseUrl = 'https://libretranslate.de/translate';

  Future<String> translateText(String text, String targetLanguage) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'q': text,
          'source': 'en', // Default is English
          'target': targetLanguage,
          'format': 'text',
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse['translatedText'] ?? 'Translation failed';
      } else {
        throw Exception('Failed to translate text');
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
