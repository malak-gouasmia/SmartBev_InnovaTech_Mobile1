import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constant/constants.dart';
import '../models/DrinkModel.dart';

class DrinksAPI {
  static Future<List<DrinkModel>> getAllDrinks() async {
    final url = baseUrl+'/boissons';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final drinksJson = jsonDecode(response.body) as List;
      print(drinksJson);
      List<DrinkModel> list = drinksJson
          .map((drinkJson) => DrinkModel.fromJson(drinkJson))
          .toList();

      return list;
    } else {
      throw Exception('Failed to fetch drinks');
    }
  }
}
