import 'package:tetiharana/app/services/api_services.dart';
import 'package:tetiharana/app/services/auth_services.dart';

class UserModel {
  ApiServices apiServices = ApiServices();
  AuthServices authServices = AuthServices();

  Future<Map<String, dynamic>> getCurrentUser() async {
    // Get current user info after log in
    List<dynamic> response = await authServices.getCurrentUser();
    return response.first;
  }
}
