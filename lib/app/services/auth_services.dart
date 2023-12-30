import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:tetiharana/utilities/constants.dart';
import 'package:tetiharana/utilities/helper.dart';

class AuthServices {
  // ***************  Using http ***************
  String apiUrl = "${Constant.apiUrl}";
  Helper helper = Helper();

  login({required String endpoints, required var body}) async {
    String protocol = helper.splitUrl(url: apiUrl, output: "protocol");
    String host = helper.splitUrl(url: apiUrl, output: "host");

    Uri uri = (protocol == "http")
        ? Uri.http(host, 'api/$endpoints')
        : Uri.https(host, 'api/$endpoints');
    Uri.http(host, 'api/$endpoints');
    debugPrint("This is the uri: $uri");
    debugPrint("This is the host: $host");
    debugPrint("This is the protocol: $protocol");

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

  logout() async {
    // AuthServices auth = AuthServices();
    // var token = await auth.getToken();
    // dio.options.headers['Authorization'] = "Bearer $token";
    // Response response;

    // try {
    //   response = await dio.post("$apiUrl/logout", data: {});
    //   await auth.removeToken();
    //   return response.statusCode;
    // } on DioException catch (e) {
    //   return e.response?.statusCode;
    // }
  }

  // ***************  Using Dio ***************
  // String apiUrl = "${Constant.apiUrl}/api";
  Dio dio = Dio();

  // login({required var data}) async {
  //   Response response;

  //   try {
  //     response = await dio.post("$apiUrl/login", data: data);
  //     AuthServices auth = AuthServices();
  //     auth.saveToken(token: response.data['token']);
  //     return response.statusCode;
  //   } on DioException catch (e) {
  //     return e.response?.statusCode;
  //   }
  // }

  // logout() async {
  //   AuthServices auth = AuthServices();
  //   var token = await auth.getToken();
  //   dio.options.headers['Authorization'] = "Bearer $token";
  //   Response response;

  //   try {
  //     response = await dio.post("$apiUrl/logout", data: {});
  //     await auth.removeToken();
  //     return response.statusCode;
  //   } on DioException catch (e) {
  //     return e.response?.statusCode;
  //   }
  // }

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

  getCurrentUser() async {
    AuthServices auth = AuthServices();
    var token = await auth.getToken();
    dio.options.headers['Authorization'] = "Bearer $token";
    List<String> splittedToken = token.split('|');
    String extractedToken = splittedToken.length > 1 ? splittedToken[1] : '';
    Response response;

    try {
      response = await dio.get("$apiUrl/user/auth/$extractedToken");
      return response.data;
    } on DioException catch (e) {
      return e.response?.statusCode;
    }
  }
}
