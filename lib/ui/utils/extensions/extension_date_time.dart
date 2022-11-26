import 'package:intl/intl.dart';

const String dateFormatter = 'MMMM dd, y';
const String hourFormatter = 'h:mm a';

extension DateHelper on DateTime {
  
  String formatDate({required String dateString, String textDate = ''}) {
    final formatter = DateFormat(dateFormatter);
    final dateTime = DateTime.now();
    final date = DateTime.parse(dateString);
      if (dateTime.day == date.day && dateTime.year == date.year && dateTime.month == date.month  ) {
        return textDate;
      }else{
        return formatter.format(this);
      }
  }
  bool isSameDate(DateTime other) {
    return year == other.year &&
      month == other.month &&
      day == other.day;
  }

  String formatHour() {
    final formatter = DateFormat(hourFormatter);
      return formatter.format(this);
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}