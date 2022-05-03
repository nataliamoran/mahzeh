import 'package:flutter/material.dart';

class _TranslateButtonState extends State<TranslateButton> {

  @override
  Widget build(BuildContext context) {
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
                widget.numAnswers == 0
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
                                widget.numAnswers.toString(),
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
            const Text('перекласти / перевести'),
          ]),
          onPressed: () {},
        ));
  }
}

class TranslateButton extends StatefulWidget {
  final int numAnswers;
  const TranslateButton({Key? key, required this.numAnswers}) : super(key: key);

  @override
  State<TranslateButton> createState() => _TranslateButtonState();
}