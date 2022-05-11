import 'package:flutter/material.dart';

import 'answer_screen.dart';

class _TranslateButtonState extends State<TranslateButton> {

  @override
  Widget build(BuildContext context) {
    String _buttonText = _getButtonText();

    return Container(
        margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
        child: TextButton(
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Stack(
              children: <Widget>[
                const IconButton(
                  icon: Icon(
                    Icons.edit_note,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onPressed: null,
                ),
                widget.answers.isEmpty
                    ? Container()
                    : Positioned(
                    bottom: 25.0,
                    child: Stack(
                      children: <Widget>[
                        const Icon(Icons.brightness_1,
                            size: 25.0,
                            color: Colors.deepOrange),
                        Positioned(
                            top: 5.0,
                            left: 8.0,
                            child: Center(
                              child: Text(
                                widget.answers.length.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            )),
                      ],
                    )),
              ],
            ),
            Text(_buttonText),
          ]),
          onPressed: () => { _answerQuestion() },
        ));
  }

  void _answerQuestion() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return AnswerScreen(imageName: widget.imageName,
              imageDescription: widget.imageDescription,
              answers: widget.answers);
        },
      ),
    );
  }

  String _getButtonText() {
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
}

class TranslateButton extends StatefulWidget {
  final String imageName;
  final String imageDescription;
  final List answers;
  final bool isUkrainianLang;
  final bool isRussianLang;
  const TranslateButton({Key? key,
    required this.imageName,
    required this.imageDescription,
    required this.answers,
    required this.isUkrainianLang,
    required this.isRussianLang}) : super(key: key);

  @override
  State<TranslateButton> createState() => _TranslateButtonState();
}