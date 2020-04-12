import 'package:covid_19_mob/utils/image_data.dart';
import 'package:covid_19_mob/widgets/icon/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../theme/metrics.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: padding_child_vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Informasi terkini",
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  "Indonesia",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                //   child: Text(
                //     DateFormat.yMMMEd().format(DateTime.now()),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            width: 70,
            height: 70,
            child: TapIcon(
              iconImage: image_logo,
              onTap: null,
            ),
          ),
        ],
      ),
    );
  }
}
