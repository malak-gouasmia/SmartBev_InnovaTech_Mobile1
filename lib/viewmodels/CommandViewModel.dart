import 'package:mobile_1/services/CommandsService.dart';

import '../models/CommandModel.dart';

class CommandViewModel {
  late Command _command;
  late String errorMessage;

  Future<int?> createCommand(Command command) async {
    try {
      final commandId = await CommandsAPI.createCommand(command);

      return commandId;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCommandById(int id) async {
    try {
      final command = await CommandsAPI.getCommandById(id);

      return command;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    }
  }

  Future<String?> getCommandInstructions(int id_cmd) async {
    try {
    
      final instructions = await CommandsAPI.getCommandInstructions(id_cmd);
   
      return instructions;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    }
  }
}
