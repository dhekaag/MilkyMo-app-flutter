import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/home/views/widget/home_card_widget.dart';
import 'package:milkymo/app/modules/home/views/widget/list_of_milk_deposit_cards_widget.dart';
import 'package:milkymo/app/modules/home/views/widget/top_home_app_bar_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/home_controller.dart';
import 'widget/home_body_title_widget.dart';
import 'widget/row_time_picker_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: context.screenWidth,
              height: context.screenHeight,
              child: Stack(
                children: [
                  Container(
                    width: context.screenWidth,
                    height: 50.h,
                    color: tPrimaryColor,
                  ),
                  Container(
                    width: context.screenWidth,
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
                  ).h(190).safeArea(),
                  Padding(
                    padding: EdgeInsets.all(25.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopHomeAppBarWidget()
                            .pOnly(bottom: 30)
                            .safeArea(),
                        const HomeCardWidget().pOnly(bottom: 20),
                        const HomeBodyTitle().pOnly(bottom: 5),
                        RowTimepicker(controller: controller),
                        // * list of milk deposit cards
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 10.r),
                            width: context.screenWidth,
                            height: 400.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 100.h),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return const ListOfMilkDepositCardsWidget();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
