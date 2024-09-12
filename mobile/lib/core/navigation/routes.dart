import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/signin/sign_in_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final _appKey = GlobalKey<NavigatorState>();
final _mainKey = GlobalKey<NavigatorState>();
final routes = GoRouter(
    navigatorKey: _appKey,
    initialLocation: '/signin',
    redirect: (context, state) async {
      // final pref = await SharedPreferences.getInstance();
      // final onboard = pref.getBool(PrefsConstants.onboard) ?? true;
      // if (onboard) return '/onboard';

      // final token = pref.getString(PrefsConstants.access_token) ?? '';
      // final checkToken = await locator<AuthRepository>().checkToken(token);
      // if(token.isEmpty) return '/signin';
      return null;
    },
    routes: [
      // GoRoute(
      //   path: '/onboard',
      //   name: OnboardScreen.routeName,
      //   builder: (context, state) => const OnboardScreen(),
      // ),
      GoRoute(
        path: '/signin',
        name: SignInScreen.routeName,
        builder: (context, state) => SignInScreen(),
      ),
    ]);
