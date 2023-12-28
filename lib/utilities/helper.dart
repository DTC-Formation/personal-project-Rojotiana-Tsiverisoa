class Helper {
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
}
