import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Function calcHandler;

  Button(this.btnText, this.btnColor, this.calcHandler);

  void pressButton() {
    if (btnText == '%' ||
        btnText == '+/-' ||
        btnText == 'C' ||
        btnText == '=') {
      calcHandler();
    } else {
      calcHandler(btnText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
        child: Text(
          btnText,
          style: TextStyle(fontSize: 30),
        ),
        onPressed: pressButton,
        color: btnColor,
        padding: (btnText != '0')
            ? EdgeInsets.all(22.0)
            : EdgeInsets.only(left: 85, top: 22, right: 85, bottom: 10),
        shape: (btnText != '0') ? CircleBorder() : StadiumBorder(),
      ),
    );
  }
}
