import 'package:flutter/material.dart';

import 'question.dart';

class _AnswerScreenState extends State<AnswerScreen> {
  final answerController = TextEditingController();

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('перекласти / перевести'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Question(
              imageName: widget.imageName,
              imageDescription: widget.imageDescription,
              answers: widget.answers),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (var answer in widget.answers)
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(answer),
                ))
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 10.0, right: 5.0, bottom: 5.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'відповісти / ответить',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        widget.answers.add(answerController.text);
                      });
                      answerController.clear();
                    },
                  ),
                ),
                maxLines: null,
                controller: answerController,
              )),
        ],
      )),
    );
  }
}

class AnswerScreen extends StatefulWidget {
  final String imageName;
  final String imageDescription;
  final List answers;

  const AnswerScreen(
      {Key? key,
      required this.imageName,
      required this.imageDescription,
      required this.answers})
      : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}
