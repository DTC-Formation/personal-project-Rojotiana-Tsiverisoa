import 'package:dio/dio.dart';

import 'package:tetiharana/app/services/auth_services.dart';
import 'package:tetiharana/utilities/constants.dart';

class ApiServices {
  AuthServices auth = AuthServices();
  String apiUrl = "${Constant.apiUrl}/api";
  Dio dio = Dio();

  createItems({
    required String endpoints,
    required var data,
  }) async {
    var token = await auth.getToken();
    dio.options.headers['Authorization'] = "Bearer $token";
    Response response;

    try {
      response = await dio.post("$apiUrl/$endpoints", data: data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  getItems({
    required String endpoints,
    var params,
  }) async {
    var token = await auth.getToken();
    dio.options.headers['Authorization'] = "Bearer $token";
    Response response;

    try {
      if (params != null) {
        response = await dio.get("$apiUrl/$endpoints/$params");
      } else {
        response = await dio.get("$apiUrl/$endpoints");
      }
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  updateItems({
    required String endpoints,
    var data,
    required int id,
  }) async {
    var token = await auth.getToken();
    dio.options.headers['Authorization'] = "Bearer $token";
    Response response;

    try {
      response = await dio.put("$apiUrl/$endpoints/$id", data: data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  deleteItems({
    required String endpoints,
    required var id,
  }) async {
    var token = await auth.getToken();
    dio.options.headers['Authorization'] = "Bearer $token";
    Response response;

    try {
      response = await dio.delete("$apiUrl/$endpoints/$id");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
