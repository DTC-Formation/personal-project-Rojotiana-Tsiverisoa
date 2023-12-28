import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:tetiharana/app/views/about/about_view.dart';
import 'package:tetiharana/app/views/auth/forgot_password_view.dart';
import 'package:tetiharana/app/views/auth/login_view.dart';
import 'package:tetiharana/app/views/familly/familly_list_view.dart';
import 'package:tetiharana/app/views/gallery/gallery.dart';
import 'package:tetiharana/app/views/home/home_view.dart';
import 'package:tetiharana/app/views/tree/tree_view.dart';
import 'package:tetiharana/app/views/user/user_add_view.dart';
import 'package:tetiharana/app/views/user/user_info_view.dart';
import 'package:tetiharana/app/views/user/user_profile_view.dart';
import 'package:tetiharana/app/views/user/user_update_view.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
      home: const LoginView(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginView(),
        '/forgot-password': (context) => const ForgotPasswordView(),
        '/home': (context) => const HomeView(),
        '/tree-app': (context) => const TreeView(),
        '/familly': (context) => const FamillyListView(),
        '/user/add': (context) => const UserAddView(),
        '/user/update': (context) => const UserUpdateView(),
        '/user/view': (context) => const UserInfoView(),
        '/gallery': (context) => const Gallery(),
        '/user/profile': (context) => const UserProfileView(),
        '/about': (context) => const AboutView(),
      },
    );
  }
}
