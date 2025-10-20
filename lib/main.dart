import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/messanger_chats.dart';
import 'screens/messanger_swipe_actions.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/messanger_chats',
  routes: [
    GoRoute(
      path: '/messanger_chats',
      builder: (context, state) => const MessangerChats(),
    ),
    GoRoute(
      path: '/messanger_swipe_actions',
      builder: (context, state) => const MessangerSwipeActions(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
