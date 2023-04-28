import 'package:mobile_1/services/NotificationsService.dart';

class NotificationsViewModel {
  Future<String> sendNotificationVol(
      String numero_serie_distributeur, String description) async {
    try {
      final message = await NotificationsAPI()
          .sendNotificationVol(numero_serie_distributeur, description);
      print(message);
      return message;
    } catch (e) {
      return e.toString();
    }
  }
}
