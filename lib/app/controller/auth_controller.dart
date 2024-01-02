import 'package:flutter/material.dart';

import 'package:tetiharana/app/models/auth_model.dart';
import 'package:tetiharana/utilities/alert_message.dart';

class AuthController {
  AuthModel authModel = AuthModel();
  AlertMessage alertMessage = AlertMessage();
  String title = "";
  String message = "";

  // Log in session
  Future<void> login({
    required var body,
    required Function onSuccess,
    required Function(String, String) onError,
  }) async {
    int statusCode = await authModel.login(body);
    debugPrint("Response from AuthController.login: $statusCode");

    Map<String, String> alertInfo = alertMessage.getMessage(
      statusCode: statusCode,
    );

    switch (statusCode) {
      case 200:
      case 201:
        onSuccess();
        break;

      case 401:
        title = "Oupss";
        message = "Veuillez vérifier votre email ou votre mot de passe!";
        onError(title, message);
        break;

      default:
        title = alertInfo['title']!;
        message = alertInfo['message']!;
        onError(title, message);
        break;
    }
  }

  // Log out session
  Future<void> logout(
    Function onSuccess,
    Function(String, String) onError,
  ) async {
    int statusCode = await authModel.logout();

    switch (statusCode) {
      case 200:
      case 201:
        onSuccess();
        break;

      default:
        title = "Erreur";
        message = "Désolé, une erreur est survenu lors de la déconnexion!";
        onError(title, message);
        break;
    }
  }
}
