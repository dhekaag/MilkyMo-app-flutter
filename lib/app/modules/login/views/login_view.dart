import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkymo/app/modules/login/views/widgets/login_card_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff00A9FF),
      body: SizedBox(
        width: size.width.w,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              Container(
                width: 140.w,
                alignment: Alignment.center,
                child: Image.asset("assets/images/milkymo_logo.png"),
              ),
              SizedBox(height: 50.h),
              LoginCardWidget(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
