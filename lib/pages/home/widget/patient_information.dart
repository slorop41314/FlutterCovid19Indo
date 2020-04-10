import 'package:covid_19_mob/pages/details/detail_kasus.dart';
import 'package:covid_19_mob/providers/totalcases_provider.dart';
import 'package:covid_19_mob/theme/metrics.dart';
import 'package:covid_19_mob/widgets/card/info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientInformation extends StatelessWidget {
  const PatientInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: padding_child_vertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Data terkini",
                  style: Theme.of(context).textTheme.title,
                ),
                InkWell(
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(KasusProvinsiScreen.route_name);
                  },
                )
              ],
            ),
          ),
          Consumer<TotalCasesProvider>(
            builder: (ctx, totalCase, child) => Row(
              children: <Widget>[
                Expanded(
                  child: InfoCard(
                    type: "kasus",
                    numberOfCase: totalCase.data["data"].length > 0
                        ? totalCase.data["data"][0]["positif"]
                        : "...",
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    type: "sembuh",
                    numberOfCase: totalCase.data["data"].length > 0
                        ? totalCase.data["data"][0]["sembuh"]
                        : "...",
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    type: "wafat",
                    numberOfCase: totalCase.data["data"].length > 0
                        ? totalCase.data["data"][0]["meninggal"]
                        : "...",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
