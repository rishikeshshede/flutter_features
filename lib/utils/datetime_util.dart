import 'package:intl/intl.dart';

class DatetimeUtil {
  /// Returns date string in DD-MMM-YYYY format. Example: 26-Jan-1993
  /// If the passed date is today or yesterday, it returns "Today" or "Yesterday" respectively.
  static String toDateStringDDMMMYYYY(DateTime? dateTime) {
    DateTime now = DateTime.now();

    // If the passed date is null, return today's date
    if (dateTime == null) {
      return DateFormat('dd-MMM-yyyy').format(now);
    }

    // Check if the date is today
    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return 'Today';
    }

    // Check if the date is yesterday
    DateTime yesterday = now.subtract(const Duration(days: 1));
    if (dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day) {
      return 'Yesterday';
    }

    // Return the date in DD-MMM-YYYY format if not today or yesterday
    return DateFormat('dd-MMM-yyyy').format(dateTime);
  }

  static bool isDateSame(String strDate1, String strDate2) {
    DateTime date1 = DateTime.parse(strDate1);
    DateTime date2 = DateTime.parse(strDate2);

    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
