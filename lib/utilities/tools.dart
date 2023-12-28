import 'package:flutter/material.dart';

class Tools {
  static const Color color01 = Color(0xFFDBDBDB); // #DBDBDB
  static const Color color02 = Color(0xFF033A43); // #033A43
  static const Color color03 = Color(0xFF343434); // #343434
  static const Color color04 = Color(0xFFFB4242); // #FB4242
  static const Color color05 = Color(0xFFFFFFFF); // #FFFFFF
  static const Color color06 = Color(0xFF2F3030); // #2F3030
  static const Color color07 = Color(0xFF3E2504); // #3E2504
  static const Color color08 = Color(0xFF814900); // #814900
  static const Color color09 = Color(0xFF9E9E9E); // #9E9E9E
  static const Color color10 = Color(0xFF4D4E4E); // #4D4E4E
  static const Color color11 = Color.fromARGB(122, 0, 0, 0);
  static const Color color12 = Color.fromARGB(221, 236, 236, 236);
  static const Color color13 = Color.fromARGB(160, 228, 228, 228);
  static const Color color14 = Color.fromRGBO(112, 112, 112, 1); //
  static const Color color15 = Color.fromARGB(255, 231, 231, 231); //
  static const Color color16 = Color.fromARGB(255, 214, 164, 117); //

  static const LinearGradient gradient01 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF56AD2F), // #56AD2F
      Color(0xFFA8E063), // #A8E063
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
  static const LinearGradient gradient06 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFA3744A), // #A3744A
      Color(0xFF865C5D), // #865C5D
      Color(0xFF6C433D), // #6C433D
    ],
  );

  static const BoxShadow shadow01 = BoxShadow(
    color: Color.fromARGB(19, 0, 0, 0),
    offset: Offset(0, 2),
    blurRadius: 8,
    spreadRadius: 2,
  );

  static const BoxShadow shadow02 = BoxShadow(
    color: Color.fromARGB(66, 56, 45, 16),
    blurRadius: 8,
    spreadRadius: 2,
  );

  static const fontSize01 = 22.0;
  static const fontSize02 = 18.0;
  static const fontSize03 = 30.0;

  static const FontWeight fontWeight01 = FontWeight.w500;

  static double radius01 = 10;

  static double padding01 = 10;

  static double imageHeight01 = 210;
}
