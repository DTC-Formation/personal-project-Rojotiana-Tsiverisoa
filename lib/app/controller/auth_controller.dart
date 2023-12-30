import 'package:flutter/material.dart';

import 'package:tetiharana/app/models/auth_model.dart';

class AuthController {
  AuthModel authModel = AuthModel();

  // Log in session
  Future<void> login({
    required var body,
    required Function onSuccess,
    required Function onError,
  }) async {
    var response = await authModel.login(body);
    debugPrint("Response from AuthController.login: $response");
    
    switch (response) {
      case 200:
        onSuccess();
        break;

      default:
        onError(response);
        break;
    }
  }

  // Log out session
  Future<void> logout(
    Function onSuccess,
    Function onError,
  ) async {
    int response = await authModel.logout();
    switch (response) {
      case 200:
        onSuccess();
        break;

      default:
        onError();
        break;
    }
  }
}
