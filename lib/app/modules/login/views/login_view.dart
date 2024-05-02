import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkymo/app/modules/login/views/widgets/login_card_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00A9FF),
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VxBox(
                child: Image.asset("assets/images/milkymo_logo.png"),
              )
                  .height(170)
                  .alignCenter
                  .make()
                  .pOnly(top: 80, bottom: 40)
                  .safeArea(),
              LoginCardWidget(controller: controller).safeArea(),
            ],
          ),
        ),
      ),
    );
  }
}
