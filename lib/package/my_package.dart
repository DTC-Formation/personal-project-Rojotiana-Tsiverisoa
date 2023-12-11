import 'package:flutter/material.dart';

class MyPackage {
  static const Color color01 = Color.fromRGBO(219, 219, 219, 1); //#DBDBDB
  static const Color color02 = Color.fromRGBO(3, 58, 67, 1); // #033A43
  static const Color color03 = Color.fromRGBO(52, 52, 52, 1); // #343434
  static const Color color04 = Color.fromRGBO(251, 66, 66, 1); // #FB4242
  static const Color color05 = Color.fromRGBO(255, 255, 255, 1); // #FFFFFF
  static const Color color06 = Color.fromRGBO(47, 48, 48, 1); // #2F3030
  static const Color color07 = Color.fromRGBO(62, 37, 4, 1); // #3E2504
  static const Color color08 = Color.fromRGBO(129, 73, 0, 1); // #814900
  static const Color color09 = Color.fromRGBO(158, 158, 158, 1); // #9E9E9E
  static const Color color10 = Color.fromRGBO(77, 77, 78, 1); // #4D4E4E
  static const Color color11 = Color.fromARGB(122, 0, 0, 0);

  static const LinearGradient gradient01 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(67, 198, 72, 1), // #43C6AC
      Color.fromRGBO(35, 122, 87, 1), // #237A57
    ],
  );
  static const LinearGradient gradient02 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(228, 77, 38, 1), // #E44D26
      Color.fromRGBO(241, 101, 41, 1), // #F16529
    ],
  );
  static const LinearGradient gradient03 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(242, 153, 74, 1), // #F2994A
      Color.fromRGBO(242, 201, 76, 1), // #F2C94C
    ],
  );
  static const LinearGradient gradient04 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(28, 146, 210, 1), // #1C92D2
      Color.fromRGBO(72, 177, 191, 1), // #48B1BF
    ],
  );
  static const LinearGradient gradient05 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(255, 153, 102, 1), // #FF9966
      Color.fromRGBO(255, 94, 98, 1), // #FF5E62
    ],
  );

  static const BoxShadow shadow01 = BoxShadow(
    color: Color.fromARGB(19, 0, 0, 0),
    offset: Offset(0, 2),
    blurRadius: 8,
    spreadRadius: 2,
  );

  static const fontSize01 = 22.0;
  static const fontSize02 = 18.0;

  static const FontWeight fontWeight01 = FontWeight.w500;
}
