import "package:flutter/material.dart";
import "package:network/config/config.dart";

import "main.dart";

void startup() async {

  //String env = const String.fromEnvironment("ENV", defaultValue: "dev");
  //await initConfig(env);

  runApp(const MyApp());
}
