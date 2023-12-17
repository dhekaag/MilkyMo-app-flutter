import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  RxString selectedTime =
      DateFormat("EEEE, d MMMM y", "id_ID").format(DateTime.now()).obs;
  RxString? selectedDropDownValue = "Semua".obs;
  Rx<DateTimeRange> dateTimeRange = Rx<DateTimeRange>(DateTimeRange(
    start: DateTime.now().subtract(
        const Duration(days: 6)), // Mengurangkan sebulan (kira-kira 30 hari)
    end: DateTime.now(),
  ));

  void showDateRangePickerAndUpdateValue(BuildContext context) async {
    final pickedDateRange = await showDateRangePicker(
      locale: const Locale("id"),
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: dateTimeRange.value.start,
        end: dateTimeRange.value.end,
      ),
    );

    if (pickedDateRange != null) {
      final duration = pickedDateRange.end.difference(pickedDateRange.start);
      if (duration.inDays <= 7) {
        dateTimeRange.value = pickedDateRange;
      } else {
        // * Menampilkan pesan jika rentang lebih dari 7 hari
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Peringatan"),
              content:
                  const Text("Rentang tanggal tidak boleh lebih dari 7 hari."),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
