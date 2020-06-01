
import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap,@required this.buttonLabel});
  final Function onTap;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
                buttonLabel,
                style: kBottomTextStyle)),
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomCardColor,
        width: double.infinity,
        height: kBottomHeightContainer,
      ),
    );
  }
}
