import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/qr_code/views/qr_code_view.dart';

import '../controllers/bottom_navigation_bar_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: tBackgroundColor,
      body: Stack(
        children: [
          Obx(() => controller.screens[controller.selectedIndex.value].page()),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: 80.h,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80.h),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.9,
                    child: FloatingActionButton(
                      elevation: 4,
                      backgroundColor: tSecondaryColor,
                      onPressed: () {
                        // Memanggil qrCodeView dengan benar
                        Get.to(qrCodeView(context));
                      },
                      child: const Icon(Icons.qr_code_scanner_rounded),
                    ),
                  ),
                  Obx(() => SizedBox(
                        width: size.width,
                        height: 80.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (() {
                                controller.selectedIndex.value = 0;
                              }),
                              child: VxBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    controller.selectedIndex.value == 0
                                        ? const Icon(
                                            Iconsax.home_15,
                                            color: tPrimaryColor,
                                          ).iconSize(25)
                                        : Icon(
                                            Iconsax.home,
                                            color: tHintColor,
                                          ).iconSize(25),
                                    const Text("Beranda")
                                        .text
                                        .size(10)
                                        .medium
                                        .color(
                                            controller.selectedIndex.value == 0
                                                ? tPrimaryColor
                                                : tHintColor)
                                        .make()
                                  ],
                                ),
                              ).width(60).make(),
                            ),
                            InkWell(
                              onTap: (() {
                                controller.selectedIndex.value = 1;
                              }),
                              child: VxBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    controller.selectedIndex.value == 1
                                        ? const Icon(
                                            Icons.my_library_books_rounded,
                                            color: tPrimaryColor,
                                          ).iconSize(25)
                                        : Icon(
                                            Icons.my_library_books_outlined,
                                            color: tHintColor,
                                          ).iconSize(25),
                                    const Text("Riwayat")
                                        .text
                                        .size(10)
                                        .medium
                                        .color(
                                            controller.selectedIndex.value == 1
                                                ? tPrimaryColor
                                                : tHintColor)
                                        .make()
                                  ],
                                ),
                              ).width(60).make(),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = tWhiteColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20.h);
    path.quadraticBezierTo(0.20.sw, 0, 0.35.sw, 0);
    path.quadraticBezierTo(0.40.sw, 0, 0.40.sw, 20.h);
    path.arcToPoint(Offset(0.60.sw, 20.h),
        radius: Radius.circular(10.r), clockwise: false);
    path.quadraticBezierTo(0.60.sw, 0, 0.65.sw, 0);
    path.quadraticBezierTo(0.80.sw, 0, 1.sw, 20.h);
    path.lineTo(1.sw, 1.sh);
    path.lineTo(0, 1.sh);
    path.close();

    canvas.drawShadow(path, Colors.black, 5.w, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
