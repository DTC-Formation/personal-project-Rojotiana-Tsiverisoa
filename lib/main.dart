import 'package:flutter/material.dart';

import 'package:tetiharana/app/views/auth/forgot_password.dart';
import 'package:tetiharana/app/views/auth/login_page.dart';
import 'package:tetiharana/app/views/familly/familly.dart';
import 'package:tetiharana/app/views/homepage/homepage.dart';
import 'package:tetiharana/app/views/member/member.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const LoginPage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/forgot-password': (context) => const ForgotPassword(),
        '/home': (context) => const HomePage(),
        // '/tree-app': (context) => const TreeApp(),
        '/familly': (context) => const FamillyList(),
        '/member': (context) => const MemberAdd(),
        // '/gallery': (context) => const Gallery(),
        // '/profile': (context) => const Profile(),
      },
    );
  }
}
