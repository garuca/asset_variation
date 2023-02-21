import 'package:intl/intl.dart';

extension TimestampToDateformat on int {
  String toDateFormat() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch((this - 7200) * 1000,
        isUtc: true);
    return DateFormat('dd/MM').format(date);
  }
}