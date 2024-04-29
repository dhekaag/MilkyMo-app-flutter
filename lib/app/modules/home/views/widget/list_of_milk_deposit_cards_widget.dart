// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:milkymo/app/constant/colors.dart';

// ignore: must_be_immutable
class ListOfMilkDepositCardsWidget extends StatelessWidget {
  String? idPeternak;
  String? tanggal;
  String? waktu;
  String? jam;
  String? volumeSusu;
  ListOfMilkDepositCardsWidget({
    super.key,
    this.idPeternak,
    this.tanggal,
    this.jam,
    this.waktu,
    this.volumeSusu,
  });
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
                            child: Text(idPeternak.toString())
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
                      TextSpan(text: tanggal.toString())
                          .textSpan
                          .size(13)
                          .semiBold
                          .color(tBlackColor.withOpacity(0.8))
                          .make(),
                      // * ============================================
                      TextSpan(text: ",  ${jam.toString()}")
                          .textSpan
                          .size(13)
                          .semiBold
                          .color(tBlackColor.withOpacity(0.8))
                          .make(),
                      // * ============================================
                      TextSpan(text: "  ( ${waktu.toString()} )")
                          .textSpan
                          .size(13)
                          .semiBold
                          .color(tBlackColor.withOpacity(0.8))
                          .make()
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
                            child: Text("${volumeSusu.toString()} Liter")
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
