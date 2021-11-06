import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat Apps",
      home: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
