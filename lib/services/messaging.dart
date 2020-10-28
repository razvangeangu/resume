import 'package:firebase_messaging/firebase_messaging.dart';

abstract class BaseMessaging {
  void init();

  Future<String> getToken();
}

class Messaging implements BaseMessaging {
  static final FirebaseMessaging _messaging = FirebaseMessaging();

  static final BaseMessaging _instance = Messaging();
  static BaseMessaging get instance => _instance;

  void init() {
    _messaging.requestNotificationPermissions();

    _messaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );

    _messaging.getToken().then((token) {
      print('FirebaseMessaging token: $token');
    });
  }

  Future<String> getToken() {
    return _messaging.getToken();
  }
}
