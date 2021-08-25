import 'package:get/get.dart';
import 'button.dart';

class ButtonController extends GetxController {
  RxString answerText = ''.obs;

  void buttonTapped(String buttonName, ButtonType buttonType) {
    if (buttonType == ButtonType.allClearButton) {
      return allClearButtonClicked();
    } else if (buttonType == ButtonType.backSpaceButton) {
      return backSpaceButtonClicked();
    } else if (buttonType == ButtonType.numberButton) {
      return numberButtonClicked(buttonName);
    } else if (buttonType == ButtonType.operatorButton) {
      return operatorButtonClicked();
    } else if (buttonType == ButtonType.equalButton) {
      return equalButtonClicked();
    } else if (buttonType == ButtonType.periodButton) {
      return periodButtonClicked(buttonName);
    }
  }

  void allClearButtonClicked() {
    answerText.value = '';
  }

  void backSpaceButtonClicked() {
    int displayCharatorLength = answerText.value.length;
    if (answerText.isEmpty) {
      answerText.value =
          answerText.value.substring(0, displayCharatorLength - 1);
    } else {
      return;
    }
  }

  void numberButtonClicked(String buttonName) {
    answerText.value += buttonName;
  }

  void operatorButtonClicked() {}
  void periodButtonClicked(String buttonName) {
    bool isPeriodAppear = answerText.value.contains('.');
    if (answerText.isEmpty) {
      answerText.value = '0.';
    } else if (answerText.isNotEmpty && !isPeriodAppear) {
      answerText.value += buttonName;
    } else {
      return;
    }
  }

  void equalButtonClicked() {}
}
