import 'package:intl/intl.dart';
import 'package:regexpattern/regexpattern.dart';

class UtilHelper {
  static final UtilHelper _singleton = UtilHelper._internal();
  UtilHelper._internal();
  static UtilHelper get instance => _singleton;

  String convertDateTimeFormat12H(date) {
    var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  String convertDateTimeFormat24H(date) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    return formattedDate;
  }

  String convertDateTimeValue(DateTime date) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);
    return formattedDate;
  }

  int getDifferentYear(DateTime dateOld) {
    DateTime dateNew = DateTime.now();
    final difference = dateNew.difference(dateOld).inDays;

    return (difference ~/ 365);
  }

  String convertDateFormat(date) {
    var parsedDate = DateTime.parse(date);

    String formattedDate = DateFormat('dd MMM yy').format(parsedDate);
    return formattedDate;
  }

  String convertTimeFormat(date) {
    var parsedDate = DateTime.parse(date).toLocal();
    String formattedDate = DateFormat('HH:mm').format(parsedDate);
    return "$formattedDate WIB";
  }

  String convertDateTimeFormat(date) {
    var parsedDate = DateTime.parse(date).toLocal();
    String formattedDate = DateFormat('dd MMM yy HH:mm').format(parsedDate);
    return "$formattedDate WIB";
  }

  String convertToCurrencyIDR(int value) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    return currencyFormatter.format(value);
  }

  String? walletValidate(String value, String name) {
    if (!value.isNumeric()) {
      return "$name harus di isi dengan angka";
    }
    if (value.isEmpty) {
      return "$name harus di isi";
    }
    if (value.isNumeric()) {
      if (int.parse(value) < 50000) {
        return "$name minimal penarikan harus Rp. 50.000";
      }
    }
    return null;
  }

  String? validateIsNumber(String value, String name) {
    if (!value.isNumeric()) {
      return "$name harus di isi dengan angka";
    }
    return null;
  }

  String? validateRequire(String value, String name) {
    if (value.isEmpty) {
      return "$name harus di isi";
    }
    return null;
  }

  String? isPhoneNumber(String value, String name) {
    if (!value.isPhone()) {
      return "$name format tidak sesuai";
    }
    return null;
  }

  String? validateUsername(String value) {
    if (value.isEmpty) {
      return "Username harus di isi";
    }

    if (!value.isUsername()) {
      return "Username tidak boleh menggunakan spasi";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email harus di isi";
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(value);

    if (!emailValid) {
      return "Format email yang di masukkan salah";
    }
    return null;
  }

  String? validatePassword(String value, {bool isRequire = true}) {
    if (value.isEmpty && isRequire) {
      return "Password harus di isi";
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return "Password harus menggunakan huruf besar, kecil, angka dan simbol, contoh : Vignesh123!";
    }

    return null;
  }
}
