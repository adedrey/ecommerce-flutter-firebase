import 'dart:typed_data';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class UploadController {
  Future<dynamic> selectImageUsingPreferredCameraType(
      ImageSource imageSource) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? _selectedImage =
        await imagePicker.pickImage(source: imageSource, imageQuality: 50);
    if (_selectedImage != null) {
      return _selectedImage.readAsBytes();
    } else {
      Fluttertoast.showToast(msg: "Picture not selected");
    }
  }
}
