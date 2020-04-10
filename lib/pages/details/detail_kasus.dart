import 'package:covid_19_mob/providers/provinsicases_provider.dart';
import 'package:covid_19_mob/theme/metrics.dart';
import 'package:covid_19_mob/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KasusProvinsiScreen extends StatefulWidget {
  static const route_name = "/auth/kasus/provinsi";
  @override
  _KasusProvinsiScreenState createState() => _KasusProvinsiScreenState();
}

class _KasusProvinsiScreenState extends State<KasusProvinsiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Kasus",
          style: Theme.of(context).textTheme.title,
        ),
        centerTitle: true,
      ),
      body: Consumer<ProvinceCasesProvider>(
        builder: (ctx, provinceCase, child) => Column(
          children: <Widget>[
            provinceCase.data["loading"] == false
                ? Expanded(
                    child: Padding(
                      padding: padding_container,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Provinsi",
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Kasus",
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Sembuh",
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Wafat",
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: provinceCase.data["data"].length,
                              itemBuilder: (ctx, i) => Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          provinceCase.data["data"][i]
                                              ["provinsi"],
                                          style: TextStyle(
                                            color: lightBlackColor,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          provinceCase.data["data"][i]
                                                  ["kasusPosi"]
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          provinceCase.data["data"][i]
                                                  ["kasusSemb"]
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          provinceCase.data["data"][i]
                                                  ["kasusMeni"]
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : 
                LinearProgressIndicator(
                    backgroundColor: lightGreyColor,
                    valueColor: AlwaysStoppedAnimation<Color>(greyColor),
                  ),
          ],
        ),
      ),
    );
  }
}
