import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/transaction_history/views/widget/date_range_picker/custom_date_range_picker.dart';
import 'package:milkymo/app/modules/transaction_history/views/widget/list_transaction_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/transaction_history_controller.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        elevation: 0,
        shadowColor: tBlackColor,
        title: const Text("Riwayat Transaksi")
            .text
            .size(17)
            .semiBold
            .color(tWhiteColor.withOpacity(0.9))
            .make(),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(context.screenWidth, context.screenHeight * 0.14),
          child: Container(
            color: tBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VxBox().height(5).make(),
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
                    child: VxBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          VxBox(
                            child: const Icon(
                              Iconsax.calendar_search,
                            ).iconSize(23),
                          ).width(25).make().pSymmetric(h: 5),
                          VxBox(
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
                                  )
                                      .text
                                      .size(13)
                                      .semiBold
                                      .color(tBlackColor.withOpacity(0.6))
                                      .justify
                                      .make();
                                } else {
                                  return const Text(
                                          'Tidak ada tanggal yang dipilih')
                                      .text
                                      .size(13)
                                      .semiBold
                                      .color(tBlackColor.withOpacity(0.6))
                                      .justify
                                      .make();
                                }
                              },
                            ),
                          ).width(250).make().pOnly(left: 5),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                          ).iconSize(23)
                        ],
                      ),
                    ).width(320).height(50).make(),
                  ),
                ).paddingOnly(bottom: 10),
                SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.05,
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
                                    child: Text(controller.tabs[index])
                                        .text
                                        .size(14)
                                        .semiBold
                                        .color(controller.current.value == index
                                            ? tSecondaryColor
                                            : tHintColor)
                                        .make(),
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
      ),
      backgroundColor: tBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            VxBox(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 30.h),
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
            ).height(context.screenHeight * 0.65).make().p(10),
          ],
        ),
      ),
    );
  }
}
