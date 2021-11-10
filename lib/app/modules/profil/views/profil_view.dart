import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatapps/app/controllers/auth_controller.dart';
import 'package:chatapps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                    color: Colors.red[800],
                  ),
                  Material(
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red[800],
                      ),
                      child: IconButton(
                        onPressed: () {
                          authController.isAuth.value = false;
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        icon: Icon(Icons.logout_rounded),
                        color: Colors.white,
                        iconSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  AvatarGlow(
                    endRadius: 110,
                    glowColor: Colors.black,
                    duration: Duration(seconds: 2),
                    child: CircleAvatar(
                      radius: 80,
                      child: Image.asset("assets/logo/noimage.png"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Orang ke 1",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "orang1@gmail.com",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red[800],
                  ),
                  title: Text(
                    "Update Status",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: IconButton(
                    color: Colors.black,
                    iconSize: 28,
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      Get.toNamed(Routes.UPDATE_STATUS);
                    },
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red[800],
                  ),
                  title: Text(
                    "Change Profile",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: IconButton(
                    color: Colors.black,
                    iconSize: 28,
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      Get.toNamed(Routes.CHANGE_PROFILE);
                    },
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red[800],
                  ),
                  title: Text(
                    "Change Theme",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: TextButton(
                    child: Text(
                      "light",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
