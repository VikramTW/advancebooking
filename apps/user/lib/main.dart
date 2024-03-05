import 'package:flutter/material.dart';
import 'package:user/user_theme/theme_data.dart';
import 'package:user/route/router.dart';

import 'di/locator.dart';

void main() {
  setupLocator();
  startup();
}

void startup() async {
  //String env = const String.fromEnvironment("ENV", defaultValue: "dev");
  //await initConfig(env);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      routerConfig: router,
    );
  }
}

