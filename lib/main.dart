import 'package:flutter/material.dart';
import 'app/router.dart';
import 'app/route.dart';
import 'app/dependencies.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JIRANKU Application',
      debugShowCheckedModeBanner: false,
      initialRoute: initialScreen,
      onGenerateRoute: createRoute,
    );
  }
}