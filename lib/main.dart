import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mostcommonwordsbylanguage/pages/languages.dart';
import 'package:mostcommonwordsbylanguage/pages/userLanguage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Most Common Words By Language',
      //é definido como false para não mostrar uma label na parte superior direita da tela
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userLanguage;

  //Recupera do SharedPreferences o idioma nativo do usuário
  getUserLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userLanguage = (prefs.getString('UserLanguage') ?? null);
    });
  }

  @override
  void initState() {
    getUserLanguage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _introScreen(userLanguage);
  }
}

Widget _introScreen(String userLanguage) {
  dynamic navigateAfterSeconds;
  //Se já tiver o idioma do usuário salvo nas preferências direciona para tela de listagem dos idiomas senão pede para ele informar
  if (userLanguage == null) {
    navigateAfterSeconds = UserLanguage();
  } else {
    navigateAfterSeconds = Languages();
  }

  //Cria a SplashScreen do app
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        title: Text("\n\n\n Most Common Words \n by \n Language",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
                 )),
        backgroundColor: Colors.blue,
        gradientBackground: LinearGradient(
            colors: [
              Colors.blue,
              const Color(0xFF00CCFF),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        navigateAfterSeconds: navigateAfterSeconds,
        loaderColor: Colors.white,
      ),
    ],
  );
}
