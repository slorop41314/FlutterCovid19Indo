import 'package:bezier_chart/bezier_chart.dart';
import 'package:covid_19_mob/pages/home/widget/header_home.dart';
import 'package:covid_19_mob/pages/home/widget/patient_information.dart';
import 'package:covid_19_mob/providers/dailycases_provider.dart';
import 'package:covid_19_mob/theme/metrics.dart';
import 'package:covid_19_mob/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const route_name = "/auth/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                HomeHeader(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      PatientInformation(),
                    ],
                  ),
                ),
                Consumer<DailyCasesProvider>(
                  builder: (ctx, dailyCases, child) => Card(
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      padding: padding_child,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Grafik Penyebaran",
                            style: Theme.of(context).textTheme.display1,
                          ),
                          dailyCases.data["loading"] == true
                              ? Text("Loading...")
                              : Container(
                                  height: 180,
                                  padding: padding_child_vertical,
                                  child: BezierChart(
                                    // key: _chartKey,
                                    fromDate: DateTime.now().subtract(
                                      Duration(
                                        days: dailyCases.data["data"].length,
                                      ),
                                    ),
                                    bezierChartScale: BezierChartScale.WEEKLY,
                                    toDate: DateTime.now(),
                                    selectedDate: DateTime.now(),
                                    series: [
                                      BezierLine(
                                        lineColor: blueColor,
                                        label: "Kasus",
                                        onMissingValue: (x) {
                                          return dailyCases.data["data"][
                                                  dailyCases
                                                          .data["data"].length -
                                                      DateTime.now()
                                                          .difference(x)
                                                          .inDays]
                                                  ["jumlahKasusKumulatif"]
                                              .toDouble();
                                        },
                                        data: [
                                          DataPoint<DateTime>(
                                            value: 10,
                                            xAxis: DateTime.now(),
                                          ),
                                        ],
                                      ),
                                    ],
                                    config: BezierChartConfig(
                                      backgroundColor: darkBlue,
                                      footerHeight: 40.0,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
