import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/home/views/widget/home_card_widget.dart';
import 'package:milkymo/app/modules/home/views/widget/list_of_milk_deposit_cards_widget.dart';
import 'package:milkymo/app/modules/home/views/widget/top_home_app_bar_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/home_controller.dart';
import 'widget/home_body_title_widget.dart';
import 'widget/row_time_picker_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBackgroundColor,
      body: Obx(() {
        if (controller.homeStatus.value.isLoading) {
          return _buildLoadingView(context);
        } else if (controller.homeStatus.value.isError) {
          return _buildErrorView(context);
        } else if (controller.homeStatus.value.isSuccess) {
          return _buildSuccessView(context);
        }
        return const SizedBox();
      }),
    );
  }

  Widget _buildLoadingView(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorView(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // You can't show dialog inside build method directly.
      // We use addPostFrameCallback to show the dialog after the build is complete.
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: "Terjadi Kesalahan",
        desc: controller.homeStatus.value.errorMessage,
        btnOkText: "REFRESH",
        btnOkOnPress: () {
          controller.getData();
        },
      ).show();
    });
    return GestureDetector(
      onTap: () => controller.getData(),
      child: Center(
        child: Text(
          "Terjadi Kesalahan, coba tekan layar untuk memuat ulang",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildSuccessView(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.getData,
      child: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: tBackgroundColor,
            pinned: true,
            floating: true,
            expandedHeight: context.screenHeight * 0.48,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Stack(
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
                              bottomRight: Radius.circular(30.r),
                            ),
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
                            Obx(() {
                              if (controller.homeStatus.value.isLoading) {
                                return Skeletonizer(
                                  enabled: controller.isLoading.value,
                                  child: HomeCardWidget(
                                    controller: controller,
                                  ),
                                );
                              } else {
                                final lastTransaction =
                                    controller.transactionDataList.isNotEmpty
                                        ? controller.transactionDataList.last
                                        : null;
                                final dateFormatter =
                                    DateFormat('dd MMMM yyyy');
                                final timeFormatter = DateFormat('HH:mm');

                                return HomeCardWidget(
                                  controller: controller,
                                  tanggal: lastTransaction != null
                                      ? dateFormatter
                                          .format(lastTransaction.createdAt!)
                                      : '',
                                  jam: lastTransaction != null
                                      ? timeFormatter
                                          .format(lastTransaction.createdAt!)
                                      : '',
                                  waktu: lastTransaction?.time ?? '',
                                  volumeSusu:
                                      lastTransaction?.milkVolume?.toString() ??
                                          '',
                                );
                              }
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.h),
              child: Container(
                color: tBackgroundColor,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeBodyTitle().pOnly(bottom: 5),
                      RowTimepicker(
                        controller: controller,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            if (controller.homeStatus.value.isLoading) {
              return SliverFillRemaining(
                child: VxShimmer(
                  count: 5,
                  primaryColor: Colors.grey[300]!,
                  secondaryColor: Colors.grey[100]!,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Container(
                          height: 24,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return SliverPadding(
                padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 100.h),
                sliver: SliverList.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: controller.transactionDataList.length,
                  itemBuilder: (context, index) {
                    final transaction = controller.transactionDataList[index];
                    final adminId = transaction.adminId;
                    final tanggal =
                        DateFormat('dd-MM-yyyy').format(transaction.createdAt!);
                    final jam =
                        DateFormat('HH:mm').format(transaction.createdAt!);
                    final waktu = transaction.time ?? '';
                    final volumeSusu = transaction.milkVolume?.toString() ?? '';

                    return ListOfMilkDepositCardsWidget(
                      idPeternak: adminId,
                      tanggal: tanggal,
                      volumeSusu: volumeSusu,
                      jam: jam,
                      waktu: waktu,
                    ).pSymmetric(h: 12, v: 2);
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
