import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeBodyTitle extends StatelessWidget {
  const HomeBodyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxBox(
                    child: const Text("Cari Setoran Susu")
                        .text
                        .size(16)
                        .semiBold
                        .color(tBlackColor)
                        .letterSpacing(0.9)
                        .justify
                        .make())
                .width(190)
                .make()
                .pOnly(bottom: 5),
            VxBox(
              child: const Text("Pada Tanggal :")
                  .text
                  .size(13)
                  .semiBold
                  .color(tBlackColor)
                  .letterSpacing(0.7)
                  .justify
                  .make(),
            ).width(150).make(),
          ],
        ));
  }
}
