import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:login/Screens/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/Screens/login.dart';
import 'package:login/Screens/register.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'flutterLogin',
      theme: ThemeData(
        // This is the theme of your application.
        //3
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            routes: <GoRoute>[],
            path: 'register',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              restorationId: state.pageKey.value,
              child: Register(),
            ),
          ),
          GoRoute(
            routes: <GoRoute>[],
            path: 'login',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              restorationId: state.pageKey.value,
              child: Login(),
            ),
          ),
        ],
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          restorationId: state.pageKey.value,
          child: Auth(),
        ),
      ),
    ],
  );
}
