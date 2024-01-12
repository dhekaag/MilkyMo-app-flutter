import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkymo/app/constant/colors.dart';

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
              SizedBox(
                width: 100.w,
                child: Text(
                  "21102100201",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: tBlackColor,
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                  width: 180.w,
                  child:
                      Text.rich(TextSpan(locale: const Locale("id"), children: [
                    TextSpan(
                      text: "21/01/2024",
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
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: tGreenColor,
                    size: 20.w,
                  )),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                  width: 80.w,
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "24.39",
                        style: TextStyle(
                          color: tBlackColor,
                          fontSize: 13.sp,
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
    );
  }
}
