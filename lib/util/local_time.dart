import 'package:intl/intl.dart';

String localTime(int second) {
  var utcTime = DateTime.now().toUtc();
  var localTime = utcTime.add(
    Duration(seconds: second),
  );
  return DateFormat('EEEE dd . HH:mm').format(localTime).toString();
}
