import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStatusController extends GetxController {
  late TextEditingController statusControl;

  @override
  void onInit() {
    statusControl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    statusControl.dispose();
    super.onClose();
  }
}
