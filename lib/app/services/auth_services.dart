import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:tetiharana/utilities/constants.dart';
import 'package:tetiharana/utilities/helper.dart';

class AuthServices {
  String apiUrl = "${Constant.apiUrl}";
  Helper helper = Helper();

  login({required String endpoints, required var body}) async {
    Uri uri = helper.getUri(endpoints: endpoints);
    var response = await http.post(uri, body: body);
    debugPrint("Response from AuthServices.login: ${response.statusCode}");

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      // Extract the token from the JSON
      String token = jsonResponse["token"];
      debugPrint("This is the token: $token");

      AuthServices auth = AuthServices();
      auth.saveToken(token: token);
    }
    return response.statusCode;
  }

  logout({required String endpoints}) async {
    AuthServices auth = AuthServices();
    String token = await auth.getToken();
    Uri uri = helper.getUri(endpoints: endpoints);

    try {
      var response = await http.post(uri, body: {}, headers: {
        "Authorization": "Bearer $token",
      });
      await auth.removeToken();

      debugPrint("Response from AuthServices.logout: ${response.statusCode}");

      return response.statusCode;
    } catch (e) {
      debugPrint("Error from AuthServices.logout: $e");
    }
  }

  saveToken({required String token}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    } catch (e) {
      print(e);
    }
  }

  getToken() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    } catch (e) {
      print(e);
    }
  }

  removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  getCurrentUser({required String endpoints}) async {
    AuthServices auth = AuthServices();
    String token = await auth.getToken();

    try {
      Uri uri = helper.getUri(endpoints: endpoints);
      var response = await http.get(uri, headers: {
        "Authorization": "Bearer $token",
      });

      debugPrint(
        "Response from AuthServices.getCurrentUser: ${response.statusCode}",
      );

      return json.decode(response.body);
    } catch (e) {
      debugPrint("Error from AuthServices.getCurrentUser: $e");
    }
  }
}
