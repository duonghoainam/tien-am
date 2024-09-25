import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tien_am/presentation/home/screen/home_screen.dart';
import 'package:tien_am/presentation/main/screen/main_screen.dart';

final _appKey = GlobalKey<NavigatorState>();
final appRouter = GoRouter(
  navigatorKey: _appKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => MainScreen(
        shell: shell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const HomeScreen(),
            )
          ],
        ),
      ],
    )
  ],
);
