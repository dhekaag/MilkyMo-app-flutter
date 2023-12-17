import 'dart:ffi';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/home/views/widget/dropdown_search_widget.dart';
import 'package:milkymo/app/modules/home/views/widget/home_card_widget.dart';
import 'package:milkymo/app/modules/home/views/widget/top_home_app_bar_widget.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: tBackgroundColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: 390.w,
              height: 230.h,
              decoration: ShapeDecoration(
                color: tPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.r),
                      bottomRight: Radius.circular(30.r)),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopHomeAppBarWidget(),
                  const HomeCardWidget(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              "Cari Setoran Susu",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: tBlackColor,
                                fontSize: 16.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.90,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            child: Text(
                              "Pada Tanggal : ",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: tBlackColor,
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.70,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Obx(() => Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                    locale: const Locale("id"),
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  );
                                  if (newDate != null) {
                                    controller.selectedTime.value =
                                        DateFormat("EEEE, d MMMM y", "id_ID")
                                            .format(newDate);
                                  }
                                  // controller.showDateRangePickerAndUpdateValue(
                                  //     context);
                                },
                                child: SizedBox(
                                  width: 230.w,
                                  height: 30.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                        child: Icon(
                                          Iconsax.calendar_search,
                                          size: 20.w,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      SizedBox(
                                        width: 170.w,
                                        child: Text(
                                          "${controller.dateTimeRange.value.start.day} "
                                          "${DateFormat("MMM", "id_ID").format(controller.dateTimeRange.value.start)} " // Menggunakan DateFormat langsung pada DateTime
                                          "${controller.dateTimeRange.value.start.year}  "
                                          "-  ${controller.dateTimeRange.value.end.day} "
                                          "${DateFormat("MMM", "id_ID").format(controller.dateTimeRange.value.end)} " // Menggunakan DateFormat langsung pada DateTime
                                          "${controller.dateTimeRange.value.end.year}",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontSize: 12.sp,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 20.w,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        // * dropdown time button
                        const CustomDropDownWidget()
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.exit_to_app),
          onPressed: () {
            Get.offAllNamed(Routes.LOGIN);
          }),
    );
  }
}
