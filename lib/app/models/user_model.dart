import 'package:tetiharana/app/services/api_services.dart';
import 'package:tetiharana/app/services/auth_services.dart';

class UserModel {
  ApiServices apiServices = ApiServices();
  AuthServices authServices = AuthServices();

  Future<Map<String, dynamic>> getCurrentUser() async {
    // Get current user info after log in
    AuthServices auth = AuthServices();
    String token = await auth.getToken();
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

  Future<Map<String, dynamic>> createUser(Map<String, dynamic> userData) async {
    // Create a new user
    return await apiServices.createItems(endpoints: 'user', data: userData);
  }
}
