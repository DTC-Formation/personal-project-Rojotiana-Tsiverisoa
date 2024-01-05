import 'dart:convert';

import 'package:tetiharana/app/services/api_services.dart';

class FamillyModel {
  ApiServices apiServices = ApiServices();

  Future<List<dynamic>> getFamillyList() async {
    var response = await apiServices.getItems(endpoints: "familly");

    // Assuming response is a JSON string, parse it into a List
    List<dynamic> famillyList = json.decode(response);
    return famillyList;
  }
}
