import 'package:covid_19_mob/config/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DailyCasesProvider with ChangeNotifier {
  Response response;
  Dio dio = new Dio();
  List<dynamic> _data = [];
  bool _error = false;
  bool _loading = true;

  Map<String, dynamic> get data {
    return {
      "error": _error,
      "loading": _loading,
      "data": [..._data],
    };
  }

  DailyCasesProvider() {
    getDailyCases();
  }

  void getDailyCases() async {
    try {
      response = await dio.get(
        "$mat_url/harian",
      );
      _error = false;
      _loading = false;
      _data = response.data["data"];
      notifyListeners();
    } on DioError catch (err) {
      _error = true;
      _loading = false;
      throw err;
    }
  }
}
