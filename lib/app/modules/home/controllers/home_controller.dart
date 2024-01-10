// ignore_for_file: unnecessary_getters_setters

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  RxString selectedTime =
      DateFormat("EEEE, d MMMM y", "id_ID").format(DateTime.now()).obs;
  RxString? selectedDropDownValue = "Semua".obs;

  Rx<DateTime?>? rangeStart =
      Rx<DateTime?>(DateTime.now().subtract(const Duration(days: 6)));
  Rx<DateTime?>? rangeEnd = Rx<DateTime?>(DateTime.now());
  Rx<DateTime?>? selectedDay = Rx<DateTime?>(DateTime.now());
  final Rx<DateTime?> focusedDay = Rx<DateTime?>(DateTime.now());
  Rx<DateTime?>? newPickedStartDate =
      Rx<DateTime?>(DateTime.now().subtract(const Duration(days: 6)));
  Rx<DateTime?>? newPickedEndDate = Rx<DateTime?>(DateTime.now());
  RxBool isDatePickerSucced = false.obs;

  final Rx<CalendarFormat> calendarFormat =
      Rx<CalendarFormat>(CalendarFormat.month);
}
