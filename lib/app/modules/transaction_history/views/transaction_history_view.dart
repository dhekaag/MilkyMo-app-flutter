import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/home/views/widget/date_range_picker/custom_date_range_picker.dart';
import 'package:milkymo/app/modules/home/views/widget/list_of_milk_deposit_cards_widget.dart';
import 'package:milkymo/app/modules/transaction_history/views/widget/date_range_picker/custom_date_range_picker.dart';
import 'package:milkymo/app/modules/transaction_history/views/widget/list_transaction_widget.dart';

import '../controllers/transaction_history_controller.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  const TransactionHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBackgroundColor,
        foregroundColor: tBlackColor,
        elevation: 0,
        shadowColor: tBlackColor,
        title: Text(
          "Riwayat Transaksi",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(size.width, 100.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () async {
                    transactionHistoryTableCalender(context);
                  },
                  child: SizedBox(
                    width: 300.w,
                    height: 50.h,
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
                          width: 230.w,
                          child: Obx(
                            () {
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
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 12.sp,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              } else {
                                return Text(
                                  'Tidak ada tanggal yang dipilih',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 12.sp,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              }
                            },
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
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: size.width,
                height: size.height * 0.05,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: size.width,
                        height: size.height * 0.04,
                        child: ListView.builder(
                          itemCount: controller.tabs.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(
                              () => GestureDetector(
                                onTap: () => controller.current.value = index,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Text(
                                    controller.tabs[index],
                                    style: TextStyle(
                                      color: controller.current.value == index
                                          ? const Color(0xFF009FE9)
                                          : tHintColor,
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () => AnimatedPositioned(
                        bottom: 0,
                        left: controller.changePositionedOfLine(),
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          margin: const EdgeInsets.only(left: 10),
                          duration: const Duration(milliseconds: 500),
                          width: controller.changeContainerWidth(),
                          height: size.height * 0.008,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF009FE9),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: tBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
              height: 500.h,
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 100.r),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Divider(
                        color: tHintColor,
                      ),
                      const ListTransactionWidget(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
