import 'package:tetiharana/app/models/user_model.dart';

class UserController {
  UserModel userModel = UserModel();

  Future<void> getCurrentUser(Function onSuccess, Function onError) async {
    // Get current user info after log in
    var response = await userModel.getCurrentUser();
  }
}
