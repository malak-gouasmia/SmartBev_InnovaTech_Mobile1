import 'package:mobile_1/services/CommandsService.dart';

import '../models/CommandModel.dart';

class PaymentViewModel {
  late String errorMessage;

  Future<bool> verifyPayement(int id_cmd) async {
   
    final Map<String, dynamic> command =
        await CommandsAPI.getCommandById(id_cmd);
    if (command["etat_cmd"] == "payée") {
      return true;
    } else {
      return false;
    }
  }
}
