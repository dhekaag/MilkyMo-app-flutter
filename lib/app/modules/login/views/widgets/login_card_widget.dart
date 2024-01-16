import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/constant/mytext_field.dart';
import 'package:milkymo/app/modules/login/controllers/login_controller.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginCardWidget extends StatelessWidget {
  const LoginCardWidget({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        width: context.screenWidth,
        height: 400.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF1F6F9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r),
            ),
          ),
        ),
        child: Container(
            padding: EdgeInsets.all(10.r),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                          padding: EdgeInsets.only(top: 20.h),
                          width: 300.w,
                          height: 40.h,
                          child: const Text(
                            "Halo, peternak!",
                          ).text.size(14).color(tBlackColor).semiBold.make())
                      .pSymmetric(h: 5),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Untuk menggunakan aplikasi MilkyMo, silahkan masukkan ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ).textSpan.size(12).make(),
                        TextSpan(
                          text: 'ID peternak.',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  ).w(300).pOnly(top: 5.h, left: 5, bottom: 20),
                  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          MyTextField(
                            key: const ValueKey("idPeternak"),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Iconsax.user,
                                ).iconSize(20),
                                hintText: "Masukkan ID peternak",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.sp,
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r))),
                          ).paddingOnly(bottom: 15),
                          Obx(() => MyTextField(
                                maxLines: 1,
                                key: const ValueKey("password"),
                                obscureText: controller.isPasswordHidden.value
                                    ? true
                                    : false,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Iconsax.password_check,
                                    ).iconSize(20),
                                    suffixIcon: controller
                                            .isPasswordHidden.value
                                        ? IconButton(
                                            onPressed: () {
                                              controller.isPasswordHidden
                                                  .toggle();
                                            },
                                            icon: const Icon(Icons.visibility)
                                                .iconSize(20))
                                        : IconButton(
                                            onPressed: () {
                                              controller.isPasswordHidden
                                                  .toggle();
                                            },
                                            icon:
                                                const Icon(Icons.visibility_off)
                                                    .iconSize(20)),
                                    hintText: "Masukkan password",
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.r))),
                              ))
                        ],
                      ).h(140)),
                  SizedBox(
                    width: context.screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => TextButton.icon(
                            onPressed: () {
                              controller.rememberMe.toggle();
                            },
                            icon: controller.rememberMe.isFalse
                                ? const Icon(Icons.check_box_outline_blank)
                                : const Icon(Icons.check_box,
                                    color: Color(0xff62CDFF)),
                            style: ButtonStyle(
                                iconColor:
                                    MaterialStatePropertyAll(tHintColor)),
                            label: const Text(
                              "Ingat saya",
                            )
                                .text
                                .size(12)
                                .fontFamily("Poppins")
                                .color(tHintColor)
                                .make())),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.FORGOT_ACCOUNT);
                            },
                            child: const Text(
                              "Lupa akun?",
                            ).text.size(12).semiBold.make()),
                      ],
                    ),
                  ).pOnly(bottom: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(300.w, 30.h),
                          backgroundColor: tPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      onPressed: () {
                        Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
                      },
                      child: const Text(
                        "MASUK",
                      ).text.size(15).semiBold.letterSpacing(0.85).make())
                ]).pSymmetric(h: 20)));
  }
}
