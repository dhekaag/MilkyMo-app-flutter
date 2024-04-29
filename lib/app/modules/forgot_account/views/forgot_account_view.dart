import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/constant/mytext_field.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/forgot_account_controller.dart';

class ForgotAccountView extends GetView<ForgotAccountController> {
  const ForgotAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(25.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            VxBox(
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_rounded).iconSize(25)),
            ).alignTopLeft.make().pSymmetric(v: 30),
            VxBox().height(50).make(),
            VxBox(
              child: Image.asset("assets/images/id_card_image.png"),
            ).width(100).make(),
            VxBox().height(50).make(),
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    MyTextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.user).iconSize(23),
                          labelText: "Nama",
                          labelStyle: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r))),
                    ).box.height(60).make(),
                    VxBox().height(20).make(),
                    MyTextField(
                      decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.phone_android).iconSize(23),
                          labelText: "Nomor Telepon",
                          labelStyle: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r))),
                    ).box.height(60).make(),
                    SizedBox(height: 60.h),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(300.w, 30.h),
                            backgroundColor: tPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r))),
                        onPressed: () {
                          Get.toNamed(Routes.OTP_VERIFICATION);
                        },
                        child: const Text("LANJUT")
                            .text
                            .size(14)
                            .semiBold
                            .letterSpacing(0.90)
                            .color(tWhiteColor)
                            .make())
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
