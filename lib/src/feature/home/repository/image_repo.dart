import 'dart:convert';
import 'package:flutter_riverpod_base/src/models/image.dart';
import 'package:flutter_riverpod_base/src/utils/credentials.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://pixabay.com/api/';

  Future<List<ImageModel>> fetchImages(int page) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl?key=${Credentials.pixabayApiKey}&image_type=photo&pretty=true&page=$page'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<ImageModel> images = (data['hits'] as List)
          .map((item) => ImageModel.fromJson(item))
          .toList();
      return images;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
