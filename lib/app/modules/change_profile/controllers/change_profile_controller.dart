import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  late TextEditingController emailControl;
  late TextEditingController namaControl;
  late TextEditingController statusControl;

  @override
  void onInit() {
    emailControl = TextEditingController(text: "lorem.ipsum@gmail.com");
    namaControl = TextEditingController(text: "Lorem Ipsum");
    statusControl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailControl.dispose();
    namaControl.dispose();
    statusControl.dispose();
    super.onClose();
  }
}
