import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller.dart';
import 'package:get/get.dart';

enum ButtonType {
  numberButton,
  operatorButton,
  allClearButton,
  equalButton,
  backSpaceButton,
  periodButton
}

class Button extends StatelessWidget {
  final String buttonName;

  const Button({Key? key, required this.buttonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonController buttonController = Get.find();
    ButtonType buttonType = getButtonType(buttonName);
    Color buttonTextColor = _getButtonTextColor(buttonType);
    Color buttonColor = _getbuttonColor(buttonType);
    return Flexible(
      child: GestureDetector(
        onTap: () {
          buttonController.buttonTapped(buttonName, buttonType);
        },
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
            style: GoogleFonts.dosis(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: buttonTextColor),
          ),
        ),
      ),
    );
  }

  Color _getbuttonColor(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.operatorButton:
        return MyColors.operatorButtonColor;
      case ButtonType.allClearButton:
        return MyColors.deleteButtonColor;
      case ButtonType.equalButton:
        return MyColors.equalButtonColor;
      case ButtonType.numberButton:
        return MyColors.normalButtonColor;
      case ButtonType.backSpaceButton:
        return MyColors.operatorButtonColor;
      default:
        return MyColors.normalButtonColor;
    }
  }

  Color _getButtonTextColor(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.operatorButton:
        return MyColors.operatorButtonTextColor;
      case ButtonType.allClearButton:
        return MyColors.deleteButtonTextColor;
      case ButtonType.equalButton:
        return MyColors.equalButtonTextColor;
      case ButtonType.backSpaceButton:
        return MyColors.operatorButtonTextColor;
      default:
        return MyColors.normalButtonTextColor;
    }
  }

  ButtonType getButtonType(String buttonName) {
    switch (buttonName) {
      case '+':
      case '-':
      case 'x':
      case '/':
      case '%':
        return ButtonType.operatorButton;
      case 'AC':
        return ButtonType.allClearButton;
      case '<':
        return ButtonType.backSpaceButton;
      case '=':
        return ButtonType.equalButton;
      case '.':
        return ButtonType.periodButton;
      default:
        return ButtonType.numberButton;
    }
  }
}
 
 