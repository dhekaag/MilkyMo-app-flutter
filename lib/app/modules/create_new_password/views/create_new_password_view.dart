import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/constant/mytext_field.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/verification_forgot_password_controller.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(25.r),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              child: Image.asset("assets/images/new_password_image.png"),
            ).width(100).make(),
            VxBox().height(40).make(),
            Form(
                child: Column(
              children: [
                Obx(() => MyTextField(
                      key: const ValueKey("new password"),
                      obscureText:
                          controller.isNewPasswordHidden.value ? true : false,
                      decoration: InputDecoration(
                          labelText: "Password baru",
                          labelStyle: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          prefixIcon:
                              const Icon(Iconsax.password_check).iconSize(23),
                          suffixIcon: controller.isNewPasswordHidden.value
                              ? IconButton(
                                  onPressed: () {
                                    controller.isNewPasswordHidden.toggle();
                                  },
                                  icon:
                                      const Icon(Icons.visibility).iconSize(23))
                              : IconButton(
                                  onPressed: () {
                                    controller.isNewPasswordHidden.toggle();
                                  },
                                  icon: const Icon(Icons.visibility_off)
                                      .iconSize(23))),
                    )),
                VxBox().height(20).make(),
                Obx(() => TextFormField(
                      key: const ValueKey("confirm new password"),
                      obscureText: controller.isConfirmNewPasswordHidden.value
                          ? true
                          : false,
                      decoration: InputDecoration(
                        labelText: "Konfirmasi password baru",
                        labelStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: controller.isConfirmNewPasswordHidden.value
                            ? IconButton(
                                onPressed: () {
                                  controller.isConfirmNewPasswordHidden
                                      .toggle();
                                },
                                icon: const Icon(Icons.visibility).iconSize(23))
                            : IconButton(
                                onPressed: () {
                                  controller.isConfirmNewPasswordHidden
                                      .toggle();
                                },
                                icon: const Icon(Icons.visibility_off)
                                    .iconSize(23)),
                      ),
                    )),
              ],
            )),
            VxBox().height(60).make(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(300.w, 30.h),
                    backgroundColor: tPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                onPressed: () {
                  Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
                },
                child: const Text("LANJUT")
                    .text
                    .size(14)
                    .semiBold
                    .letterSpacing(0.90)
                    .color(tWhiteColor)
                    .make())
          ],
        ),
      ),
    ));
  }
}
