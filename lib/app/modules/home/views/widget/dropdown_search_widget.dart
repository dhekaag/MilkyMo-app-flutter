import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

final _controller = HomeController.instance;

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          clipBehavior: Clip.hardEdge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () async {
              showPopover(
                context: context,
                bodyBuilder: (context) => const ListItems(),
                onPop: () => print('Popover was popped!'),
                direction: PopoverDirection.bottom,
                backgroundColor: Colors.white,
                arrowDxOffset: 30.r,
                width: 75.w,
                height: 130.h,
                arrowHeight: 15,
                arrowWidth: 30,
              );
            },
            child: SizedBox(
              width: 75.w,
              height: 25.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 44.w,
                    child: Text(
                      _controller.selectedDropDownValue!.value,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
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
        ));
  }
}

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * 1st menu option
        InkWell(
          onTap: () {
            _controller.selectedDropDownValue?.value = "Pagi";
            Get.back();
          },
          child: Container(
            height: 40.h,
            color: Colors.white,
            child: Center(
              child: Text(
                "Pagi",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
            ),
          ),
        ),
        Divider(
          height: 5.h,
          color: tHintColor,
        ),
        // * 2nd menu option
        InkWell(
          onTap: () {
            _controller.selectedDropDownValue?.value = "Sore";
            Get.back();
          },
          child: Container(
            height: 40.h,
            color: Colors.white,
            child: Center(
                child: Text(
              "Sore",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            )),
          ),
        ),
        Divider(
          height: 5.h,
          color: tHintColor,
        ),
        // * 3rd menu option
        InkWell(
          onTap: () {
            _controller.selectedDropDownValue?.value = "Semua";
            Get.back();
          },
          child: Container(
            height: 40.h,
            color: Colors.white,
            child: Center(
                child: Text(
              "Semua",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            )),
          ),
        ),
      ],
    );
  }
}
