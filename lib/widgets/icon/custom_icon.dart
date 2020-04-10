import 'package:flutter/material.dart';

class TapIcon extends StatelessWidget {
  final String iconImage;
  final Function onTap;
  final double padding;

  TapIcon({@required this.iconImage, @required this.onTap, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
          padding: EdgeInsets.all(this.padding),
          child: Image.asset(
            this.iconImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )),
    );
  }
}
