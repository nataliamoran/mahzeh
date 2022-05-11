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
    String _title = _getTitle();
    String _placeholder = _getPlaceholder();

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
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
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: _placeholder,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (answerController.text.length > 3) {
                        setState(() {
                          widget.answers.add(answerController.text);
                        });
                        answerController.clear();
                      }
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

  String _getTitle(){
    if(widget.isUkrainianLang && widget.isRussianLang) {
      return 'перекласти / перевести';
    }
    if(widget.isUkrainianLang) {
      return 'перекласти';
    }
    else {
      return 'перевести';
    }
  }

  String _getPlaceholder(){
    if(widget.isUkrainianLang && widget.isRussianLang) {
      return 'відповісти / ответить';
    }
    if(widget.isUkrainianLang) {
      return 'відповісти';
    }
    else {
      return 'ответить';
    }
  }
}

class AnswerScreen extends StatefulWidget {
  final String imageName;
  final String imageDescription;
  final List answers;
  final bool isUkrainianLang;
  final bool isRussianLang;

  const AnswerScreen(
      {Key? key,
      required this.imageName,
      required this.imageDescription,
      required this.answers,
      required this.isUkrainianLang,
      required this.isRussianLang})
      : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}
