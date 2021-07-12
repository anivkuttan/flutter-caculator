import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// enum ButtonType {
//   numbers,
//   operators,
//   equal,
//   ac,
// }

class Button extends StatelessWidget {
  final String buttonName;

  const Button({Key? key, required this.buttonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle buttonStyle = _getButtonStyle(buttonName);
    Color buttonColor = _getbuttonColor(buttonName);
    return Flexible(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          width: 60,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            buttonName,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }

  Color _getbuttonColor(String buttonName) {
    switch (buttonName) {
      case '+':
      case '-':
      case 'x':
      case '/':
      case '⌫':
      case '%':
        return MyColors.operatorButtonColor;
      case 'AC':
        return MyColors.deleteButtonColor;
      case '=':
        return MyColors.equalButtonColor;
      default:
        return MyColors.normalButtonColor;
    }
  }

  Color _getButtonTextColor(String buttonName) {
    switch (buttonName) {
      case '+':
      case '-':
      case 'x':
      case '/':
      case '⌫':
      case '%':
        return MyColors.operatorButtonTextColor;
      case 'AC':
        return MyColors.deleteButtonTextColor;
      case '=':
        return MyColors.equalButtonTextColor;
      default:
        return MyColors.normalButtonTextColor;
    }
  }

  TextStyle _getButtonStyle(String buttonName) {
    Color buttonTextColor = _getButtonTextColor(buttonName);

    switch (buttonName) {
      case '+':
      case '-':
      case 'x':
      case '/':
      case '⌫':
      case '%':
        return GoogleFonts.dosis(
          textStyle: TextStyle(
              fontSize: 30,
              color: buttonTextColor,
              fontWeight: FontWeight.w600),
        );
      case 'AC':
        return GoogleFonts.dosis(
          textStyle: TextStyle(
              fontSize: 30,
              color: buttonTextColor,
              fontWeight: FontWeight.w600),
        );
      case '=':
        return GoogleFonts.dosis(
          textStyle: TextStyle(
              fontSize: 40,
              color: buttonTextColor,
              fontWeight: FontWeight.w600),
        );
      default:
        return GoogleFonts.dosis(
          textStyle: TextStyle(
              fontSize: 30,
              color: buttonTextColor,
              fontWeight: FontWeight.w600),
        );
    }
  }
}
