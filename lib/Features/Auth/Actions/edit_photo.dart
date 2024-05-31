import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Themes/Alerts/error_message.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Themes/Alerts/successMessage.dart';
import '../../../Themes/Widgets/loading.dart';
import '../../../Utils/api.dart';
import '../Controllers/auth_controller.dart';
import 'package:http/http.dart' as http;

mixin EditPhotoMixin {
  File? showUserPhoto;

  selectPhoto() async {
    final AuthController authController = Get.find();

    final ImagePicker _picker = ImagePicker();
    final XFile? _image;
    _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      showUserPhoto = File(_image.path);
      print("Choose Photo Success");
      authController.update();
      await changePhoto();
    } else {
      showUserPhoto = null;
      authController.update();
      print("No Choose Photo");
    }
  }

  // Call API
  Future changePhoto() async {
    final AuthController authController = Get.find();

    String isPhotoChange = await authController.editPhotoAPI(showUserPhoto);
    if (isPhotoChange != "null") {
      authController.user?.photo = isPhotoChange;
      showUserPhoto = null;
      authController.update();
    } else {
      showUserPhoto = null;
    }
  }

  Future<String> editPhotoAPI(image) async {
    try {
      showLoading();
      var request = http.MultipartRequest(
          'POST', Uri.parse(SharedApi().baseUrl + 'user/photo'));
      request.headers.addAll(SharedApi().getToken());
      request.files.add(await http.MultipartFile.fromPath('photo', image.path));
      var response = await request.send();
      var data = await http.Response.fromStream(response);
      stopLoading();
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        showSuccessMessage(jsonData['message']);
        return jsonData['photo'];
      } else {
        showErrorMessage(jsonData['message']);
        return "null";
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("تحقق من إتصالك بالإنترنت");
      return "null";
    }
  }
}
