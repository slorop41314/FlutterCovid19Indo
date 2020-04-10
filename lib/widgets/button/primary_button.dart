import 'package:covid_19_mob/theme/metrics.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;

  PrimaryButton({
    @required this.buttonTitle,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin_child_vertical,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: this.onTap,
        child: Container(
          width: double.infinity,
          // padding: EdgeInsets.symmetric(vertical: 2),
          margin: margin_child,
          child: Text(
            this.buttonTitle,
            style: Theme.of(context).textTheme.button,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
