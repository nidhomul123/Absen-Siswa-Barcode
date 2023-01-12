
String datetimeToTime(DateTime? dateTime) {
  if (dateTime != null) {
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute= dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIB';
  }
  return '-';
}
