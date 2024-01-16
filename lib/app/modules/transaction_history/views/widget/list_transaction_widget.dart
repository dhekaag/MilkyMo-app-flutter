import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ListTransactionWidget extends StatelessWidget {
  const ListTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxBox(
                      child: const Text("21102100201")
                          .text
                          .size(14)
                          .semiBold
                          .color(tBlackColor)
                          .justify
                          .make())
                  .width(150)
                  .make(),
              VxBox(
                  child:
                      Text.rich(TextSpan(locale: const Locale("id"), children: [
                const TextSpan(text: "21/01/2024")
                    .textSpan
                    .size(14)
                    .semiBold
                    .color(tBlackColor.withOpacity(0.8))
                    .make(),
                const TextSpan(text: "  9 : 37")
                    .textSpan
                    .size(14)
                    .semiBold
                    .color(tBlackColor.withOpacity(0.8))
                    .make(),
                const TextSpan(text: " (Pagi)")
                    .textSpan
                    .size(14)
                    .semiBold
                    .color(tBlackColor.withOpacity(0.8))
                    .make(),
              ]))).width(200).make(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              VxBox(
                      child: const Icon(Icons.arrow_upward_rounded)
                          .iconSize(23)
                          .iconColor(tGreenColor))
                  .make()
                  .pOnly(right: 5, bottom: 5),
              VxBox(
                  child: Text.rich(TextSpan(children: [
                const TextSpan(text: "24.39")
                    .textSpan
                    .size(14)
                    .semiBold
                    .color(tBlackColor)
                    .make(),
                const TextSpan(text: " Liter")
                    .textSpan
                    .size(14)
                    .semiBold
                    .color(tBlackColor)
                    .make(),
              ]))).width(90).make()
            ],
          )
        ],
      ),
    );
  }
}
