// app_routes.dart
import 'package:flutter/material.dart';
import 'package:tetiharana/app/views/about/about_view.dart';
import 'package:tetiharana/app/views/auth/forgot_password_view.dart';
import 'package:tetiharana/app/views/auth/login_view.dart';
import 'package:tetiharana/app/views/familly/familly_list_view.dart';
import 'package:tetiharana/app/views/gallery/gallery.dart';
import 'package:tetiharana/app/views/home/home_view.dart';
import 'package:tetiharana/app/views/tree/tree_view.dart';
import 'package:tetiharana/app/views/user/user_add_view.dart';
// import 'package:tetiharana/app/views/user/user_info_view.dart';
// import 'package:tetiharana/app/views/user/user_update_view.dart';
import 'package:tetiharana/app/views/user/user_profile_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String treeApp = '/tree-app';
  static const String familly = '/familly';
  static const String userAdd = '/user/add';
  // static const String userUpdate = '/user/update';
  // static const String userInfo = '/user/view';
  static const String gallery = '/gallery';
  static const String userProfile = '/user/profile';
  static const String about = '/about';

  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => const LoginView(),
      forgotPassword: (context) => const ForgotPasswordView(),
      home: (context) => const HomeView(),
      treeApp: (context) => const TreeView(),
      familly: (context) => const FamillyListView(),
      userAdd: (context) => const UserAddView(),
      // userUpdate: (context) => const UserUpdateView(),
      // userInfo: (context) => const UserInfoView(),
      gallery: (context) => const Gallery(),
      userProfile: (context) => const UserProfileView(),
      about: (context) => const AboutView(),
    };
  }
}
