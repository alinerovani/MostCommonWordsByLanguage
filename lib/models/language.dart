import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Language {
  String name;
  String linkWordList;
  Image flag;
  String ISOCode;

  Language({this.name, this.flag, this.linkWordList, this.ISOCode});
}

//Lista de idiomas exibidos no app
List<Language> languages = [
  Language(
      name: "English",
      flag: Image.asset('icons/flags/png/us.png', package: 'country_icons'),
      linkWordList:
          "https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english.txt",
      ISOCode: "en"),
  Language(
      name: "Portuguese",
      flag: Image.asset('icons/flags/png/br.png', package: 'country_icons'),
      linkWordList:
          "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/pt_br/pt_br_50k.txt",
      ISOCode: "pt"),
  Language(
      name: "Dutch",
      flag: Image.asset('icons/flags/png/de.png', package: 'country_icons'),
      linkWordList:
          "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/nl/nl_50k.txt",
      ISOCode: "nl"),
  /*Language(
      name: "Japanese",
      flag: Image.asset('icons/flags/png/jp.png', package: 'country_icons'),
      linkWordList:
          "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/ja/ja_50k.txt",
      ISOCode: "ja"),*/
  Language(
      name: "Italian",
      flag: Image.asset('icons/flags/png/it.png', package: 'country_icons'),
      linkWordList:
          "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/it/it_full.txt",
      ISOCode: "it"),
  Language(
      name: "Arabic",
      flag: Image.asset('icons/flags/png/ae.png', package: 'country_icons'),
      linkWordList:
          "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/ar/ar_50k.txt",
      ISOCode: "ar"),
/*  Language(
      name: "Polish",
      flag: Image.asset('icons/flags/png/pl.png', package: 'country_icons'),
      linkWordList:
      "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/pl/pl_50k.txt",
      ISOCode: "pl"),*/
  Language(
      name: "Russian",
      flag: Image.asset('icons/flags/png/ru.png', package: 'country_icons'),
      linkWordList:
      "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/ru/ru_50k.txt",
      ISOCode: "ru"),
  Language(
      name: "Greek",
      flag: Image.asset('icons/flags/png/gr.png', package: 'country_icons'),
      linkWordList:
      "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/el/el_50k.txt",
      ISOCode: "gr"),
  Language(
      name: "Swedish",
      flag: Image.asset('icons/flags/png/sv.png', package: 'country_icons'),
      linkWordList:
      "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/sv/sv_50k.txt",
      ISOCode: "sv"),
  /*Language(
      name: "Thai",
      flag: Image.asset('icons/flags/png/th.png', package: 'country_icons'),
      linkWordList:
      "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/th/th_50k.txt",
      ISOCode: "th"),*/
  Language(
      name: "Turkish",
      flag: Image.asset('icons/flags/png/tr.png', package: 'country_icons'),
      linkWordList:
      "https://raw.githubusercontent.com/hermitdave/FrequencyWords/master/content/2016/tr/tr_50k.txt",
      ISOCode: "tr"),
];

