import 'package:get/get.dart';
import 'button.dart';

class ButtonController extends GetxController {
  RxString answerText = ''.obs;
  bool operatorButtonPressed = false;
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
      answerText.value = answerText.value.substring(0, answerTextLength - 1);
    } else {
      return;
    }
  }

  void numberButtonClicked(String buttonName) {
    answerText.value += buttonName;
  }

  void operatorButtonClicked(String buttonName) {
    answerText.value += buttonName;
    isDotAvailable = true; //dot is Available when operator is pressed
  }

  void periodButtonClicked(String buttonName) {
    //Dot is Available is once (oneClick)
    // after the operator pressed then Dot is Available once(oneClick)
    // to change the State when Operator ButtonClicked

    bool isEndsWithPeriod = answerText.endsWith('.');
    if (answerText.isEmpty) {
      answerText.value = '0.';
      isDotAvailable = false; //chenging the state
    } else if (!isEndsWithPeriod && isDotAvailable) {
      answerText.value += '.';
      isDotAvailable = false;
    } else {
      return;
    }
  }

  void equalButtonClicked() {}
}
