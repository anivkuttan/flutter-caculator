import 'package:get/get.dart';
// import 'package:flutter/material.dart';
import 'button.dart';

class ButtonController extends GetxController {
  RxString answerText = ''.obs;
  bool isOperatorAvailable = true;
  bool isDotAvailable = true;

  void buttonTapped(String buttonName, ButtonType buttonType) {
    if (buttonType == ButtonType.allClearButton) {
      return allClearButtonClicked();
    } else if (buttonType == ButtonType.backSpaceButton) {
      return backSpaceButtonClicked();
    } else if (buttonType == ButtonType.numberButton) {
      return numberButtonClicked(buttonName);
    } else if (buttonType == ButtonType.operatorButton) {
      return operatorButtonClicked(buttonName);
    } else if (buttonType == ButtonType.equalButton) {
      return equalButtonClicked();
    } else if (buttonType == ButtonType.periodButton) {
      return periodButtonClicked(buttonName);
    }
  }

  void allClearButtonClicked() {
    answerText.value = '';
    isDotAvailable = true;
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
      }
    } else {
      return;
    }
  }

  void numberButtonClicked(String buttonName) {
    answerText.value += buttonName;
    isOperatorAvailable = true;
  }

  void operatorButtonClicked(String buttonName) {
    var isPluse = answerText.endsWith('+');
    var isMinus = answerText.endsWith('-');
    var isMultiplay = answerText.endsWith('x');
    var isDevide = answerText.endsWith('/');

    if (isOperatorAvailable) {
      answerText.value += buttonName;
      isOperatorAvailable = false;
    } else if (!isOperatorAvailable &&
        (isPluse || isMinus || isMultiplay || isDevide)) {
      int start = answerText.value.length - 1;
      int end = answerText.value.length;
      answerText.value = answerText.value.replaceRange(start, end, buttonName);
    } else {
      return;
    }
    //when operator is clicked the dot become available
    isDotAvailable = true;
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
