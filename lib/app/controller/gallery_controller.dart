import 'package:flutter/material.dart';

import 'package:tetiharana/app/models/gallery_model.dart';
import 'package:tetiharana/app/views/gallery/gallery.dart';
import 'package:tetiharana/utilities/alert_message.dart';
import 'package:tetiharana/utilities/helper.dart';

class GalleryController {
  GalleryModel galleryModel = GalleryModel();
  AlertMessage alertMessage = AlertMessage();
  Helper helper = Helper();

  Future<List<GalleryItem>> getImageGallery({
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      List<dynamic> responseData = await galleryModel.getImageGallery();
      List<GalleryItem> galleryItems = responseData.map((item) {
        return GalleryItem(
          source: "${helper.getFilePath("profile")}/${item['filename']}",
          name: item['firstname'],
        );
      }).toList();

      onSuccess(galleryItems);
      return galleryItems;
    } catch (error) {
      debugPrint("Error from GalleryController.getImageGallery: $error");
      onError(error);
      return [];
    }
  }

  // Future<void> getImageGallery({
  //   required Function onSuccess,
  //   required Function onError,
  // }) async {
  //   try {
  //     List<dynamic> data = await galleryModel.getImageGallery();
  //     debugPrint(
  //       "Response from GalleryController.getImageGallery: ${data.length} founds",
  //     );
  //     onSuccess(data);
  //   } catch (error) {
  //     debugPrint("Error from GalleryController.getImageGallery: $error");
  //     onError(error);
  //   }
  // }
}
