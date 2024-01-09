import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tetiharana/app/views/auth/login_view.dart';
import 'package:tetiharana/routes/app_routes.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  // Check if the user is already logged in
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  // Lock screen orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(token != null
        ? const MyApp(initialRoute: AppRoutes.home)
        : const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.initialRoute = AppRoutes.login,
  });

  final String initialRoute;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tetiharana',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      initialRoute: initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
