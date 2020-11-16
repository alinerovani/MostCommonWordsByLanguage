import 'package:flutter/material.dart';
import 'package:mostcommonwordsbylanguage/models/language.dart';
import 'package:mostcommonwordsbylanguage/pages/languageDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Languages extends StatefulWidget {
  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  String userLanguage;
  var lng = languages;


  getUserLanguage() async {
    //Recupera do SharedPreferences o idioma nativo do usuário
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userLanguage = (prefs.getString('UserLanguage') ?? null);
    });

    //Remove da lista de idiomas aquele que o usuário já sabe
    if (userLanguage != null)
      lng = lng.where((x) => x.ISOCode != userLanguage).toList();
  }

  @override
  void initState() {
    getUserLanguage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Language you want to learn"),
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
          children: List.generate(lng.length, (index) {
            return Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LanguageDetail(language: lng[index])));
                        },
                        child: Container(
                          padding: EdgeInsets.all(25.0),
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: lng[index].flag.image,
                                height: 100,
                              ),
                              Divider(),
                              Text(lng[index].name)
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
