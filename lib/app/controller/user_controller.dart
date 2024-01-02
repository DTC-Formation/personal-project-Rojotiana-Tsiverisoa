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

  Future<void> createUser(Map<String, dynamic> userData, Function onSuccess,
      Function onError) async {
    // Create a new user
    try {
      Map<String, dynamic> response = await userModel.createUser(userData);
      onSuccess(response);
    } catch (error) {
      onError(error);
    }
  }
}
