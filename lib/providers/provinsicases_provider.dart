import 'package:covid_19_mob/config/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProvinceCasesProvider with ChangeNotifier {
  Response response;
  Dio dio = new Dio();
  List<dynamic> _data = [];
  Map _selectedProvince;
  bool _error = false;
  bool _loading = true;

  Map<String, dynamic> get data {
    return {
      "error": _error,
      "loading": _loading,
      "data": [..._data],
    };
  }

  ProvinceCasesProvider() {
    getProvinceCase();
  }

  dynamic get selectedProvince {
    return _selectedProvince;
  }

  void selectProvince(item) {
    _selectedProvince = item;
    notifyListeners();
  }

  void getProvinceCase() async {
    try {
      response = await dio.get(
        "$mat_url/provinsi",
      );
      _data = response.data["data"];
      _selectedProvince = response.data["data"][0];
      _error = false;
      _loading = false;
      notifyListeners();
    } on DioError catch (err) {
      _error = true;
      _loading = false;
      throw err;
    }
  }
}
