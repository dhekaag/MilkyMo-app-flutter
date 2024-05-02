import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/login/controllers/login_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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
                          TextFormField(
                            key: const ValueKey("idPeternak"),
                            controller: controller.idPeternakController,
                            maxLines: 1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'ID peternak tidak boleh kosong';
                              } else if (value.isAlphabetOnly) {
                                return "ID peternak harus berisi angka";
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.8),
                            ),
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
                          Obx(() => TextFormField(
                                key: const ValueKey("password"),
                                controller: controller.passwordController,
                                maxLines: 1,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.8),
                                ),
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
                              )),
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
                                        ? const Icon(
                                            Icons.check_box_outline_blank)
                                        : const Icon(Icons.check_box,
                                            color: Color(0xff62CDFF)),
                                    style: ButtonStyle(
                                        iconColor: MaterialStatePropertyAll(
                                            tHintColor)),
                                    label: const Text(
                                      "Ingat saya",
                                    )
                                        .text
                                        .size(12)
                                        .semiBold
                                        .color(tHintColor)
                                        .make())),
                                TextButton(
                                    onPressed: () {
                                      // Get.toNamed(Routes.FORGOT_ACCOUNT);
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.info,
                                        title: "INFO",
                                        desc:
                                            "Fitur ini sedang proses develop,\n mohon maaf atas ketidaknyamanannya",
                                        descTextStyle: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                        ),
                                        btnOkOnPress: () {},
                                        btnOkText: "OKAY",
                                        btnOkColor: tPrimaryColor,
                                      ).show();
                                    },
                                    child: const Text(
                                      "Lupa akun?",
                                    ).text.size(12).semiBold.make()),
                              ],
                            ),
                          ).pOnly(bottom: 20),
                          Obx(() => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(300.w, 30.h),
                                  disabledBackgroundColor: Vx.blue300,
                                  backgroundColor: tPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              onPressed: controller.loginStatus.value.isLoading
                                  ? null
                                  : () {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        controller.login();
                                      }
                                    },
                              child: controller.loginStatus.value.isLoading
                                  ? SpinKitWave(
                                      size: 20.w,
                                      color: tPrimaryColor,
                                    )
                                  : const Text(
                                      "MASUK",
                                    )
                                      .text
                                      .size(15)
                                      .semiBold
                                      .letterSpacing(0.85)
                                      .make()))
                        ],
                      )),
                ]).pSymmetric(h: 20)));
  }
}
