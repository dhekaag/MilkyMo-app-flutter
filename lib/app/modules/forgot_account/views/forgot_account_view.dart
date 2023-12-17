import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/routes/app_pages.dart';

import '../controllers/forgot_account_controller.dart';

class ForgotAccountView extends GetView<ForgotAccountController> {
  const ForgotAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(25.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(vertical: 30.r),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
            ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              width: 100.w,
              child: Image.asset("assets/images/id_card_image.png"),
            ),
            SizedBox(height: 40.h),
            Form(
                key: controller.formKey,
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.user),
                            labelText: "Nama",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r))),
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone_android),
                            labelText: "Nomor telepon",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r))),
                      ),
                      SizedBox(height: 60.h),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(320.w, 40.h),
                              backgroundColor: tPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          onPressed: () {
                            Get.toNamed(Routes.OTP_VERIFICATION);
                          },
                          child: Text(
                            "LANJUT",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.85,
                            ),
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
