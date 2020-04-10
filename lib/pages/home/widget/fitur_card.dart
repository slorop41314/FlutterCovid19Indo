
import 'package:covid_19_mob/theme/metrics.dart';
import 'package:covid_19_mob/utils/icon_data.dart';
import 'package:flutter/material.dart';

class HomeFiturCard extends StatelessWidget {
  final String imageData;
  final String cardTitle;
  final String cardSubTitle;
  final Function onTap;

  HomeFiturCard({
    @required this.imageData,
    @required this.onTap,
    @required this.cardTitle,
    @required this.cardSubTitle,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Padding(
        padding: padding_child,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Image.asset(
                  this.imageData,
                  width: MediaQuery.of(context).size.width / 9,
                  height: MediaQuery.of(context).size.width / 9,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text(
                    this.cardTitle,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(this.cardSubTitle),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                icon_home_arrow,
                width: 10,
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
