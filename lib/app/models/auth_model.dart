import 'package:flutter/material.dart';

import 'package:tetiharana/app/services/auth_services.dart';

class AuthModel {
  AuthServices authServices = AuthServices();

  Future<int> login(Map<String, String> body) async {
    // Log in session
    int response = await authServices.login(endpoints: "login", body: body);
    debugPrint("Response from AuthModel.login: $response");
    return response;
  }

  Future<int> logout() async {
    // Log out session
    int response = await authServices.logout();
    return response;
  }
}
