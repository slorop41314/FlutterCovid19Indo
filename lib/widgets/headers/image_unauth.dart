import 'package:covid_19_mob/utils/image_data.dart';
import 'package:flutter/material.dart';

class UnauthHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image_logo,
          height: 75,
          width: 150,
        ),
      ],
    );
  }
}
