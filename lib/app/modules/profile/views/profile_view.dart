import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/data/repositories/auth_repository.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tBackgroundColor,
        appBar: AppBar(
          title: const Text('Profile')
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
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: VxBox(
                      child: CircleAvatar(
                        backgroundColor: tWhiteColor,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            const Icon(Iconsax.profile_circle)
                                .iconSize(100)
                                .iconColor(tBlackColor),
                            Positioned(
                              bottom: 0,
                              right: 30,
                              child: InkWell(
                                onTap: () {},
                                child: VxBox(
                                        child: const Icon(Iconsax.pen_add)
                                            .iconSize(23)
                                            .iconColor(tBlackColor))
                                    .width(40)
                                    .height(40)
                                    .withDecoration(const BoxDecoration(
                                        color: Vx.blue200,
                                        shape: BoxShape.circle))
                                    .make(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ).width(100).height(120).make(),
                  ).pOnly(bottom: 50),
                  VxBox(
                          child: const Text("Nama Lengkap")
                              .text
                              .size(14)
                              .semiBold
                              .color(tBlackColor)
                              .make())
                      .width(context.screenWidth)
                      .make()
                      .pOnly(left: 30),
                  Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () async {
                        // transactionHistoryTableCalender(context);
                      },
                      child: VxBox(
                        child: Obx(() => VxBox(
                                child: Text(controller.userName.value)
                                    .text
                                    .size(13)
                                    .semiBold
                                    .minFontSize(13)
                                    .color(tBlackColor.withOpacity(0.6))
                                    .justify
                                    .ellipsis
                                    .make())
                            .make()).pSymmetric(v: 12, h: 20),
                      ).width(context.screenWidth).height(50).make(),
                    ),
                  ).paddingOnly(bottom: 10),
                  VxBox(
                          child: const Text("ID Peternak")
                              .text
                              .size(14)
                              .semiBold
                              .color(tBlackColor)
                              .make())
                      .width(context.screenWidth)
                      .make()
                      .pOnly(left: 30),
                  Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () async {
                        // transactionHistoryTableCalender(context);
                      },
                      child: VxBox(
                        child: VxBox(
                                child: Text(controller.userId.value)
                                    .text
                                    .size(13)
                                    .minFontSize(13)
                                    .semiBold
                                    .color(tBlackColor.withOpacity(0.6))
                                    .justify
                                    .ellipsis
                                    .make())
                            .make()
                            .pSymmetric(v: 12, h: 20),
                      ).width(context.screenWidth).height(50).make(),
                    ),
                  ).paddingOnly(bottom: 10),
                  VxBox(
                          child: const Text("Nomor HP / Telepon")
                              .text
                              .size(14)
                              .semiBold
                              .color(tBlackColor)
                              .make())
                      .width(context.screenWidth)
                      .make()
                      .pOnly(left: 30),
                  Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () async {
                        // transactionHistoryTableCalender(context);
                      },
                      child: VxBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            VxBox(
                                    child: Text(controller.phoneNumber.value)
                                        .text
                                        .size(13)
                                        .minFontSize(13)
                                        .semiBold
                                        .color(tBlackColor.withOpacity(0.6))
                                        .justify
                                        .ellipsis
                                        .make())
                                .width(270)
                                .make(),
                            const Icon(
                              Iconsax.pen_add,
                            ).iconSize(23)
                          ],
                        ).pSymmetric(v: 12, h: 20),
                      ).width(context.screenWidth).height(50).make(),
                    ),
                  ).paddingOnly(bottom: 10),
                  VxBox(
                          child: const Text("Alamat")
                              .text
                              .size(14)
                              .semiBold
                              .color(tBlackColor)
                              .make())
                      .width(context.screenWidth)
                      .make()
                      .pOnly(left: 30),
                  Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () async {},
                      child: VxBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            VxBox(
                                    child: Text(controller.address.value)
                                        .text
                                        .size(13)
                                        .minFontSize(13)
                                        .semiBold
                                        .color(tBlackColor.withOpacity(0.6))
                                        .justify
                                        .ellipsis
                                        .maxLines(1)
                                        .make())
                                .width(270)
                                .make(),
                            const Icon(
                              Iconsax.pen_add,
                            ).iconSize(23)
                          ],
                        ).pSymmetric(v: 12, h: 20),
                      ).width(context.screenWidth).height(50).make(),
                    ),
                  ).paddingOnly(bottom: 20),
                  VxBox(
                    child: TextButton(
                        onPressed: () {
                          AuthRepository.instance.logout();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("KELUAR")
                                .text
                                .size(15)
                                .color(Vx.red500)
                                .semiBold
                                .make(),
                            const Icon(Icons.logout)
                                .iconSize(23)
                                .iconColor(Vx.red500)
                          ],
                        )),
                  ).width(120).make()
                ],
              ),
            ).p(25)));
  }
}
