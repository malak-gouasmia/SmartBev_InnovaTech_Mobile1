import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

import '../constant/constants.dart';
import '../models/CommandModel.dart';

class CommandsAPI {
  

  static Future<int> createCommand(Command command) async {
    final url = '$baseUrl/commandes';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(command.toJson()),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);

      return responseData['cmd_id'];
    } else {
      throw Exception('Failed to create command');
    }
  }

  static Future<Map<String, dynamic>> getCommandById(int id) async {
    final url = '$baseUrl/commandes/$id';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      // return Command.fromJson(responseData);
      return responseData;
    } else {
      throw Exception('Failed to get command');
    }
  }

  static Future<String> getCommandInstructions(int id) async {
    final url = '$baseUrl/commandes/$id/instructions';
    final response = await http.get(
      Uri.parse(url), 
      headers: {
        'Content-Type': 'application/json', 
      },
    );

    if (response.statusCode == 200) {
      final responseData = response.body;
      return responseData;
    } else {
      throw Exception('Failed to get command');
    }
  }
}
