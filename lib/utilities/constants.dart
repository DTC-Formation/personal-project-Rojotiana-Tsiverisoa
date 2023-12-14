import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {
  static var apiUrl = dotenv.env['API_URL'];
  static var appVersion = dotenv.env['APP_VERSION'];
}
