import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tien_am/core/app_log.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/navigation/router.dart';
import 'package:tien_am/core/ui/styles/styles.dart';


void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      runApp(
        const ProviderScope(
          child: MainApp(),
        ),
      );
    },
    (error, stack) {
      AppLog.error(error);
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (err) => AppStrings.errRequiredField,
        ValidationMessage.email: (err)=> AppStrings.errEmailField,
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        routerConfig: appRouter,
        theme: AppThemes.light(),
        darkTheme: AppThemes.dark(),
      ),
    );
  }
}
