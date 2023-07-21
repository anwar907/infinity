import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infinity/app/data/models/content_models.dart';

class ContentProvider {
  Future<TextDataModels> fetchDataContent() async {
    try {
      final response = await http
          .get(Uri.parse('https://baconipsum.com/api/?type=meat-and-filler'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return TextDataModels.fromJson(jsonData);
      } else {
        return Future.error(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
