import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:milkymo/app/modules/home/controllers/home_controller.dart';
import 'package:milkymo/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

class TopHomeAppBarWidget extends StatelessWidget {
  const TopHomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Row(
      children: [
        CircleAvatar(
          radius: 25.r,
          foregroundImage: const AssetImage("assets/icons/icon_profile.png"),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50.w,
              child: const Text("Halo!")
                  .text
                  .size(15)
                  .semiBold
                  .color(Vx.white.withOpacity(0.9))
                  .make(),
            ).pOnly(bottom: 2),
            Obx(
              () => Text(controller.userName.value.toString())
                  .text
                  .size(14)
                  .semiBold
                  .color(Vx.white.withOpacity(0.75))
                  .make()
                  .w(185),
            )
            // controller.obx(
            //     (state) => Text(state!)
            //         .text
            //         .size(14)
            //         .semiBold
            //         .color(Vx.white.withOpacity(0.75))
            //         .make()
            //         .w(185),
            //     onLoading: VxShimmer(
            //         child: VxBox()
            //             .color(tWhiteColor)
            //             .width(150)
            //             .height(20)
            //             .make()),
            //     onEmpty: const Text("Maaf data kamu tidak ditemukan")
            //         .text
            //         .size(14)
            //         .semiBold
            //         .color(Vx.white.withOpacity(0.75))
            //         .make()
            //         .w(185))
          ],
        ),
        CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.3),
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.NOTIFICATION);
                    },
                    icon: const Icon(
                      Iconsax.notification,
                      color: Colors.white,
                    ).iconSize(25)))
            .pOnly(right: 5),
        CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.3),
            child: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.PROFILE);
                },
                icon: const Icon(
                  Iconsax.setting_2,
                  color: Colors.white,
                ).iconSize(25))),
      ],
    );
  }
}
