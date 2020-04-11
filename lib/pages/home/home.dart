import 'package:bezier_chart/bezier_chart.dart';
import 'package:covid_19_mob/pages/home/widget/header_home.dart';
import 'package:covid_19_mob/pages/home/widget/patient_information.dart';
import 'package:covid_19_mob/providers/dailycases_provider.dart';
import 'package:covid_19_mob/theme/metrics.dart';
import 'package:covid_19_mob/utils/constants.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../models/totalcase_model.dart';
import '../../providers/provinsicases_provider.dart';
import '../../theme/metrics.dart';
import '../../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  static const route_name = "/auth/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // BannerAd _bannerAd;

  // BannerAd createBannerAd() {
  //   return BannerAd(
  //     adUnitId: BannerAd.testAdUnitId,
  //     size: AdSize.banner,
  //     listener: (MobileAdEvent event) {
  //       print("BannerAd event $event");
  //     },
  //   );
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
  //   _bannerAd = createBannerAd()..load();
  // }

  // @override
  // void dispose() {
  //   _bannerAd?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final provinceData =
        Provider.of<ProvinceCasesProvider>(context, listen: false);

    void _modalBottomSheetMenu() {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Container(
              height: 350.0,
              color:
                  Color(0xFF737373), //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    padding: padding_child,
                    child: Stack(
                      children: <Widget>[
                        Text(
                          "Pilih provinsi : ",
                        ),
                        Container(
                          child: ListView.builder(
                            itemCount: provinceData.data["data"].length,
                            itemBuilder: (context, i) => ListTile(
                              onTap: () {
                                // print(provinceData.data["data"][i]);
                                provinceData.selectProvince(
                                    provinceData.data["data"][i]);
                                Navigator.of(context).pop();
                              },
                              title: Text(
                                provinceData.data["data"][i]["provinsi"],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          });
    }

    // List<charts.Series<CaseModel, String>> series =
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
                      PatientInformation(showAds: (){},),
                    ],
                  ),
                ),
                Consumer<DailyCasesProvider>(
                  builder: (ctx, dailyCases, child) => Card(
                    child: Container(
                      height: 230,
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
                                  height: 190,
                                  padding: padding_child_vertical,
                                  child: BezierChart(
                                    fromDate: DateTime.now().subtract(
                                      Duration(
                                        days:
                                            dailyCases.data["data"].length - 2,
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
                                          return dailyCases
                                              .data["data"][dailyCases
                                                              .data["data"]
                                                              .length -
                                                          DateTime.now()
                                                              .difference(x)
                                                              .inDays >=
                                                      0
                                                  ? dailyCases
                                                          .data["data"].length -
                                                      2 -
                                                      DateTime.now()
                                                          .difference(x)
                                                          .inDays
                                                  : 0]["jumlahKasusKumulatif"]
                                              .toDouble();
                                        },
                                        data: [
                                          DataPoint<DateTime>(
                                            value: dailyCases.data["data"]
                                                            [dailyCases.data["data"].length - 1][
                                                        "jumlahKasusKumulatif"] !=
                                                    null
                                                ? dailyCases.data["data"]
                                                        [dailyCases.data["data"].length - 1]
                                                        ["jumlahKasusKumulatif"]
                                                    .toDouble()
                                                : dailyCases.data["data"][dailyCases
                                                            .data["data"]
                                                            .length -
                                                        2]["jumlahKasusKumulatif"]
                                                    .toDouble(),
                                            xAxis: DateTime.now(),
                                          ),
                                        ],
                                      ),
                                    ],
                                    config: BezierChartConfig(
                                      backgroundColor: darkBlue,
                                      footerHeight: 45.0,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                Consumer<ProvinceCasesProvider>(
                  builder: (context, provinceData, child) => Card(
                    child: Container(
                      padding: padding_child,
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: provinceData.data["loading"] == true
                          ? Text("Loading...")
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: _modalBottomSheetMenu,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        provinceData
                                            .selectedProvince["provinsi"],
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: greyColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  child: charts.BarChart([
                                    charts.Series(
                                        id: "Provinsi",
                                        data: provinceData.data["loading"] ==
                                                false
                                            ? [
                                                CaseModel(
                                                  type: "Positif",
                                                  value: provinceData
                                                          .selectedProvince[
                                                      "kasusPosi"],
                                                  barColor: charts.ColorUtil
                                                      .fromDartColor(
                                                    Colors.orange,
                                                  ),
                                                ),
                                                CaseModel(
                                                  type: "Sembuh",
                                                  value: provinceData
                                                          .selectedProvince[
                                                      "kasusSemb"],
                                                  barColor: charts.ColorUtil
                                                      .fromDartColor(
                                                    Colors.green,
                                                  ),
                                                ),
                                                CaseModel(
                                                  type: "Meninggal",
                                                  value: provinceData
                                                          .selectedProvince[
                                                      "kasusMeni"],
                                                  barColor: charts.ColorUtil
                                                      .fromDartColor(
                                                    Colors.red,
                                                  ),
                                                ),
                                              ]
                                            : [],
                                        domainFn: (model, _) => model.type,
                                        measureFn: (model, _) => model.value,
                                        colorFn: (model, _) => model.barColor)
                                  ], animate: true),
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
