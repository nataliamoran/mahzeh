import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import 'translate_button.dart';

class _QuestionState extends State<Question> {

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: _screenWidth > 1200 ? _screenWidth / 2 : _screenWidth,
            child: Image(
              image: AssetImage(widget.imageName),
              fit: BoxFit.cover,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ExpandablePanel(
              collapsed: ExpandableButton(
                  child: Text(widget.imageDescription, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,)
              ),
              expanded: Text(widget.imageDescription, softWrap: true, ),
            )
          ),
        ],
    );
  }
}

class Question extends StatefulWidget {
  final String imageName;
  final String imageDescription;
  final List answers;
  const Question({Key? key,
    required this.imageName,
    required this.imageDescription,
    required this.answers}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}