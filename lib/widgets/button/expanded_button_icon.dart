import 'package:covid_19_mob/theme/metrics.dart';
import "package:flutter/material.dart";

class ExpandedButtonIcon extends StatelessWidget {
  final String iconPath;
  final String buttonTitle;
  final Function onTap;
  final bool right;

  ExpandedButtonIcon({
    @required this.iconPath,
    @required this.buttonTitle,
    @required this.onTap,
    @required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: this.onTap,
        child: Container(
          decoration: BoxDecoration(
            border: this.right ? Border(
              top: BorderSide(
                color: Theme.of(context).canvasColor,
                width: 2,
              ),
              bottom: BorderSide(
                color: Theme.of(context).canvasColor,
                width: 2,
              ),
              right: BorderSide(
                color: Theme.of(context).canvasColor,
              ),
            ) : Border(
              top: BorderSide(
                color: Theme.of(context).canvasColor,
                width: 2,
              ),
              bottom: BorderSide(
                color: Theme.of(context).canvasColor,
                width: 2,
              ),
              left: BorderSide(
                color: Theme.of(context).canvasColor,
              ),
            )
          ),
          padding: padding_child,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                this.iconPath,
                width: 18,
              ),
              SizedBox(
                width: 5,
              ),
              Text(this.buttonTitle),
            ],
          ),
        ),
      ),
    );
  }
}