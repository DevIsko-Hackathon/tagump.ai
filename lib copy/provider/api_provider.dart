import 'package:flutter/material.dart';
import 'package:tagumpai/services/api.dart';

class ApiProvider extends ChangeNotifier {
  final _apiServices = ApiServices();
  List _response = [];
  List get response => _response;

  Future<void> fetchApi(api) async {
    final result = await _apiServices.fetchApi(api);
    _response = result;
    notifyListeners();
  }
}
