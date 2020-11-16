import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:mostcommonwordsbylanguage/models/language.dart';
import 'package:translator/translator.dart';
import 'package:mostcommonwordsbylanguage/models/wordList.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Recupera o idioma nativo do usuário do SharedPreferences
getUserLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userLanguage = (prefs.getString('UserLanguage') ?? null);

  return userLanguage;
}

//Recupera a lista de palavras mais comuns no idioma que o usuário quer aprender
getMostCommonWords(String url) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
  HttpClientResponse response = await request.close();
  String responseBody = await response.transform(utf8.decoder).join();
  var words = responseBody.split("\n");

  httpClient.close();
  return words;
}

//Retorna para tela uma lista com as palavras mais comuns do idioma que o usuário quer aprender e a sua respectiva tradução para o idioma nativo do usuário
Future<List<WordList>> getWordList(Language language) async {
  List<WordList> wordList = new List<WordList>();
  List<String> thousandMostCommonWords = new List<String>();
  String thousandMostCommonWordsText = "";

  List<String> thousandMostCommonWordsTranslate = new List<String>();
  String thousandMostCommonWordsTranslateText = "";

  String userLanguage = await getUserLanguage();
  List<String> words = await getMostCommonWords(language.linkWordList);

  //Recupera as 100 primeiras palavras da lista por questão de desempenho
  if (words.length > 100) words = words.take(100).toList();

  //Percorre a lista de palavras porque cada linha vem no formato palavra + número
  //E para o usuário só vai ser exibida a palavra
  for (var word in words) {
    if (thousandMostCommonWordsText != "") thousandMostCommonWordsText += ". ";

    thousandMostCommonWordsText += word.split(" ").first;
  }

  //Faz a tradução das palavras para o idioma do usuário
  //É passado uma única string em que as palavras são separadas por ponto (.)
  // para não fazer uma requisição para cada palavra da lista
  final translator = GoogleTranslator();
  await translator
      .translate(
      thousandMostCommonWordsText,
          from: language.ISOCode,
          to: userLanguage)
      .then((response) {
    thousandMostCommonWordsTranslateText += response.toString();
  });

  //Converte as strings para lista novamente
  thousandMostCommonWords = thousandMostCommonWordsText.split(". ");
  thousandMostCommonWordsTranslate =
      thousandMostCommonWordsTranslateText.split(". ");

  if(thousandMostCommonWords.length != thousandMostCommonWordsTranslate.length)
    throw "The wordlist cannot be loaded. Please select another language.";

  //Percorre a lista de palavras e a lista de tradução para criar uma única lista
  WordList word;
  for (int count = 0; count < thousandMostCommonWords.length; count++) {
    word = new WordList();
    word.index = count + 1;
    word.word = thousandMostCommonWords[count];
    word.translation = thousandMostCommonWordsTranslate[count];

    wordList.add(word);
  }

  return wordList;
}
