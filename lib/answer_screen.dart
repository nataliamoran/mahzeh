import 'package:flutter/material.dart';

import 'translate_button.dart';

class _AnswerScreenState extends State<AnswerScreen> {

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('перекласти / перевести'),
      ),
      body: const Text("Add your answer here"),
    );
  }
}

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({Key? key}) : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}