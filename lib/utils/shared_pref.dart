//todo: save last sura => write data
//todo: get sura list => read data
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKey {
  static const String mostRecentKey = 'most_recent';
}

//todo: save last sura => write data
void saveNewSuraList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //todo: get all sura list from shared pref
  List<String> mostRecentIndicesList =
      prefs.getStringList(SharedPrefKey.mostRecentKey) ?? [];
  //todo: add sura index in sura list in shared pref

  //todo: Duplicate
  if (mostRecentIndicesList.contains('$newSuraIndex')) {
    //todo: exist => remove
    mostRecentIndicesList.remove('$newSuraIndex');
    //todo: exist => insert
    mostRecentIndicesList.insert(0, '$newSuraIndex');
  } else {
    //todo: not exist => insert
    mostRecentIndicesList.insert(0, '$newSuraIndex');
    // mostRecentIndicesList.add('$newSuraIndex');
  }

  if (mostRecentIndicesList.length > 5) {
    // mostRecentIndicesList.removeLast();
    mostRecentIndicesList = mostRecentIndicesList.sublist(0, 5);
  }
  //todo: save list in shared pref
  await prefs.setStringList(SharedPrefKey.mostRecentKey, mostRecentIndicesList);
}
