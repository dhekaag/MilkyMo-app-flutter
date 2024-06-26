import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionHistoryController extends GetxController {
  static TransactionHistoryController get instance => Get.find();

  Rx<DateTime?>? rangeStart = Rx<DateTime?>(null);
  Rx<DateTime?>? rangeEnd = Rx<DateTime?>(null);
  Rx<DateTime?>? selectedDay = Rx<DateTime?>(DateTime.now());
  final Rx<DateTime?> focusedDay = Rx<DateTime?>(DateTime.now());
  Rx<DateTime?>? newPickedStartDate =
      Rx<DateTime?>(DateTime.now().subtract(const Duration(days: 6)));
  Rx<DateTime?>? newPickedEndDate = Rx<DateTime?>(DateTime.now());
  RxBool isDatePickerSucced = false.obs;

  final Rx<CalendarFormat> calendarFormat =
      Rx<CalendarFormat>(CalendarFormat.month);

  final RxInt current = 0.obs;

  List<String> tabs = [
    "Januari",
    "Desember",
    "November",
    "Oktober",
  ];

  double changePositionedOfLine() {
    switch (current.value) {
      case 0:
        return 5.w;
      case 1:
        return 92.w;
      case 2:
        return 185.w;
      case 3:
        return 275.w;
      case 4:
        return 240.w;

      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current.value) {
      case 0:
        return 50.w;
      case 1:
        return 50.w;
      case 2:
        return 50.w;
      case 3:
        return 50.w;
      case 4:
        return 50.w;
      default:
        return 0;
    }
  }
}
