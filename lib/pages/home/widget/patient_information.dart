import 'package:covid_19_mob/pages/details/detail_kasus.dart';
import 'package:covid_19_mob/providers/dailycases_provider.dart';
import 'package:covid_19_mob/theme/metrics.dart';
import 'package:covid_19_mob/widgets/card/info_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PatientInformation extends StatelessWidget {
  const PatientInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DailyCasesProvider>(
      builder: (ctx, dailyCase, child) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Data terkini",
              style: Theme.of(context).textTheme.title,
            ),
            Container(
              padding: padding_child_vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Update terakhir : "),
                      Text(
                        dailyCase.data["data"].length > 0
                            ? DateFormat("dd MMMM yyyy")
                                .format(DateTime.fromMillisecondsSinceEpoch(
                                    dailyCase.data["data"][
                                                dailyCase.data["data"].length -
                                                    1]["jumlahKasusKumulatif"] !=
                                            null
                                        ? dailyCase.data["data"]
                                                [dailyCase.data["data"].length - 1]
                                            ["tanggal"]
                                        : dailyCase.data["data"]
                                                [dailyCase.data["data"].length - 2]
                                            ["tanggal"]))
                                .toString()
                            : "...",
                        // style: Theme.of(context).textTheme.title,
                      ),
                    ],
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
            Row(
              children: <Widget>[
                Expanded(
                  child: InfoCard(
                    type: "kasus",
                    numberOfCase: dailyCase.data["data"].length > 0
                        ? dailyCase.data["data"]
                                        [dailyCase.data["data"].length - 1]
                                    ["jumlahKasusKumulatif"] !=
                                null
                            ? dailyCase.data["data"]
                                    [dailyCase.data["data"].length - 1]
                                ["jumlahKasusKumulatif"]
                            : dailyCase.data["data"]
                                    [dailyCase.data["data"].length - 2]
                                ["jumlahKasusKumulatif"]
                        : "...",
                    gapYesterday: dailyCase.data["data"].length > 0
                        ? dailyCase.data["data"]
                                [dailyCase.data["data"].length - 1]
                            ["jumlahKasusBaruperHari"]
                        : null,
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    type: "sembuh",
                    numberOfCase: dailyCase.data["data"].length > 0
                        ? dailyCase.data["data"]
                                        [dailyCase.data["data"].length - 1]
                                    ["jumlahPasienSembuh"] !=
                                null
                            ? dailyCase.data["data"]
                                    [dailyCase.data["data"].length - 1]
                                ["jumlahPasienSembuh"]
                            : dailyCase.data["data"]
                                    [dailyCase.data["data"].length - 2]
                                ["jumlahPasienSembuh"]
                        : "...",
                    gapYesterday: dailyCase.data["data"].length > 0
                        ? dailyCase.data["data"]
                                [dailyCase.data["data"].length - 1]
                            ["jumlahKasusSembuhperHari"]
                        : null,
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    type: "dirawat",
                    numberOfCase: dailyCase.data["data"].length > 0
                        ? dailyCase.data["data"]
                                        [dailyCase.data["data"].length - 1]
                                    ["jumlahpasiendalamperawatan"] !=
                                null
                            ? dailyCase.data["data"]
                                    [dailyCase.data["data"].length - 1]
                                ["jumlahpasiendalamperawatan"]
                            : dailyCase.data["data"]
                                    [dailyCase.data["data"].length - 2]
                                ["jumlahpasiendalamperawatan"]
                        : "...",
                    gapYesterday: dailyCase.data["data"].length > 0
                        ? dailyCase.data["data"]
                                [dailyCase.data["data"].length - 1]
                            ["jumlahKasusDirawatperHari"]
                        : null,
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    type: "wafat",
                    numberOfCase: dailyCase.data["data"].length > 0
                        ? dailyCase.data["data"]
                                        [dailyCase.data["data"].length - 1]
                                    ["jumlahPasienMeninggal"] !=
                                null
                            ? dailyCase.data["data"]
                                    [dailyCase.data["data"].length - 1]
                                ["jumlahPasienMeninggal"]
                            : dailyCase.data["data"]
                                    [dailyCase.data["data"].length - 2]
                                ["jumlahPasienMeninggal"]
                        : "...",
                    gapYesterday: dailyCase.data["data"].length > 0
                        ? dailyCase.data["data"]
                                [dailyCase.data["data"].length - 1]
                            ["jumlahKasusMeninggalperHari"]
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
