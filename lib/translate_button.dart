import 'package:flutter/material.dart';

class _TranslateButtonState extends State<TranslateButton> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, i) {return const Divider();}
    );
  }
}

class TranslateButton extends StatefulWidget {
  const TranslateButton({Key? key}) : super(key: key);

  @override
  State<TranslateButton> createState() => _TranslateButtonState();
}