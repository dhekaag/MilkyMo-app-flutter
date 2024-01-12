import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import '../controllers/verification_forgot_password_controller.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(25.r),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              child: Image.asset("assets/images/new_password_image.png"),
            ),
            SizedBox(
              height: 40.h,
            ),
            Form(
                child: Column(
              children: [
                Obx(() => TextFormField(
                      key: const ValueKey("new password"),
                      obscureText:
                          controller.isNewPasswordHidden.value ? true : false,
                      decoration: InputDecoration(
                          labelText: "Password baru",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: controller.isNewPasswordHidden.value
                              ? IconButton(
                                  onPressed: () {
                                    controller.isNewPasswordHidden.toggle();
                                  },
                                  icon: const Icon(Icons.visibility))
                              : IconButton(
                                  onPressed: () {
                                    controller.isNewPasswordHidden.toggle();
                                  },
                                  icon: const Icon(Icons.visibility_off))),
                    )),
                SizedBox(height: 20.h),
                Obx(() => TextFormField(
                      key: const ValueKey("confirm new password"),
                      obscureText: controller.isConfirmNewPasswordHidden.value
                          ? true
                          : false,
                      decoration: InputDecoration(
                        labelText: "Konfirmasi password baru",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: controller.isConfirmNewPasswordHidden.value
                            ? IconButton(
                                onPressed: () {
                                  controller.isConfirmNewPasswordHidden
                                      .toggle();
                                },
                                icon: const Icon(Icons.visibility))
                            : IconButton(
                                onPressed: () {
                                  controller.isConfirmNewPasswordHidden
                                      .toggle();
                                },
                                icon: const Icon(Icons.visibility_off)),
                      ),
                    )),
              ],
            )),
            SizedBox(height: 60.h),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(300.w, 30.h),
                    backgroundColor: tPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                onPressed: () {
                  Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
                },
                child: Text(
                  "LANJUT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.85,
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
