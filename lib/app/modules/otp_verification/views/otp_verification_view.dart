import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:velocity_x/velocity_x.dart';
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
            VxBox(
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_rounded).iconSize(23)),
            ).alignTopLeft.make().pSymmetric(v: 30),
            VxBox().height(35).make(),
            VxBox(
              child: Image.asset("assets/images/otp_image.png"),
            ).width(125).make(),
            VxBox().height(20).make(),
            Container(
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VxBox(
                    child: const Text('Masukkan Kode OTP')
                        .text
                        .size(17)
                        .semiBold
                        .color(tBlackColor)
                        .center
                        .make(),
                  ).width(255).make(),
                  VxBox(
                    child: const Text('Coba cek di sms kamu!')
                        .text
                        .size(12)
                        .semiBold
                        .color(Colors.black45)
                        .make(),
                  ).make(),
                  VxBox(
                    child: const Text("01 : 23")
                        .text
                        .size(12)
                        .medium
                        .color(Colors.black54)
                        .center
                        .make(),
                  ).width(75).make(),
                  SizedBox(
                    height: 10.h,
                  ),
                  OTPTextField(
                    controller: controller.otpFieldController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45,
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
                      const Text("Kode otp belum terkirim ya?")
                          .text
                          .size(12)
                          .medium
                          .color(Colors.black54)
                          .make(),
                      VxBox(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text("Kirim ulang")
                                .text
                                .size(12)
                                .semiBold
                                .color(tSecondaryColor)
                                .justify
                                .make()),
                      ).width(95).make()
                    ],
                  ),
                  SizedBox(height: 60.h),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(300.w, 30.h),
                          backgroundColor: tPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      onPressed: () {
                        Get.toNamed(Routes.CREATE_NEW_PASSWORD);
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
            )
          ],
        ),
      ),
    ));
  }
}
