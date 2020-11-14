import 'package:firebase_messaging/firebase_messaging.dart';

class Messaging {
  static final FirebaseMessaging _messaging = FirebaseMessaging();

  static final Messaging _instance = Messaging();
  static Messaging get instance => _instance;

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
