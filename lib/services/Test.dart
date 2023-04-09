import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/DrinkModel.dart';

class TestAPI {


  
  Future<List<DrinkModel>> getDrinks() async {
    //  String response = await rootBundle.loadString('data/data.json');

    // var data = await json.decode(response);

    List<DrinkModel> list = [];

    Map<String, dynamic> map1 = {
      "id": 1,
      "title": "Cappuccino",
      "description":
          "Un cappuccino contient des portions égales d'expresso, de lait chauffé à la vapeur et de mousse de lait. La tasse d'un cappuccino est plus petite que celle d'un latte, généralement entre 150 et 180 ml.",
      "price": "50",
      "image": "assets/images/coffee0.jpg",
      "ingredients": "chocolat"
    };
    list.add(DrinkModel.fromJson(map1));

    Map<String, dynamic> map2 = {
      "id": 2,
      "title": "Chocolat au lait",
      "description":
          "Un cappuccino contient des portions égales d'expresso, de lait chauffé à la vapeur et de mousse de lait. La tasse d'un cappuccino est plus petite que celle d'un latte, généralement entre 150 et 180 ml.",
      "price": "35",
      "image": "assets/images/coffee1.jpg",
      "ingredients": "chocolat"
    };
    list.add(DrinkModel.fromJson(map2));

    Map<String, dynamic> map3 = {
      "id": 3,
      "title": "Chocolat au lait",
      "description":
          "Un cappuccino contient des portions égales d'expresso, de lait chauffé à la vapeur et de mousse de lait. La tasse d'un cappuccino est plus petite que celle d'un latte, généralement entre 150 et 180 ml.",
      "price": "25",
      "image": "assets/images/coffee2.jpg",
      "ingredients": "chocolat+lait"
    };
    list.add(DrinkModel.fromJson(map3));

    Map<String, dynamic> map4 = {
      "id": 2,
      "title": "Chocolat au lait",
      "description":
          "Un cappuccino contient des portions égales d'expresso, de lait chauffé à la vapeur et de mousse de lait. La tasse d'un cappuccino est plus petite que celle d'un latte, généralement entre 150 et 180 ml.",
      "price": "65",
      "image": "assets/images/coffee3.jpg",
      "ingredients": "chocolat+cacao"
    };
    list.add(DrinkModel.fromJson(map4));

    return list;
  }
}
