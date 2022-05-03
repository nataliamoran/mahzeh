import 'package:flutter/material.dart';

import 'translate_button.dart';
import 'question.dart';

class _AnswerScreenState extends State<AnswerScreen> {

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('перекласти / перевести'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Question(imageName: widget.imageName,
                imageDescription: widget.imageDescription,
                answers: widget.answers),
          ],
        )
      ),
    );
  }
}

class AnswerScreen extends StatefulWidget {
  final String imageName;
  final String imageDescription;
  final List answers;
  const AnswerScreen({Key? key,
    required this.imageName,
    required this.imageDescription,
    required this.answers}) : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}