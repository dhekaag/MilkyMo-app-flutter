import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/home_controller.dart';
import 'date_range_picker/custom_date_range_picker.dart';
import 'dropdown_search_widget.dart';

class RowTimepicker extends StatelessWidget {
  const RowTimepicker({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () async {
                homeTableCalender(context);
              },
              child: SizedBox(
                width: 220.w,
                height: 25.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    VxBox(
                      child: const Icon(
                        Iconsax.calendar_search,
                      ).iconSize(20),
                    ).width(25).make().pSymmetric(h: 5),
                    VxBox(
                      child: Obx(() {
                        final rangeStart = controller.rangeStart?.value;
                        final rangeEnd = controller.rangeEnd?.value;

                        if (rangeStart != null && rangeEnd != null) {
                          return Text(
                            "${rangeStart.day} "
                            "${DateFormat("MMM", "id_ID").format(rangeStart)} "
                            "${rangeStart.year} - "
                            "${rangeEnd.day} "
                            "${DateFormat("MMM", "id_ID").format(rangeEnd)} "
                            "${rangeEnd.year}",
                          )
                              .text
                              .size(12)
                              .semiBold
                              .color(Vx.black.withOpacity(0.6))
                              .justify
                              .maxLines(1)
                              .ellipsis
                              .make();
                        } else {
                          return const Text('Tidak ada tanggal yang dipilih')
                              .text
                              .size(12)
                              .semiBold
                              .color(Vx.black.withOpacity(0.6))
                              .justify
                              .make();
                        }
                      }),
                    ).width(180).make(),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ).iconSize(23)
                  ],
                ),
              ),
            ),
          ),
          // * dropdown time button
          const CustomDropDownWidget(),
        ],
      ),
    );
  }
}
