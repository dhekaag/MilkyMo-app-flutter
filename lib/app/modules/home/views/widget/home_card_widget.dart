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
            height: 140.h,
            child: Container(
              padding: EdgeInsets.fromLTRB(20.r, 5.r, 20.r, 20.r),
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
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.75,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 10.r),
                          width: 70.w,
                          child: Image.asset("assets/icons/icon_milk_can.png")),
                      Container(
                        padding: EdgeInsets.only(left: 10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60.w,
                              child: Text(
                                "Tanggal",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 115.w,
                              child: Text(
                                "23 Oktober 2021",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 14.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                              child: Text(
                                "Waktu",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.r),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 30.w,
                                    child: Text(
                                      '9:37',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 14.sp,
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
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 14.sp,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
