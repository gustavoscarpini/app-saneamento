import 'package:intl/intl.dart';

class Util {
  static final DateFormat clientSideformart = new DateFormat("dd/MM/yyyy");
  static final DateFormat serverSideFormart = new DateFormat("yyyy-MM-dd");

  static bool isNullEmptyOrFalse(Object o) =>
      o == null || false == o || "" == o;

  static bool isNullEmptyFalseOrZero(Object o) =>
      o == null || false == o || 0 == o || "" == o;
}
