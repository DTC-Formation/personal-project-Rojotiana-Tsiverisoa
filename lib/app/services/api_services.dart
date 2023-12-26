import 'package:dio/dio.dart';

import 'package:tetiharana/app/services/auth_services.dart';
import 'package:tetiharana/utilities/constants.dart';

class ApiServices {
  AuthServices auth = AuthServices();
  String url = "${Constant.apiUrl}/api";
  Dio dio = Dio();

  createItems() {}

  getItems({required String endpoints, var params}) async {
    var token = await auth.getToken();
    dio.options.headers['Authorization'] = "Bearer $token";
    Response response;

    try {
      if (params != null) {
        response = await dio.get("$url/$endpoints/$params");
      } else {
        response = await dio.get("$url/$endpoints");
      }
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  updateItems() {}

  deleteItems() {}
}
