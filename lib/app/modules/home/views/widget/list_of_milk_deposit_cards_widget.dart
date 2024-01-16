import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ListOfMilkDepositCardsWidget extends StatelessWidget {
  const ListOfMilkDepositCardsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
        color: tWhiteColor,
        shadowColor: Colors.black.withOpacity(0.8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: VxBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // * card title
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxBox(
                            child: const Text("21102100201")
                                .text
                                .size(14)
                                .color(tBlackColor)
                                .semiBold
                                .justify
                                .maxLines(1)
                                .ellipsis
                                .make())
                        .width(100)
                        .make(),
                    // ? ============================================
                    VxBox(
                        child: Text.rich(
                            TextSpan(locale: const Locale("id"), children: [
                      const TextSpan(text: "21/10/2021")
                          .textSpan
                          .size(13)
                          .semiBold
                          .color(tBlackColor.withOpacity(0.8))
                          .make(),
                      // * ============================================
                      const TextSpan(text: "  9:37")
                          .textSpan
                          .size(13)
                          .semiBold
                          .color(tBlackColor.withOpacity(0.8))
                          .make(),
                      // * ============================================
                      const TextSpan(text: "  ( Pagi )")
                          .textSpan
                          .size(13)
                          .semiBold
                          .color(tBlackColor.withOpacity(0.8))
                          .make(),
                    ]))).width(190).make(),
                    // ? ============================================
                    VxBox(
                            child: const Text("Volume susu")
                                .text
                                .size(13)
                                .semiBold
                                .color(tBlackColor.withOpacity(0.8))
                                .justify
                                .make())
                        .width(100)
                        .make()
                  ],
                ).pOnly(left: 5),
                // * card icon
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.verified,
                      color: tGreenColor,
                    ).iconSize(20).pOnly(right: 10, bottom: 10),
                    // ? ======================================
                    VxBox(
                            child: const Text("24.39 Liter")
                                .text
                                .size(14)
                                .semiBold
                                .color(tBlackColor)
                                .maxLines(1)
                                .ellipsis
                                .make())
                        .width(85)
                        .make()
                  ],
                )
              ],
            ).p12(),
          ).width(300).height(92).make(),
        ));
  }
}
