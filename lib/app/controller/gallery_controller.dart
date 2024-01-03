import 'package:flutter/material.dart';

import 'package:tetiharana/app/models/gallery_model.dart';
import 'package:tetiharana/utilities/alert_message.dart';
import 'package:tetiharana/utilities/helper.dart';

class GalleryController {
  GalleryModel galleryModel = GalleryModel();
  AlertMessage alertMessage = AlertMessage();
  Helper helper = Helper();

  Future<void> getImageGallery({
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      List<dynamic> data = await galleryModel.getImageGallery();
      debugPrint(
        "Response from GalleryController.getImageGallery: ${data.length} founds",
      );
      onSuccess(data);
    } catch (error) {
      debugPrint("Error from GalleryController.getImageGallery: $error");
      onError(error);
    }
  }
}
