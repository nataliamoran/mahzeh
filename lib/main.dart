import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'translate_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mahzeh',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          // titleTextStyle: GoogleFonts.permanentMarker(
          titleTextStyle: GoogleFonts.oi(
            fontSize: 14,
            color: Colors.deepPurple,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.deepOrange,
            padding: EdgeInsetsDirectional.fromSTEB(10, 5, 20, 5),
            // alignment: Alignment.center,
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.comfortaa().fontFamily),
          ),
        ),
        fontFamily: GoogleFonts.comfortaa().fontFamily,
      ),
      home: const Mahzeh(),
    );
  }
}

class Mahzeh extends StatefulWidget {
  const Mahzeh({Key? key}) : super(key: key);

  @override
  State<Mahzeh> createState() => _MahzehState();
}

class _MahzehState extends State<Mahzeh> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _flowers = [
    'assets/images/camomile.jpeg',
    'assets/images/tulips.jpeg',
    'assets/images/snapdragon.jpeg',
    'assets/images/clover.jpeg'
  ];
  final _testText =
      "Но я должен объяснить вам, как родилась вся эта ошибочная идея отрицания удовольствия и восхваления боли, и я дам вам полный отчет о системе и излагаю фактические учения великого исследователя истины, Создатель человеческого счастья";
  final _testAnswers = ["один тестовый ответ", "другой тестовый ответ"];
  var _flower_i = 0;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('mahzeh'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: _pushSaved,
            tooltip: 'запитати / спросить',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();
          _flower_i += 1;

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = _saved.contains(_suggestions[index]);

          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: _screenWidth > 1200 ? _screenWidth / 2 : _screenWidth,
                  child: Image(
                    image: AssetImage(_flowers[_flower_i % _flowers.length]),
                    fit: BoxFit.cover,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    _testText,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const TranslateButton(),

                // Image.asset(_flowers[_flower_i % _flowers.length]),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   child: FittedBox(
                //     child: Image.asset(_flowers[0]),
                //     fit: BoxFit.fill,
                //   ),
                // ),
              ],
            ),
          );

          // return ListTile(
          //   title: Text(
          //     _suggestions[index].asPascalCase,
          //     style: _biggerFont,
          //   ),
          //   leading: Image.asset(
          //     'assets/images/camomile.jpeg',
          //   ),
          //   trailing: Icon(
          //     alreadySaved ? Icons.favorite : Icons.favorite_border,
          //     color: alreadySaved ? Colors.red : null,
          //     semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
          //   ),
          //   onTap: () {
          //     setState(() {
          //       if (alreadySaved) {
          //         _saved.remove(_suggestions[index]);
          //       } else {
          //         _saved.add(_suggestions[index]);
          //       }
          //     });
          //   },
          // );
        },
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: Text('запитати / спросить'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
