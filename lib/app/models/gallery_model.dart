import 'dart:convert';

import 'package:tetiharana/app/services/api_services.dart';

class GalleryModel {
  ApiServices apiServices = ApiServices();

  Future<List<dynamic>> getImageGallery() async {
    var response = await apiServices.getItems(endpoints: "gallery");

    // Assuming response is a JSON string, parse it into a List
    List<dynamic> galleryData = json.decode(response);
    return galleryData;
  }
}
