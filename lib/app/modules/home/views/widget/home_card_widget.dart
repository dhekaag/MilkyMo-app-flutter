import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkymo/app/constant/colors.dart';

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
          child: SizedBox(
            width: 320.w,
            height: 130.h,
            child: Container(
              padding: EdgeInsets.fromLTRB(15.r, 5.r, 10.r, 10.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      'Penyerahan Susu Terakhir',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: tBlackColor,
                        fontSize: 13.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.75,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 10.r),
                          width: 70.w,
                          child: Image.asset("assets/icons/icon_milk_can.png")),
                      Container(
                        padding: EdgeInsets.only(left: 5.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60.w,
                              child: Text(
                                "Tanggal",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                "23 November 2021",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 13.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                              child: Text(
                                "Waktu",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 35.w,
                                  child: Text(
                                    '09:37',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 13.sp,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  child: Text(
                                    "Pagi",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 13.sp,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.r),
                            child: Icon(
                              Icons.verified,
                              color: tGreenColor,
                              size: 20.w,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
