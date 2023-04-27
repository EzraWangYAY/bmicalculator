import 'package:flutter/material.dart';
import 'constants.dart';
class Buttonbutton extends StatelessWidget {
  Buttonbutton({required this.onTap, required this.buttonTitle});

  final Function()? onTap;
  final String buttonTitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        child: Center(child: Text('CALCULER', style: LargeButtonTextStyle,)),
        color: Colors.deepOrange,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}