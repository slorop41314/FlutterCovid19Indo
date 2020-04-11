import "package:flutter/material.dart";
import 'package:charts_flutter/flutter.dart' as charts;
class CaseModel {
  final String type;
  final int value;
  final charts.Color barColor;
  CaseModel({
    @required this.type,
    @required this.value,
    @required this.barColor
  });
}
