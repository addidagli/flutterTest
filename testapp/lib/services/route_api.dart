import 'dart:convert';

import 'package:testapp/models/route.dart';
import 'package:http/http.dart' as http;

class RouteApi {
  static RouteApi _instance;

  RouteApi._();

  static RouteApi get instance {
    if (_instance == null) {
      _instance = RouteApi._();
    }
    return _instance;
  }

  Future<List<Routess>> getAllRoutes() async {
    final getRoute =
        await http.get('https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/departureTimes', headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    final List responseBody = jsonDecode(getRoute.body);
    return responseBody.map((e) => Routess.fromJson(e)).toList();
  }
}