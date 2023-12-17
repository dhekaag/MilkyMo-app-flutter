import 'package:flutter/material.dart';

class LimitedDateRangePicker {
  static Future<DateTimeRange?> showLimitedDateRangePicker({
    required BuildContext context,
    required DateTime initialStartDate,
    required DateTime initialEndDate,
  }) async {
    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(
          days:
              6)), // 6 hari sebelumnya (untuk memastikan rentang maksimal adalah 7 hari)
      lastDate: DateTime.now(), // Tanggal saat ini
      initialDateRange:
          DateTimeRange(start: initialStartDate, end: initialEndDate),
    );

    if (pickedDateRange != null) {
      final duration = pickedDateRange.end.difference(pickedDateRange.start);
      if (duration.inDays <= 7) {
        return pickedDateRange;
      } else {
        // Menampilkan pesan jika rentang lebih dari 7 hari
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Peringatan'),
              content: Text('Rentang tanggal tidak boleh lebih dari 7 hari.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

    return null;
  }
}
