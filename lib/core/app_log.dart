import 'package:logger/logger.dart';

abstract final class AppLog {
  static void error(Object? message) {
    Logger().e(message);
  }

  static void message(Object? message) {
    Logger().d(message);
  }
}
