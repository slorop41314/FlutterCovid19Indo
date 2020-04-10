import 'package:flutter/material.dart';

class HomeTopButton extends StatelessWidget {
  final String imageData;
  final String cardTitle;
  final Function onTap;

  HomeTopButton({
    @required this.imageData,
    @required this.onTap,
    @required this.cardTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: this.onTap,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                this.imageData,
                width: MediaQuery.of(context).size.width / 11,
                height: MediaQuery.of(context).size.width / 11,
              ),
            ),
          ),
        ),
        Text(this.cardTitle),
      ],
    );
  }
}
