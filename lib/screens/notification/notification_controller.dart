import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationController {
  NotificationController._sharedInstance();
  static final NotificationController _shared =
      NotificationController._sharedInstance();
  factory NotificationController({required SharedPreferences prefs}) {
    _shared.pref = prefs;
    _shared.initializeNotifications();
    return _shared;
  }

  late SharedPreferences pref;
  PushNotification pushNotification = PushNotification();
  LocalNotification localNotification = LocalNotification();

  initializeNotifications() async {
    await pushNotification.initialize(pref);
    await localNotification.initialize(pref);
    pushNotification.setForegroundListener(
        localNotification: localNotification);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class PushNotification {
  FirebaseMessaging? messaging;
  SharedPreferences? pref;

  initialize(SharedPreferences prefs) async {
    messaging = FirebaseMessaging.instance;
    pref = prefs;
    NotificationSettings settings = await messaging!.requestPermission(
      alert: true,
      badge: true,
      criticalAlert: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      messaging?.getInitialMessage();
      await saveFcmToken();
      await setTokenListener();
    } else {
      log('### User permission status: ${settings.authorizationStatus}');
    }
  }

  setForegroundListener({required LocalNotification localNotification}) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // *** Handle the message notification!
      log("##User just got a notification!");
      if (message.notification != null) {
        localNotification.showPushedNotification(message);
      }
    });
  }

  saveFcmToken({String? sendedToken}) async {
    String token = sendedToken ?? await messaging?.getToken() ?? "";
    log("##FCM token: $token");
    pref!.setString("fcmToken", token);
    // *** Other server uploading methods!
  }

  setTokenListener() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
      await saveFcmToken(sendedToken: fcmToken);
    }).onError((err) {
      // Error getting token.
      err.printError();
    });
  }

  setClickListener() async {
    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      
    });
  }
}

class LocalNotification {
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  NotificationDetails? currentNotificationDetail;
  SharedPreferences? pref;
  int _notificationCount = 0;

  int getNotificationCount() => _notificationCount;
  setCount(int orderId) {
    _notificationCount = orderId;
    pref!.setInt("OrderId", _notificationCount);
  }

  int useCount() {
    int id = _notificationCount;
    setCount(id++);
    return id;
  }

  initialize(SharedPreferences prefs) {
    pref = prefs;
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSetting = IOSInitializationSettings();
    setImportantNotification();
    const initializationsSettings =
        InitializationSettings(android: androidSetting, iOS: iosSetting);
    flutterLocalNotificationsPlugin!.initialize(
      initializationsSettings,
      onSelectNotification: (payload) {
        //*** This is where you check the payload and do the work when the app is in the foreground!
        log("##Clicked!");
      },
    );
    _notificationCount = pref!.getInt("orderId") ?? 0;
  }

  setImportantNotification() {
    currentNotificationDetail = NotificationDetails(
      android: AndroidNotificationDetails(
        'com.cfpc.olga',
        'Olga',
        number: _notificationCount,
        playSound: true,
        importance: Importance.max,
        priority: Priority.max,
      ),
      iOS: IOSNotificationDetails(
        badgeNumber: _notificationCount,
        presentBadge: true,
        presentAlert: true,
      ),
    );
  }

  showTextNotification(String title, String body, String? payload) async {
    await flutterLocalNotificationsPlugin!.show(
      useCount(),
      title,
      body,
      currentNotificationDetail,
      payload: payload ?? "",
    );
  }

  showPushedNotification(RemoteMessage pushedNotification) async {
    if (pushedNotification.notification?.title != null) {
      await showTextNotification(pushedNotification.notification!.title!,
          pushedNotification.notification!.body!, null);
    } else {
      //* Manage Data *//
    }
  }
}
