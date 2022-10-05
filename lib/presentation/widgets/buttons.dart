import 'package:flutter/material.dart';
import 'package:nike_shop_flutter/common/constants.dart';
import 'package:math_expressions/math_expressions.dart';

import '../pages/home_page.dart';

// ignore: must_be_immutable
class Mybutton extends StatefulWidget {
  final String child;
  final VoidCallback onTap;


  Mybutton({Key? key, required this.child, required this.onTap, })
      : super(key: key);

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  var buttonColor = const Color.fromARGB(255, 255, 255, 255);

  String get userAnswer => userAnswer;

  @override
  Widget build(BuildContext context) {
    if (widget.child == "C") {
      buttonColor = topButtonColor;
    } else if (widget.child == "DEL") {
      buttonColor = const Color.fromARGB(255, 255, 0, 0);
    } else if (widget.child == "=") {


      buttonColor = secondaryButtonColor;
    } else if (widget.child == "+/-") {
      buttonColor = topButtonColor;
      myBlackeStyle == myWhiteStyle;
    } else if (widget.child == "%") {
      try{

      }catch(e){
        e.toString();
      }
      buttonColor = topButtonColor;
    } else if (widget.child == "÷") {
      buttonColor = secondaryButtonColor;
    } else if (widget.child == "x") {
      buttonColor = secondaryButtonColor;
    } else if (widget.child == "-") {
      buttonColor = secondaryButtonColor;

    } else if (widget.child == "+") {
      buttonColor = secondaryButtonColor;
    } else {
      buttonColor = buttonColor;
    }
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          child: Center(
            child: Text(
              widget.child,
              style: buttonColor == secondaryButtonColor
                  ? myWhiteStyle
                  : myBlackeStyle,
            ),
          ),
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }


}
