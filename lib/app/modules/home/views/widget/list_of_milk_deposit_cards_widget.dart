import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/home/controllers/home_controller.dart';

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
          child: SizedBox(
            width: 300.w,
            height: 120.h,
            child: Container(
              padding: EdgeInsets.all(20.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // * card title
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          "21102100201",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: tBlackColor,
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                          width: 180.w,
                          child: Text.rich(
                              TextSpan(locale: const Locale("id"), children: [
                            TextSpan(
                              text: "21/10/2021",
                              style: TextStyle(
                                color: tBlackColor.withOpacity(0.8),
                                fontSize: 13.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "  9 : 37",
                              style: TextStyle(
                                color: tBlackColor.withOpacity(0.8),
                                fontSize: 13.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: " (Pagi)",
                              style: TextStyle(
                                color: tBlackColor.withOpacity(0.8),
                                fontSize: 13.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]))),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Volume susu",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.800000011920929),
                          fontSize: 13.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  // * card icon
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.verified,
                        color: tGreenColor,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                          child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "24.39",
                            style: TextStyle(
                              color: tBlackColor,
                              fontSize: 14.sp,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text: " Liter",
                            style: TextStyle(
                              color: tBlackColor,
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            )),
                      ])))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
