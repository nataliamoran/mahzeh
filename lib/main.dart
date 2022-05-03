import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'translate_button.dart';
import 'question.dart';
import 'question_screen.dart';
import 'app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mahzeh',
      theme: AppTheme().themeData,
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
  final _testAnswers = ["один тестовый ответ", "другой тестовый ответ", "другой тестовый ответ 2"];
  var _flower_i = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('mahzeh'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: _askQuestion,
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
                Question(imageName: _flowers[_flower_i % _flowers.length],
                    imageDescription: _testText,
                    answers: _testAnswers),
                TranslateButton(imageName: _flowers[_flower_i % _flowers.length],
                    imageDescription: _testText,
                    answers: _testAnswers),
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

  void _askQuestion() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return const QuestionScreen();
        },
      ),
    );
  }
}
