import 'package:flutter/material.dart';

import 'colors.dart';
import 'display.dart';
import 'key_pad.dart';

class CalcualtorPage extends StatelessWidget {
  const CalcualtorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.scaffoldDarkColor,
      body: Column(
        children: [
          Display(),
          KeyPad(),
        ],
      ),
    );
  }
}
