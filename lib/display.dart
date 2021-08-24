import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonController buttonController = Get.put(ButtonController());
    return Flexible(
      flex: 1,
      child: Container(
        width: double.infinity,
        color: MyColors.scaffoldDark2Color,
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
               const Text(
                 '0',
                  style:  TextStyle(
                      fontSize: 30, color: MyColors.scaffoldLigthColor),
                ),
                Obx(() {
                  bool displayZero = buttonController.answerText.value.isEmpty;
                  return Text(
                    displayZero ? '0' : buttonController.answerText.value,
                    //softWrap: true,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 30, color: MyColors.scaffoldLigthColor),
                  );
                }),
              ]),
        ),
      ),
    );
  }
}
