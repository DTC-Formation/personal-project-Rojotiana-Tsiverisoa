import 'package:flutter/material.dart';

import 'package:tetiharana/app/models/user_model.dart';
import 'package:tetiharana/utilities/alert_message.dart';

class UserController {
  UserModel userModel = UserModel();
  AlertMessage alertMessage = AlertMessage();
  String title = "";
  String message = "";

  Future<void> getCurrentUser(Function onSuccess, Function onError) async {
    // Get current user info after log in
    try {
      Map<String, dynamic> userData = await userModel.getCurrentUser();
      debugPrint(
        "Response from UserController.getCurrentUser: ${userData['email']}",
      );
      onSuccess(userData);
    } catch (error) {
      debugPrint("Error from UserController.getCurrentUser: $error");
      onError(error);
    }
  }

  Future<void> createUser({
    required var body,
    required Function(String, String) onSuccess,
    required Function(String, String) onError,
  }) async {
    // Create a new user
    int statusCode = await userModel.createUser(body);
    debugPrint("Response from UserController.createUser: $statusCode");

    Map<String, String> alertInfo = alertMessage.getMessage(
      statusCode: statusCode,
    );

    switch (statusCode) {
      case 200:
      case 201:
        title = "Félicitation";
        message = "La personne a bien été ajoutée!";
        onSuccess(title, message);
        break;

      default:
        title = alertInfo['title']!;
        message = alertInfo['message']!;
        onError(title, message);
        break;
    }
  }
}
