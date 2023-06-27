import 'package:color_bootcamp/ui/history.dart';
import 'package:color_bootcamp/ui/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider.autoDispose(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'history',
            builder: (context, state) => const HistoryPage(),
          ),
        ],
      ),
    ],
  ),
);
