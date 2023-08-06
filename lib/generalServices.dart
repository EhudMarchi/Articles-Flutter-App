import 'package:intl/intl.dart';

String formatDate(String dateString) {
  final DateTime date = DateTime.parse(dateString);
  final DateFormat formatter = DateFormat('MMM dd, yyyy, h:mm a');
  return formatter.format(date);
}