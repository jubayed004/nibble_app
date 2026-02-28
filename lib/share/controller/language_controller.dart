import 'dart:convert';
import 'package:flutter/services.dart';
// Note: We're removing Get, but maintaining the static layout for translations for now.
import 'package:nibble_app/share/model/language_model.dart';
import 'package:nibble_app/utils/config/app_config.dart';

class LanguageController {
  static Future<Map<String, Map<String, String>>> getLanguages() async {
    Map<String, Map<String, String>> languages = {};
    for (LanguageModel languageModel in AppConfig.languages) {
      String jsonStringValues = await rootBundle.loadString(
        'assets/languages/${languageModel.languageCode}.json',
      );
      Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
      Map<String, String> json = {};
      mappedJson.forEach((key, value) {
        json[key] = value.toString();
      });
      languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
          json;
    }

    return languages;
  }
}

// Translations logic need to be handled either without Get or using standard localization techniques
// We'll leave the Messages here, but GetMaterialApp.translations won't be used soon.
// You'll likely need to use `flutter_localizations` moving forward.
class Messages {
  final Map<String, Map<String, String>>? languages;
  Messages({required this.languages});

  Map<String, Map<String, String>> get keys {
    return languages ?? {};
  }
}
