import 'package:flutter/material.dart';



class RoundIcon extends StatelessWidget {

  RoundIcon({@required this.icon,@required this.onPress});

  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 2.0,
      onPressed:onPress,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
