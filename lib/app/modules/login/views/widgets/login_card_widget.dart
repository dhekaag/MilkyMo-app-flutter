import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/login/controllers/login_controller.dart';

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
        width: 390.w,
        height: 450.h,
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
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(top: 30.r),
                width: 300.w,
                child: const Text(
                  'Hallo, Peternak!',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xFF152C2A),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.70,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 300.w,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Untuk menggunakan aplikasi MilkyMo, silahkan masukkan ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'ID peternak.',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 25.h),
              Form(
                  key: controller.formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: Column(
                      children: [
                        TextFormField(
                          key: const ValueKey("idPeternak"),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Iconsax.user,
                                size: 20,
                              ),
                              hintText: "Masukkan ID peternak",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r))),
                        ),
                        SizedBox(
                          height: 15.r,
                        ),
                        TextFormField(
                          key: const ValueKey("password"),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.password_check,
                                size: 20.w,
                              ),
                              hintText: "Masukkan password",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r))),
                        )
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.r),
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
                            iconColor: MaterialStatePropertyAll(tHintColor)),
                        label: Text(
                          "Ingat saya",
                          style: TextStyle(color: tHintColor),
                        ))),
                    TextButton(
                        onPressed: () {
                          // Get.toNamed(Routes.OTP);
                        },
                        child: Text(
                          "Lupa id peternak?",
                          style: TextStyle(
                            color: const Color(0xFF009EE8),
                            fontSize: 12.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(320.w, 40.h),
                      backgroundColor: tPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                  onPressed: () {},
                  child: Text(
                    "MASUK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.85,
                    ),
                  ))
            ])));
  }
}
