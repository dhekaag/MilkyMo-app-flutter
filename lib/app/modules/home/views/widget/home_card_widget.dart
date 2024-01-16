import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: tBackgroundColor,
        shadowColor: Colors.black.withOpacity(0.8),
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: Container(
            padding: EdgeInsets.all(5.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Penyerahan Susu Terakhir")
                    .text
                    .size(14)
                    .bold
                    .letterSpacing(0.75)
                    .color(tBlackColor)
                    .center
                    .make()
                    .pOnly(top: 2, bottom: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VxBox(child: Image.asset("assets/icons/icon_milk_can.png"))
                        .height(80)
                        .make()
                        .pOnly(top: 5),
                    VxBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Tanggal")
                              .text
                              .size(14)
                              .medium
                              .make()
                              .box
                              .width(70)
                              .make(),
                          // * ===============================
                          const Text("23 November 2024")
                              .text
                              .justify
                              .size(14)
                              .minFontSize(14)
                              .medium
                              .color(Vx.black.withOpacity(0.6))
                              .ellipsis
                              .maxLines(1)
                              .make()
                              .box
                              .width(143)
                              .make(),
                          // * =================================
                          const Text("Waktu")
                              .text
                              .size(14)
                              .medium
                              .justify
                              .make()
                              .box
                              .width(60)
                              .make(),
                          // * =================================
                          Row(
                            children: [
                              const Text("09:37")
                                  .text
                                  .size(14)
                                  .medium
                                  .color(Vx.black.withOpacity(0.6))
                                  .maxLines(1)
                                  .ellipsis
                                  .make()
                                  .box
                                  .width(45)
                                  .make()
                                  .pOnly(right: 5.w),
                              // * =================================
                              const Text("Pagi")
                                  .text
                                  .size(14)
                                  .medium
                                  .color(Vx.black.withOpacity(0.6))
                                  .make()
                                  .box
                                  .width(45)
                                  .make()
                            ],
                          )
                        ],
                      ),
                    ).make().pOnly(left: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.verified,
                          color: tGreenColor,
                        ).iconSize(22).pOnly(right: 10.w, bottom: 30.h),
                        // * =================================
                        VxBox(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("24.39")
                                .text
                                .size(14)
                                .semiBold
                                .color(tBlackColor)
                                .maxLines(1)
                                .ellipsis
                                .make()
                                .box
                                .width(47)
                                .make(),
                            const Text("Liter")
                                .text
                                .size(14)
                                .semiBold
                                .minFontSize(14)
                                .color(tBlackColor)
                                .maxLines(1)
                                .ellipsis
                                .make()
                                .box
                                .width(35)
                                .make(),
                          ],
                        )).width(90).make()
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ).box.width(400).height(140).make(),
      ),
    );
  }
}
