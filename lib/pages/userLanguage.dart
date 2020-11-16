import 'package:flutter/material.dart';
import 'package:mostcommonwordsbylanguage/models/language.dart';
import 'package:mostcommonwordsbylanguage/pages/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLanguage extends StatefulWidget {
  @override
  _UserLanguageState createState() => _UserLanguageState();
}

class _UserLanguageState extends State<UserLanguage> {
  void saveUserLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('UserLanguage', language);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Choose your native language"),
            flexibleSpace: Container(
                decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ))),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.80,
          children: List.generate(languages.length, (index) {
            return Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      child: InkWell(
                        onTap: () {
                          saveUserLanguage(languages[index].ISOCode);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Languages()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(25.0),
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: languages[index].flag.image,
                                height: 100,
                              ),
                              Divider(),
                              Text(languages[index].name)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
