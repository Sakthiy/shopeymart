import 'package:intl/intl.dart';
class CommonFunction{
 static String formatPrice({required double price}) {
    final formatter = NumberFormat("#,###");
    return formatter.format(price);
  }
}