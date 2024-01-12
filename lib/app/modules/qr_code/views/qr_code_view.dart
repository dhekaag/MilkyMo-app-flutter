import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:milkymo/app/constant/colors.dart';

Future qrCodeView(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Get.bottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: true,
      Container(
        height: size.height * 0.83,
        decoration: const BoxDecoration(
          color: tBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
          child: Column(
            children: [
              Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                    color: tHintColor,
                    borderRadius: BorderRadius.circular(20.r)),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                child: Text(
                  "Kode Member",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Jajat Sudrajat",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "22314576093",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 300.w,
                height: 250.h,
                decoration: BoxDecoration(
                    color: tWhiteColor,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Center(child: Image.asset("assets/images/qr_code.png")),
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(300.w, 30.h),
                      backgroundColor: tPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "KEMBALI",
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
