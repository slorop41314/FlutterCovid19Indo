import 'package:covid_19_mob/config/main.dart';
import 'package:covid_19_mob/models/totalcase_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TotalCasesProvider with ChangeNotifier {
  Response response;
  Dio dio = new Dio();
  List<dynamic> _totalCases = [];
  bool _error = false;
  bool _loading = true;

  Map<String, dynamic> get data {
    return {
      "error": _error,
      "loading": _loading,
      "data": [..._totalCases],
    };
  }

  TotalCasesProvider() {
    getIndonesiaCases();
  }

  void getIndonesiaCases() async {
    try {
      response = await dio.get(
        "$kawal_api/indonesia",
      );
      _error = false;
      _loading = false;
      _totalCases = response.data;
      notifyListeners();
    } on DioError catch (err) {
      _error = true;
      _loading = false;
      throw err;
    }
  }
}
