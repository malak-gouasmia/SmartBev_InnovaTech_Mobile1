import 'package:http/http.dart' as http;

class NotificationsAPI {
  Future<String> sendNotificationVol(
      String numero_serie_distributeur, String description) async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.1.4:8000/api/notification.management/notify-adm-am-of-vol-attempt'),
      // body: {
      //   'numero_serie_distributeur': numero_serie_distributeur,
      //   'description': description,
      // },
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
      return 'Notification sent successfully';
    } else {
      print('Notification not sent successfully');
      throw Exception('Failed to send notification');
    }
  }
}
