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
      return periodButtonClicked();
    }
  }

  void allClearButtonClicked() {
    answerText.value = '';
  }

  void backSpaceButtonClicked() {
    int displayCharatorLength = answerText.value.length;
    answerText.value = answerText.value.substring(0, displayCharatorLength - 1);
  }

  void numberButtonClicked(String buttonName) {
    answerText.value += buttonName;
  }

  void operatorButtonClicked() {}
  void periodButtonClicked() {}
  void equalButtonClicked() {}
}
