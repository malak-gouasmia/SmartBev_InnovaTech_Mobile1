import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/DrinkModel.dart';

class DrinksAPI {
  static const baseUrl = 'http://192.168.1.4:8000';

  static Future<List<DrinkModel>> getAllDrinks() async {
    final url = '$baseUrl/drinks';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final drinksJson = jsonDecode(response.body)['data'] as List;
      List<DrinkModel> list = drinksJson
          .map((drinkJson) => DrinkModel.fromJson(drinkJson))
          .toList();

      return list;
    } else {
      throw Exception('Failed to fetch drinks');
    }
  }
}
