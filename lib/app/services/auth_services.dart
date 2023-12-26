import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import 'package:tetiharana/utilities/constants.dart';

class AuthServices {
  String apiUrl = "${Constant.apiUrl}/api";
  Dio dio = Dio();

  login({required var data}) async {
    Response response;

    try {
      response = await dio.post("$apiUrl/login", data: data);
      AuthServices auth = AuthServices();
      auth.saveToken(token: response.data['token']);
      return response.statusCode;
    } on DioException catch (e) {
      return e.response?.statusCode;
    }
  }

  logout() async {
    AuthServices auth = AuthServices();
    var token = await auth.getToken();
    dio.options.headers['Authorization'] = "Bearer $token";
    Response response;

    try {
      response = await dio.post("$apiUrl/logout", data: {});
      await auth.removeToken();
      return response.statusCode;
    } on DioException catch (e) {
      return e.response?.statusCode;
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
