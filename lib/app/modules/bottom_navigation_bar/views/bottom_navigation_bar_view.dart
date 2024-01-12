import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/qr_code/views/qr_code_view.dart';

import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: tBackgroundColor,
        body: Stack(
          children: [
            Obx(() =>
                controller.screens[controller.selectedIndex.value].page()),
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
                          heightFactor: 0.6,
                          child: FloatingActionButton(
                            elevation: 6,
                            backgroundColor: tSecondaryColor,
                            onPressed: () {
                              qrCodeView(context);
                            },
                            child: const Icon(Icons.qr_code_scanner_rounded),
                          )),
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
                                  child: SizedBox(
                                    width: 50.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        controller.selectedIndex.value == 0
                                            ? Icon(
                                                Iconsax.home_15,
                                                size: 25.w,
                                                color: tPrimaryColor,
                                              )
                                            : Icon(
                                                Iconsax.home,
                                                size: 25.w,
                                                color: tHintColor,
                                              ),
                                        Text(
                                          "Beranda",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: controller.selectedIndex
                                                          .value ==
                                                      0
                                                  ? tPrimaryColor
                                                  : tHintColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (() {
                                    controller.selectedIndex.value = 1;
                                  }),
                                  child: SizedBox(
                                    width: 50.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        controller.selectedIndex.value == 1
                                            ? Icon(
                                                Icons.my_library_books_rounded,
                                                size: 25.w,
                                                color: tPrimaryColor,
                                              )
                                            : Icon(
                                                Icons.my_library_books_outlined,
                                                size: 25.w,
                                                color: tHintColor,
                                              ),
                                        Text(
                                          "Riwayat",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: controller.selectedIndex
                                                          .value ==
                                                      1
                                                  ? tPrimaryColor
                                                  : tHintColor),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  )),
            ),
          ],
        ));
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = tWhiteColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.r), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
