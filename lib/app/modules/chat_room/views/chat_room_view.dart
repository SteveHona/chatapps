import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {},
              child: CircleAvatar(
                child: Image.asset("assets/logo/noimage.png"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Status",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          if (controller.isShowEmoji.isTrue) {
            controller.isShowEmoji.value = false;
          } else {
            Navigator.of(context).pop();
          }
          return Future.value(false);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    ItemChat(
                      isSender: true,
                      jam: '9:32 PM',
                      pesan: 'Halo..',
                    ),
                    ItemChat(
                      isSender: false,
                      jam: '10:45 AM',
                      pesan: 'Y',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: Get.width * 0.8,
                    child: TextField(
                      controller: controller.textControler,
                      focusNode: controller.focusNode,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            controller.focusNode.unfocus();
                            controller.isShowEmoji.toggle();
                          },
                          child: Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.red[800],
                      radius: 28,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => (controller.isShowEmoji.isTrue)
                  ? Container(
                      height: 240,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          controller.addEmojiToChat(emoji);
                        },
                        onBackspacePressed: () {
                          controller.backSpaceEmoji();
                        },
                        config: Config(
                          columns: 7,
                          emojiSizeMax: 32 *
                              (Platform.isIOS
                                  ? 1.30
                                  : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                          verticalSpacing: 0,
                          horizontalSpacing: 0,
                          backspaceColor: Color(0xFFC62828),
                          initCategory: Category.RECENT,
                          bgColor: Color(0xFFF2F2F2),
                          indicatorColor: Color(0xFFC62828),
                          iconColor: Colors.grey,
                          iconColorSelected: Color(0xFFC62828),
                          progressIndicatorColor: Color(0xFFC62828),
                          showRecentsTab: true,
                          recentsLimit: 28,
                          noRecentsText: "No Recents",
                          noRecentsStyle: const TextStyle(
                              fontSize: 20, color: Colors.black26),
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: const CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat(
      {Key? key,
      required this.isSender,
      required this.pesan,
      required this.jam})
      : super(key: key);

  final bool isSender;
  final String pesan, jam;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red[800],
              borderRadius: isSender
                  ? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
            ),
            padding: EdgeInsets.all(15),
            child: Text(
              "$pesan",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text("$jam"),
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
