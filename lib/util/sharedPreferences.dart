import 'package:shared_preferences/shared_preferences.dart';

//Salva uma informação no SharedPreferences
savePreferences(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

//Recupera uma informação do SharedPreferences
readPreferences(String key) async {
  String preference;
  SharedPreferences prefs = await SharedPreferences.getInstance();

  preference = (prefs.getString(key) ?? null);
  return preference;
}