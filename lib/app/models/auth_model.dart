import 'package:flutter/material.dart';

import 'package:tetiharana/app/services/auth_services.dart';

class AuthModel {
  AuthServices authServices = AuthServices();

  // Log in session
  Future<int> login(Map<String, String> body) async {
    int response = await authServices.login(endpoints: "login", body: body);
    debugPrint("Response from AuthModel.login: $response");
    return response;
  }

  Future<int> logout() async {
    // Log out session
    int response = await authServices.logout(endpoints: "logout");
    return response;
  }
}
