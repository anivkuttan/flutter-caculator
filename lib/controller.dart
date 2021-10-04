import 'package:get/get.dart';
import 'button.dart';

class ButtonController extends GetxController {
  RxString answerText = ''.obs;
  bool isOperatorAvailable = true;
  bool isDotAvailable = true;
  bool isEndWithOperator = false;
  var isLastOpeatorPressend = false;

  void buttonTapped(String buttonName, ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.allClearButton:
        return allClearButtonClicked();
      case ButtonType.backSpaceButton:
        return backSpaceButtonClicked();
      case ButtonType.periodButton:
        return periodButtonClicked(buttonName);
      case ButtonType.numberButton:
        return numberButtonClicked(buttonName);
      case ButtonType.equalButton:
        return equalButtonClicked();
      case ButtonType.operatorButton:
        return operatorButtonClicked(buttonName);
      default:
        return;
    }
  }

  void allClearButtonClicked() {
    answerText.value = '';
    isDotAvailable = true;
    isEndWithOperator = false;
    isLastOpeatorPressend = false;
  }

  void backSpaceButtonClicked() {
    int answerTextLength = answerText.value.length;
    if (answerText.isNotEmpty) {
      //Checking last deleted thing  it is Dot then change the State of isDotAvailable
      bool isEndsWithPeriod = answerText.endsWith('.');
      if (isEndsWithPeriod) {
        answerText.value = answerText.value.substring(0, answerTextLength - 1);
        isDotAvailable = true;
      } else {
        answerText.value = answerText.value.substring(0, answerTextLength - 1);
        isOperatorAvailable = true;
      }
    } else {
      return;
    }
  }

  void numberButtonClicked(String buttonName) {
    answerText.value += buttonName;
  }

  void operatorButtonClicked(String buttonName) {
    int answerLength = answerText.value.length;
    var isEndWithMinus = answerText.value.endsWith('-');
    var isEndWithPluse = answerText.value.endsWith('+');
    var isEndWithMultiplay = answerText.value.endsWith('x');
    var isEndWithDivide = answerText.value.endsWith('/');
    var isOpeatorOne = RegExp(r'[+-]');
    if (answerText.isEmpty && (buttonName == '+' || buttonName == '-')) {
      answerText.value = buttonName;
    } else if (answerLength == 1 && answerText.contains(isOpeatorOne)) {
      if (buttonName == '+') {
        answerText.value = '+';
      } else if (buttonName == '-') {
        answerText.value = '-';
      }
    } else if (answerText.isNotEmpty &&
        !(isEndWithMinus ||
            isEndWithPluse ||
            isEndWithMultiplay ||
            isEndWithDivide)) {
      answerText.value += buttonName;
      isEndWithOperator = true;
    } else if (answerText.isNotEmpty &&
        (isEndWithMinus ||
            isEndWithPluse ||
            isEndWithMultiplay ||
            isEndWithDivide)) {
      if (buttonName == 'x' || buttonName == '/' || buttonName == '+') {
        if (isLastOpeatorPressend) {
          var delString = answerText.value.substring(0, answerLength - 2);
          var addedString = delString + buttonName;
          answerText.value = addedString;
          isLastOpeatorPressend = false;
        } else {
          var delString = answerText.value.substring(0, answerLength - 1);
          var addedString = delString + buttonName;
          answerText.value = addedString;
        }
      } else if (buttonName == '-' && !isLastOpeatorPressend) {
        answerText.value += buttonName;
        isLastOpeatorPressend = true;
      }
    } else {
      return;
    }
  }

  void periodButtonClicked(String buttonName) {
    /*Dot is Available is once (oneClick)
      after the operator pressed then Dot is Available  at oneClick
       to change the State when Operator ButtonClicked
    */
    bool isEndsWithPeriod = answerText.endsWith('.');
    if (answerText.isEmpty) {
      answerText.value = '0.';
      isDotAvailable = false; //chenging the state
    } else if (!isEndsWithPeriod && isDotAvailable) {
      answerText.value += '.';
      isDotAvailable = false;
      isOperatorAvailable = true;
    } else {
      return;
    }
  }

  void equalButtonClicked() {}
}
