import 'package:flutter/material.dart';
import 'package:mockva_app/src/utils/values/colors.dart';

// Button with green color
class FlatButtonPrimary extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtonPrimary({Key key, this.label, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.blueAccent,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      // padding: EdgeInsets.all(18.0),
      padding: const EdgeInsets.all(15.0),
      splashColor: primaryColorDark,
      onPressed: onPress,
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class FlatButtontfNotAccess extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtontfNotAccess({Key key, this.label, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.grey,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      // padding: EdgeInsets.all(18.0),
      padding: const EdgeInsets.all(15.0),
      splashColor: primaryColorDark,
      onPressed: onPress,
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class FlatButtonPrimaryTf extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtonPrimaryTf({Key key, this.label, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.grey[600],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      // padding: EdgeInsets.all(18.0),
      padding: const EdgeInsets.all(15.0),
      splashColor: primaryColorDark,
      onPressed: onPress,
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class FlatButtonKonfirmWithIcon extends StatelessWidget {
  final String label;
  final Function onPress;
  final IconData iconData;
  final Color customColor;

  const FlatButtonKonfirmWithIcon(
      {Key key, this.label, this.onPress, this.iconData, this.customColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      // color: customColor ?? primaryColor,
      color: customColor ?? filledColorTextfield,

      textColor: Colors.black,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: const EdgeInsets.all(8.0),
      splashColor: primaryColorDark,

      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            iconData,
            // color: CustomColors.kPrimaryColor,
            color: primaryColor,
          ),
          const SizedBox(width: 1),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
