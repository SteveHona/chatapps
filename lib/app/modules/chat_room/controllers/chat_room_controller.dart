import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  var isShowEmoji = false.obs;
  late FocusNode focusNode;
  late TextEditingController textControler;

  void addEmojiToChat(Emoji emoji) {
    textControler.text = textControler.text + emoji.emoji;
  }

  void backSpaceEmoji() {
    textControler.text = textControler.text.substring(
      0,
      textControler.text.length - 2,
    );
  }

  @override
  void onInit() {
    focusNode = FocusNode();
    textControler = TextEditingController();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isShowEmoji.value = false;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    focusNode.dispose();
    textControler.dispose();
    super.onClose();
  }
}
