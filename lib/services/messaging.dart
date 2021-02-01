import 'package:firebase_messaging/firebase_messaging.dart';

class Messaging {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static final Messaging _instance = Messaging();
  static Messaging get instance => _instance;

  void init() {
    _messaging.requestPermission();

    FirebaseMessaging.onMessage.listen((message) {
      print(message.toString());
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(message.toString());
    });

    _messaging.getToken().then((token) {
      print('FirebaseMessaging token: $token');
    });
  }

  Future<String> getToken() {
    return _messaging.getToken();
  }
}
