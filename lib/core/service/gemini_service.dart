import 'package:flutter/cupertino.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  static const String _apiKey = "AIzaSyA_DTCuIGKOvYphlVRATSPOPEsGEq1J9K4";

  GeminiService() {
    Gemini.init(apiKey: _apiKey);
  }

  Future<String> generateLocalizedData({
    required Map<String, dynamic> localizedData,
  }) async {
    String prompt = "";
    if (localizedData.isNotEmpty) {
      prompt = "Update the data with missing localized values $localizedData";
    }
    try {
      final Candidates? response = await Gemini.instance.prompt(
        parts: [Part.text(prompt)],
      );
      String result = response?.output ?? "gemini API not working";
      debugPrint("result : $result");
      return result;
    } catch (error) {
      return "Error generating task reminder. Stay productive!";
    }
  }
}
