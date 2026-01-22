import 'package:intl/intl.dart';

extension StringExtensions on String {
  DateTime toDateTime() => DateFormat('dd/MM/yyyy').parse(this);
}
