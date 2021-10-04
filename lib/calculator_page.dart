import 'package:calculator_app/display.dart';
import 'package:calculator_app/key_pad.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class CalcualtorPage extends StatelessWidget {
  const CalcualtorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffoldDarkColor,
      // appBar: AppBar(
      //   backgroundColor: MyColors.scaffoldDarkColor,
      //   title: const Text('Calculator'),
      //   elevation: 0.0,
      //   centerTitle: true,
      // ),
      body: Column(
        children: const [
          Display(),
          KeyPad(),
        ],
      ),
    );
  }
}
