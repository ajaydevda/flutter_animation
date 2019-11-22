
import 'package:flutter/services.dart';

class customInputFormatter extends TextInputFormatter {

  static final  digitsOnly= RegExp(r"^[0-9]{0,10}$");

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue,) {

    print("<><><<>");
    if( digitsOnly.hasMatch(newValue.text) )
      {

        return newValue;
      }
    else
      {
        return oldValue;

      }

  }

  /// A [WhitelistingTextInputFormatter] that takes in digits `[0-9]` only.

}