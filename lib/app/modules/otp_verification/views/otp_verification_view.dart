import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({Key? key}) : super(key: key);
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
              height: 30.h,
            ),
            SizedBox(
              width: 120.w,
              child: Image.asset("assets/images/otp_image.png"),
            ),
            SizedBox(height: 40.h),
            Container(
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250.w,
                    child: Text(
                      'Masukkan Kode OTP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'Coba cek di sms kamu!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 72.w,
                    child: Text(
                      "01 : 23",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.sp,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  OTPTextField(
                    controller: controller.otpFieldController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45.w,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15.r,
                    style: TextStyle(fontSize: 17.sp),
                    onChanged: (pin) {
                      debugPrint("Changed: $pin");
                    },
                    // onCompleted: (pin) {
                    //   pin = otp;
                    //   OtpController.instance.verifyOTP(otp);
                    //   // print("Completed: " + pin);
                    // }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kode otp belum terkirim ya?",
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Poppins",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 90.w,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Kirim ulang",
                              style: TextStyle(
                                color: const Color(0xFF027ABF),
                                fontSize: 12.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 60.h),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(320.w, 40.h),
                          backgroundColor: tPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      onPressed: () {
                        Get.toNamed(Routes.CREATE_NEW_PASSWORD);
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
            )
          ],
        ),
      ),
    ));
  }
}
