import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        width: double.infinity,
        color: MyColors.scaffoldDark2Color,
        alignment: Alignment.bottomRight,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                '7',
                style:
                    TextStyle(fontSize: 30, color: MyColors.scaffoldLigthColor),
              ),
              Text(
                '758',
                style:
                    TextStyle(fontSize: 30, color: MyColors.scaffoldLigthColor),
              ),
            ]),
      ),
    );
  }
}
