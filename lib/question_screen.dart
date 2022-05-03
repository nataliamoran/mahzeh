import 'package:flutter/material.dart';

import 'translate_button.dart';

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('запитати / спросить'),
      ),
      body: const Text("Add your question here"),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}