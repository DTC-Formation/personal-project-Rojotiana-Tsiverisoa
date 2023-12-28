import 'package:tetiharana/app/models/auth_model.dart';
import 'package:tetiharana/app/services/auth_services.dart';

class AuthController {
  AuthServices auth = AuthServices();
  AuthModel authModel = AuthModel();

  Future<void> login(
    var data,
    Function onSuccess,
    Function onError,
  ) async {
    // Log in session
    var response = await authModel.login(data);
    switch (response) {
      case 200:
        onSuccess();
        break;

      default:
        onError();
        break;
    }
  }

  Future<void> logout(
    Function onSuccess,
    Function onError,
  ) async {
    // Log out session
    int response = await authModel.logout();
    switch (response) {
      case 200:
        onSuccess();
        break;

      default:
        onError();
        break;
    }
  }
}
