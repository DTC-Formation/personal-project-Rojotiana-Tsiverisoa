import 'dart:convert';

import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:tetiharana/app/services/auth_services.dart';
// import 'package:tetiharana/utilities/constants.dart';
import 'package:tetiharana/utilities/helper.dart';

class ApiServices {
  AuthServices authServices = AuthServices();
  Helper helper = Helper();
  // String apiUrl = "${Constant.apiUrl}/api";
  // Dio dio = Dio();

  createItems({
    required String endpoints,
    required var body,
  }) async {
    var token = await authServices.getToken();

    try {
      Uri uri = helper.getUri(endpoints: endpoints);
      var response = await http.post(uri, body: body, headers: {
        "Authorization": "Bearer $token",
      });

      debugPrint(
        "Response from ApiServices.createItems: ${response.statusCode}",
      );

      return response.statusCode;
    } catch (e) {
      debugPrint("Error from ApiServices.createItems: $e");
    }
  }

  getItems({
    required String endpoints,
  }) async {
    var token = await authServices.getToken();

    try {
      Uri uri = helper.getUri(endpoints: endpoints);

      var response = await http.get(uri, headers: {
        "Authorization": "Bearer $token",
      });

      debugPrint(
        "Response from ApiServices.getItems: ${response.statusCode}",
      );

      return response.body;
    } catch (e) {
      debugPrint("Error from ApiServices.getItems: $e");
    }
  }

  getItemsById({
    required String endpoints,
    required int id,
  }) async {
    var token = await authServices.getToken();

    try {
      Uri uri = helper.getUri(endpoints: "$endpoints/$id");

      var response = await http.get(uri, headers: {
        "Authorization": "Bearer $token",
      });

      debugPrint(
        "Response from ApiServices.getItemById: ${response.statusCode}",
      );

      return json.decode(response.body);
    } catch (e) {
      debugPrint("Error from ApiServices.getItems: $e");
    }
  }

  // updateItems({
  //   required String endpoints,
  //   var data,
  //   required int id,
  // }) async {
  //   var token = await authServices.getToken();
  //   dio.options.headers['Authorization'] = "Bearer $token";
  //   Response response;

  //   try {
  //     response = await dio.put("$apiUrl/$endpoints/$id", data: data);
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // deleteItems({
  //   required String endpoints,
  //   required var id,
  // }) async {
  //   var token = await authServices.getToken();
  //   dio.options.headers['Authorization'] = "Bearer $token";
  //   Response response;

  //   try {
  //     response = await dio.delete("$apiUrl/$endpoints/$id");
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
