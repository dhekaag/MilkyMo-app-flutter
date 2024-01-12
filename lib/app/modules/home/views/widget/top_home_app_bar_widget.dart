import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/routes/app_pages.dart';

class TopHomeAppBarWidget extends StatelessWidget {
  const TopHomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.r, bottom: 20.r),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            foregroundImage: const AssetImage("assets/icons/icon_profile.png"),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50.w,
                child: Text(
                  'Halo!',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 150.w,
                child: Text(
                  'Jajat Sudrajat',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.3),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.notification,
                    color: Colors.white,
                  ))),
          SizedBox(
            width: 5.w,
          ),
          CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.3),
              child: IconButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  icon: const Icon(
                    Iconsax.setting_2,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
