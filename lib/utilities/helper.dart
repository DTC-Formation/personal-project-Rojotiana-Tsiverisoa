import 'package:tetiharana/utilities/constants.dart';

class Helper {
  String apiUrl = "${Constant.apiUrl}";

  int ageCalculator(String birthdate) {
    List<String> parts = birthdate.split('-');
    DateTime now = DateTime.now();
    int currentYear = now.year;
    String yearOfBirth = parts[0];
    int age = currentYear - int.parse(yearOfBirth);
    return age;
  }

  String getFirstLetter(String text) {
    String letter = "";
    if (text != "") {
      letter = text.substring(0, 1).toUpperCase();
    }
    return letter;
  }

  String getInitial(String text1, String text2) {
    String initial = "";
    String firstLetter = Helper().getFirstLetter(text1);
    String secondLetter = Helper().getFirstLetter(text2);

    if (text1 != "" && text2 != "") {
      initial = "$firstLetter$secondLetter";
    } else if (text1 != "") {
      initial = firstLetter;
    } else if (text2 != "") {
      initial = secondLetter;
    }

    return initial;
  }

  String getFilePath(String path) {
    String directory = "";

    switch (path) {
      case "profile":
        directory = "$apiUrl/assets/upload/profile";
        break;

      default:
        directory = 'undefined path';
        break;
    }

    return directory;
  }

  String formatDate(String date) {
    if (date != "") {
      // Split the original string into day, month, and year
      List<String> dateParts = date.split('/');
      int day = int.parse(dateParts[0]);
      int month = int.parse(dateParts[1]);
      int year = int.parse(dateParts[2]);

      // Format the date parts into the desired format
      String formattedDateString =
          '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

      return formattedDateString;
    } else {
      return "";
    }
  }

  String splitUrl({required String url, required String output}) {
    String data = "";
    Uri uri = Uri.parse(url);

    switch (output) {
      case "protocol":
        data = uri.scheme;
        break;

      case "host":
        data = uri.host + (uri.hasPort ? ':${uri.port}' : '');
        break;
    }

    return data;
  }
}
