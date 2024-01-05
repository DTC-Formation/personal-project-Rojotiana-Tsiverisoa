import 'dart:convert';

import 'package:tetiharana/app/services/api_services.dart';
import 'package:tetiharana/app/services/auth_services.dart';

class UserModel {
  ApiServices apiServices = ApiServices();
  AuthServices authServices = AuthServices();

  Future<Map<String, dynamic>> getCurrentUser() async {
    // Get current user info after log in
    String token = await authServices.getToken();
    List<String> splittedToken = token.split('|');
    String extractedToken = splittedToken.length > 1 ? splittedToken[1] : '';

    var response = await authServices.getCurrentUser(
      endpoints: "user/auth/$extractedToken",
    );

    if (response is List && response.isNotEmpty) {
      // Assuming the list contains a single user object
      Map<String, dynamic> userData = response[0];
      return userData;
    }

    // Assuming response is already a Map
    Map<String, dynamic> userData = response;
    return userData;
  }

  Future<int> createUser(Map<String, dynamic> body) async {
    int response = await apiServices.createItems(
      endpoints: "user",
      body: body,
    );

    return response;
  }

  Future<List<dynamic>> getUsers() async {
    var response = await apiServices.getItems(endpoints: "users");

    // Assuming response is a JSON string, parse it into a List
    List<dynamic> userData = json.decode(response);
    return userData;
  }

  Future<Map<String, dynamic>> getUserById({required int id}) async {
    var response = await apiServices.getItemsById(endpoints: "user", id: id);

    if (response is List && response.isNotEmpty) {
      // Assuming the list contains a single user object
      Map<String, dynamic> userData = response[0];
      return userData;
    }

    // Assuming response is already a Map
    Map<String, dynamic> userData = response;
    return userData;
  }
}
