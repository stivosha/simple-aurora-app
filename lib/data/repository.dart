import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/domain/deal.dart';

class Repository {
  String key = "deals";

  Future<SharedPreferences> _getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveDeals(List<dynamic> data) async {
    final prefs = await _getSharedPreferencesInstance();
    List<String> habitList = data
        .map((deal) =>
            jsonEncode({'title': deal.title, 'description': deal.description}))
        .toList();
    await prefs.setStringList(key, habitList);
  }

  Future<List<Deal>> getDeals() async {
    final prefs = await _getSharedPreferencesInstance();
    List<String> habitList = prefs.getStringList(key) ?? [];
    return habitList
        .map((dealJson) => Deal(
              title: jsonDecode(dealJson)['title'],
              description: jsonDecode(dealJson)['description'],
            ))
        .toList();
  }
}
