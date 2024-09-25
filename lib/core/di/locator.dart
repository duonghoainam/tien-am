import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() async {


  return await locator.allReady();
}