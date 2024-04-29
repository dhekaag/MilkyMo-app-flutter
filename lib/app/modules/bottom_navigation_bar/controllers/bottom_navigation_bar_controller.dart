import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkymo/app/modules/home/views/home_view.dart';
import 'package:milkymo/app/modules/transaction_history/views/transaction_history_view.dart';
import 'package:milkymo/app/routes/app_pages.dart';

class BottomNavigationBarController extends GetxController {
  static BottomNavigationBarController get instace => Get.find();

  final Rx<int> selectedIndex = 0.obs;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final screens = [
    GetPage(name: Routes.HOME, page: () => const HomeView()),
    GetPage(
        name: Routes.TRANSACTION_HISTORY,
        page: () => const TransactionHistoryView()),
  ];
}
