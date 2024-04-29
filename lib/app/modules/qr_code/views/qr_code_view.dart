import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/qr_code/controllers/qr_code_controller.dart';
import 'package:velocity_x/velocity_x.dart';

Future qrCodeView(BuildContext context) {
  QrCodeController controller = Get.find();
  return Get.bottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: true,
      Container(
        height: context.screenHeight * 0.80,
        decoration: const BoxDecoration(
          color: tBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            VxBox()
                .width(50)
                .height(5)
                .withDecoration(BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: tHintColor))
                .make()
                .pOnly(bottom: 20),
            VxBox(
                    child: const Text("Kode Member")
                        .text
                        .size(17)
                        .bold
                        .color(tBlackColor)
                        .justify
                        .make())
                .make(),
            const Divider(
              color: Colors.black26,
            ).pOnly(bottom: 20),
            VxBox(
                    child: Text(controller.userName.value!)
                        .text
                        .size(16)
                        .semiBold
                        .color(tBlackColor)
                        .make())
                .make()
                .pOnly(bottom: 5),
            VxBox(
                    child: Text(controller.userId.value!)
                        .text
                        .size(15)
                        .medium
                        .color(tBlackColor)
                        .justify
                        .make())
                .make()
                .pOnly(bottom: 40),
            VxBox(
              child: Center(child: Image.asset("assets/images/qr_code.png")),
            )
                .width(300)
                .height(250)
                .withDecoration(BoxDecoration(
                    color: tWhiteColor,
                    borderRadius: BorderRadius.circular(15)))
                .make()
                .pOnly(bottom: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(300.w, 30.h),
                    backgroundColor: tPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                onPressed: () {
                  Get.back();
                },
                child: const Text("KEMBALI")
                    .text
                    .size(14)
                    .semiBold
                    .color(tWhiteColor)
                    .letterSpacing(0.85)
                    .make())
          ],
        ).pSymmetric(h: 20, v: 10),
      ));
}
