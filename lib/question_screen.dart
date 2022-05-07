import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class _QuestionScreenState extends State<QuestionScreen> {
  var imageFile;
  final questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    bool _isUkrainianLang = true;
    bool _isRussianLang = true;

    return Scaffold(
        appBar: AppBar(
          title: const Text('запитати / спросить'),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          if (imageFile != null)
            Image.file(
              imageFile,
              fit: BoxFit.cover,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.image_search),
                onPressed: _getFromGallery,
                tooltip: 'фотогалерея',
              ),
              IconButton(
                icon: const Icon(Icons.add_a_photo),
                onPressed: _getFromCamera,
                tooltip: 'сфотографувати / сфотографировать',
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 10.0, right: 5.0, bottom: 5.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'опишіть питання / опишите вопрос',
                ),
                maxLines: null,
                controller: questionController,
              )),
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return CheckboxListTile(
              title: const Text("Українська мова"),
              value: _isUkrainianLang,
              selected: _isUkrainianLang,
              onChanged: (bool? value) {
                setState(() {
                  _isUkrainianLang = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }),
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return CheckboxListTile(
              title: const Text("Русский язык"),
              value: _isRussianLang,
              selected: _isRussianLang,
              onChanged: (bool? value) {
                setState(() {
                  _isRussianLang = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }),
          ElevatedButton(onPressed: () {}, child: const Text("надіслати / отправить"))
        ])));
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}
