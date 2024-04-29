import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tBackgroundColor,
        appBar: AppBar(
          title: const Text('Notification')
              .text
              .size(17)
              .semiBold
              .color(tWhiteColor.withOpacity(0.9))
              .letterSpacing(0.9)
              .make(),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_rounded).iconSize(23)),
        ),
        body: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            children: [
              VxBox(
                child: ListView.builder(
                  itemCount: 12,
                  padding: EdgeInsets.only(bottom: 20.h),
                  itemBuilder: (BuildContext context, int index) {
                    return const ListNotifications();
                  },
                ),
              ).height(context.screenHeight * 0.9).make(),
            ],
          ),
        ));
  }
}

class ListNotifications extends StatelessWidget {
  const ListNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("KPS BOGOR").text.size(14).semiBold.justify.make(),
            const Text("Transaksi 14102100202 Berhasil")
                .text
                .size(14)
                .semiBold
                .color(tBlackColor.withOpacity(0.6))
                .justify
                .make(),
          ],
        ),
        Column(
          children: [
            const Text("Sen")
                .text
                .size(13)
                .semiBold
                .color(tBlackColor.withOpacity(0.6))
                .justify
                .make(),
            const Text("10:37")
                .text
                .size(13)
                .semiBold
                .color(tBlackColor.withOpacity(0.6))
                .justify
                .make(),
          ],
        )
      ],
    )).width(context.screenWidth).height(50).make().p16();
  }
}
