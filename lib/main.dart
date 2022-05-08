import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

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
  List _questions = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/test_data.json');
    final data = await json.decode(response);
    setState(() {
      _questions = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {

    return _questions.isEmpty ?  const Scaffold() : Scaffold(
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
        itemCount: _questions.length,
        itemBuilder: (context, i) {
          String _picturePath = "assets/images/${_questions[i]["title"]}";
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Question(imageName: _picturePath,
                    imageDescription: _questions[i]["description"],
                    answers: _questions[i]["answers"]),
                TranslateButton(imageName: _picturePath,
                    imageDescription: _questions[i]["description"],
                    answers: _questions[i]["answers"]),
              ],
            ),
          );
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
