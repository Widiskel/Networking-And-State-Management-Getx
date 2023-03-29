import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tugas2/app/util/color_pallete.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorPallete.bgColor,
      body: Center(child: Image(image: AssetImage('assets/img/logo.png'))),
    );
  }
}
