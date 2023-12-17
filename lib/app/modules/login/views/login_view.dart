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
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            width: size.width.w,
            height: size.height.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 150.r),
                  width: 150.w,
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/milkymo_logo.png"),
                ),
                LoginCardWidget(controller: controller)
              ],
            ),
          ),
        ));
  }
}
