import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'core/navigation/routes.dart';

void main() {
  runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      // await setupLocator();
      //
      // await Firebase.initializeApp(
      //     options: DefaultFirebaseOptions.currentPlatform);
      // //Start Init Notification
      // await FirebaseMessaging.instance.requestPermission();
      //
      // final token = await FirebaseMessaging.instance.getToken();
      // print(token.toString());
      // AppLog.warning(token.toString());
      //
      // final appNoti = AppNotificationService();
      // await appNoti.init();
      // FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
      // FirebaseMessaging.onMessageOpenedApp.listen((event) {
      //   appNoti.sendLocalNotification(
      //       title: event.notification?.title ?? '',
      //       description: event.notification?.body ?? '');
      //   locator<LocalService>().setNoti(event.notification?.body ?? '');
      // });
      // // await appNoti.sendLocalNotification(title: 'title', description: 'description');
      // FirebaseMessaging.onMessage.listen((event) {
      //   appNoti.sendLocalNotification(
      //       title: event.notification?.title ?? '',
      //       description: event.notification?.body ?? '');
      //   locator<LocalService>().setNoti(event.notification?.body ?? '');
      // });
      // FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
      //End Init Notification
      runApp(const ProviderScope(child: MyApp()));
    },
        (error, stack) {
      // AppLog.error(error);
      // AppLog.error(stack);
    },
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field must not be empty',
        ValidationMessage.email: (error) => 'Must enter a valid email',
        ValidationMessage.minLength: (error) =>
        'Must enter at least ${(error as Map)['requiredLength']} character long'
      },
      child: MaterialApp.router(
        routerConfig: routes,
        debugShowCheckedModeBanner: false,
        // title: AppString.app_title,
        // theme: AppTheme.main,
      ),
    );
  }
}

