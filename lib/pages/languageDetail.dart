import 'package:flutter/material.dart';
import 'package:mostcommonwordsbylanguage/models/language.dart';
import 'package:mostcommonwordsbylanguage/service/endpoint.dart';
import 'package:mostcommonwordsbylanguage/models/wordList.dart';

class LanguageDetail extends StatefulWidget {
  final Language language;

  const LanguageDetail({Key key, this.language}) : super(key: key);

  @override
  _LanguageDetailState createState() => _LanguageDetailState();
}

class _LanguageDetailState extends State<LanguageDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.language.name),
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
        body: Column(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                  image: widget.language.flag.image,
                  fit: BoxFit.fill,
                ))),
            Container(
              child: new Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: Text(
                  'Most Common Words',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: FutureBuilder<List<WordList>>(
                        future: getWordList(widget.language),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return new Text('Word list is not loading');
                            case ConnectionState.waiting:
                              return new Text('Loading word list...');
                            default:
                              if (snapshot.hasError)
                                return new Text(
                                    'An error occurred while loading the word list: ${snapshot.error}');
                              else {
                                List<WordList> words = snapshot.data ?? [];
                                return DataTable(
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text('Pos.',
                                          style: TextStyle(fontSize: 15.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Description',
                                          style: TextStyle(fontSize: 15.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Translation',
                                          style: TextStyle(fontSize: 15.0)),
                                    ),
                                  ],
                                  rows: words
                                      .map(
                                        (word) => DataRow(cells: [
                                          DataCell(Container(
                                              width: 30, //SET width
                                              child: Text(
                                                  (word.index).toString(),
                                                  style: TextStyle(
                                                      fontSize: 15.0)))),
                                          DataCell(
                                            Text(word.word,
                                                style:
                                                    TextStyle(fontSize: 15.0)),
                                          ),
                                          DataCell(
                                            Text(word.translation,
                                                style:
                                                    TextStyle(fontSize: 15.0)),
                                          ),
                                        ]),
                                      )
                                      .toList(),
                                );
                              }
                          }
                        }))),
          ],
        ));
  }
}
