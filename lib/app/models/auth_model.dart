import 'package:tetiharana/app/services/auth_services.dart';

class AuthModel {
  AuthServices auth = AuthServices();

  Future<int> login(Map<String, String> data) async {
    // Log in session
    int response = await auth.login(data: data);
    return response;
  }

  Future<int> logout() async {
    // Log out session
    int response = await auth.logout();
    return response;
  }
}
