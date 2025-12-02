import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_pref.dart';

class MostRecentProvider extends ChangeNotifier {
  //todo: data
  List<int> mostRecentList = [];

  //todo: function
  //todo: get sura list => read data
  void getMostRecentSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //todo: ['0','1'] => todo: [0,1]
    //todo: List<String> => List<int> => map()
    List<String> mostRecentIndicesAsString =
        prefs.getStringList(SharedPrefKey.mostRecentKey) ?? [];
    mostRecentList = mostRecentIndicesAsString
        .map((element) => int.parse(element))
        .toList();
    //todo: mostRecentIndicesAsInt.reversed.toList()
    // mostRecentIndicesAsInt.reversed;
    notifyListeners();
  }
}
