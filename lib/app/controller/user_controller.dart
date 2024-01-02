import 'package:flutter/material.dart';

import 'package:tetiharana/app/models/user_model.dart';

class UserController {
  UserModel userModel = UserModel();

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
    required Function onSuccess,
    required Function onError,
  }) async {
    // Create a new user

    var response = await userModel.createUser(body);
    debugPrint("Response from UserController.createUser: $response");

    switch (response) {
      case 200 || 201:
        onSuccess();
        break;

      default:
        onError(response);
        break;
    }
  }
}
