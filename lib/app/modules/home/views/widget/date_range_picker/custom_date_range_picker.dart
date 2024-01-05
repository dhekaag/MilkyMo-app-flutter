import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkymo/app/constant/colors.dart';
import 'package:milkymo/app/modules/home/controllers/home_controller.dart';
import 'package:table_calendar/table_calendar.dart';

final _controller = HomeController.instance;

void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
  _controller.isDatePickerSucced.value = false;
  _controller.newPickedStartDate?.value = start;
  _controller.newPickedEndDate?.value = end;
  if (start != null && end != null) {
    final pickedDateRange = DateTimeRange(
      start: start,
      end: end,
    );
    final duration = pickedDateRange.end.difference(pickedDateRange.start);
    if (duration.inDays >= 7) {
      _controller.isDatePickerSucced.value = false;
      Get.dialog(
        AlertDialog(
          title: const Text('Peringatan'),
          content: const Text('Rentang tanggal tidak boleh lebih dari 7 hari.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(Get.overlayContext!).pop();
                _controller.newPickedStartDate?.value = null;
                _controller.newPickedEndDate?.value = null;
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      _controller.isDatePickerSucced.value = true;
    }
  }
}

void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
  _controller.isDatePickerSucced.value = false;
  _controller.selectedDay!.value = selectedDay;
  _controller.focusedDay.value = focusedDay;
}

void customTableCalender(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 25.r, vertical: 120.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  "Pilih Tanggal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Divider(
                color: tHintColor,
              ),
              Expanded(
                child: Obx(() => TableCalendar(
                      firstDay: DateTime(2000),
                      lastDay: DateTime.now(),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      locale: "id",
                      calendarStyle:
                          const CalendarStyle(outsideDaysVisible: false),
                      focusedDay: _controller.focusedDay.value!,
                      rangeSelectionMode: RangeSelectionMode.toggledOn,
                      rangeStartDay: _controller.newPickedStartDate?.value,
                      rangeEndDay: _controller.newPickedEndDate?.value,
                      calendarFormat: CalendarFormat.month,
                      selectedDayPredicate: (day) =>
                          isSameDay(_controller.selectedDay?.value, day),
                      onRangeSelected: _onRangeSelected,
                      onDaySelected: _onDaySelected,
                      onFormatChanged: (format) {
                        if (_controller.calendarFormat.value != format) {
                          _controller.calendarFormat.value = format;
                        }
                      },
                      onPageChanged: (focusedDay) {
                        _controller.focusedDay.value = focusedDay;
                      },
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100.w, 20.h),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      onPressed: () {
                        _controller.isDatePickerSucced.value = false;
                        _controller.newPickedStartDate?.value = null;
                        _controller.newPickedEndDate?.value = null;
                        Get.back();
                      },
                      child: Text(
                        "BATAL",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.85,
                        ),
                      ),
                    ),
                    Obx(
                      () => Flexible(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(100.w, 20.h),
                            backgroundColor:
                                _controller.isDatePickerSucced.value
                                    ? Colors.blue
                                    : tHintColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          onPressed: _controller.isDatePickerSucced.value
                              ? () {
                                  _controller.rangeStart?.value =
                                      _controller.newPickedStartDate?.value;
                                  _controller.rangeEnd?.value =
                                      _controller.newPickedEndDate?.value;
                                  Get.back();
                                }
                              : null, // Disable button when isDatePickerSucced is false
                          child: Text(
                            "OKE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.85,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])
            ],
          ),
        ),
      );
    },
  );
}
