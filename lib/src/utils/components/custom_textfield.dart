import 'package:flutter/material.dart';
import 'package:mockva_app/src/utils/values/colors.dart';

class TextFieldCustom {
  static textFieldGeneral() {
    return InputDecoration(
      fillColor: lightGrey,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(18.0, 4.0, 4.0, 18.0),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: disabledTextColor, width: 2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: materialDarkGrey, width: 2),
      ),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: accentColor, width: 0.0),
          borderRadius: BorderRadius.circular(5.0)),
    );
  }
}
