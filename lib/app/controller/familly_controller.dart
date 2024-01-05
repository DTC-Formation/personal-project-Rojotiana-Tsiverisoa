import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:tetiharana/app/models/familly_model.dart';
import 'package:tetiharana/utilities/alert_message.dart';
import 'package:tetiharana/utilities/helper.dart';

class FamillyController {
  FamillyModel famillyModel = FamillyModel();
  AlertMessage alertMessage = AlertMessage();
  Helper helper = Helper();

  Future<void> getFamillyList({
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      List<dynamic> data = await famillyModel.getFamillyList();
      debugPrint(
        "Response from FamillyController.getFamillyList: ${data.length} founds",
      );
      onSuccess(data);
    } catch (error) {
      debugPrint("Error from FamillyController.getFamillyList: $error");
      onError(error);
    }
  }

  int getChildNumber({required String data}) {
    int numberOfchild = 0;
    if (data.isNotEmpty) {
      // Parse the JSON string
      Map<String, dynamic> jsonDataMap = json.decode(data);

      // Extract the array associated with the "children_id" key
      List<dynamic>? childrenIdList = jsonDataMap['children_id'];
      numberOfchild = childrenIdList?.length ?? 0;
    }

    return numberOfchild;
  }
}
