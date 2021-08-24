import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        width: double.infinity,
        color: MyColors.scaffoldDarkColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttons('AC', '%', '<', '/'),
            buttons('7', '8', '9', 'x'),
            buttons('4', '5', '6', '-'),
            buttons('1', '2', '3', '+'),
            buttons('00', '0', '.', '='),
          ],
        ),
      ),
    );
  }

  Widget buttons(String key1, String key2, String key3, String key4) {
    List<String> buttons = [key1, key2, key3, key4];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons
          .map(
            (key) => Button(
              buttonName: key,
            ),
          )
          .toList(),
    );
  }
}
