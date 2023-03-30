import 'package:flutter/material.dart';
import './User.dart' show User;
import './main.dart' show Listex;

class Add extends StatefulWidget {
  const Add({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Add> createState() => _Add();
}

class _Add extends State<Add> {
  final _controllerffname = TextEditingController();
  final _controllerlast = TextEditingController();
  final _controlleremail = TextEditingController();
  final _controllermobile = TextEditingController();
  bool validate = false;
  bool validate2 = false;
  bool validate3 = false;
  bool validate4 = false;
  late final List<User> list = [];

  @override
  Widget build(BuildContext context) {
    void _sendDataBack(BuildContext context) {
      //String textToSendBack = _controllerffname.text; _controllerlast.text;_controlleremail.text;_controllermobile.text;

      List<String> textToSendBack= [_controllerffname.text, _controllerlast.text,_controlleremail.text,_controllermobile.text];
      Navigator.pop(context, textToSendBack);
    }

    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Add New ',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              TextField(
                controller: _controllerffname,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter Your First name',
                  errorText: validate ? 'This Fild can`t be empety' : null,
                ),
              ),
              TextField(
                controller: _controllerlast,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter Your Last name',
                  errorText: validate2 ? 'This Fild can`t be empety' : null,
                ),
              ),
              TextField(
                controller: _controlleremail,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter Your Email',
                  errorText: validate3 ? 'Feel Proper Email' : null,
                ),
              ),
              TextField(
                controller: _controllermobile,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter Your Mobile Number',
                  errorText: validate4 ? 'Feel Proper Mobile Number' : null,
                ),
              ),
              ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  setState(() {
                    _controllerffname.text.isEmpty
                        ? validate = true
                        : validate = false;
                    _controllerlast.text.isEmpty
                        ? validate2 = true
                        : validate2 = false;
                    if (_controlleremail.text.contains('@') &&
                        _controlleremail.text.isNotEmpty) {
                      validate3 = false;
                    } else {
                      validate3 = true;
                    }
                    if (_controllermobile.text.length >= 10 &&
                        _controllermobile.text.isNotEmpty) {
                      validate4 = false;
                      // list.add(User(
                      ///  _controllerffname.text,
                      //    _controllerlast.text,
                      //  _controlleremail.text,
                      //  _controllermobile.text));
                      _sendDataBack(context);
                      //  Navigator.pop(context);
                    } else {
                      validate4 = true;
                    }
                  });
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}

