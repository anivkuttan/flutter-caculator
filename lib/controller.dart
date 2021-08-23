import 'package:get/get.dart';

class ButtonController extends GetxController {
  RxString answerText = '5'.obs;

  // void buttonClicked(String buttonName){
  //   switch(buttonName){
  //     case 
  //   }
  // }
  void buttonTapped(String buttonName) {
    answerText.value = buttonName;
  }
}
