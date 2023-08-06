import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: const Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.5),
              child: CircleAvatar( 
                radius: 70,
                backgroundImage: AssetImage('assets/images/icons/logo.png'),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.15),
              child: Text(
                "FileStore",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
