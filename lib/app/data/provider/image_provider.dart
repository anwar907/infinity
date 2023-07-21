import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ImageProviders {
  Future<List<Uint8List>> fetchRandomImage() async {
    final List<Uint8List> imageUrl = [];
    final List<Future<http.Response>> request = List.generate(
        50,
        (index) =>
            http.get(Uri.parse('https://picsum.photos/200/300/?random')));

    final response = await Future.wait(request);

    for (var data in response) {
      if (data.statusCode == 200) {
        
        imageUrl.add(data.bodyBytes);
      } else {
        log('Failed to load image. Status code: ${data.statusCode}');
      }
    }

    return imageUrl;
  }
}
