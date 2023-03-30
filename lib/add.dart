import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 130.0),
                child: Text(
                  'Add New ',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
              TextButton(
                child: const Text(
                  'Back',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  //signup screen
                },
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
                  errorText: validate ? 'This Filed can`t be empty' : null,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _controllerlast,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter Your Last name',
                  errorText: validate2 ? 'This Filed can`t be empty' : null,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _controlleremail,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter Your Email',
                  errorText: validate3 ? 'Feel Proper Email' : null,
                ),
              ),
              const SizedBox(
                height: 15,
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
                    if (_controlleremail.text.contains(
                        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                      validate3 = false;
                    } else {
                      validate3 = true;
                    }

                    if (_controllermobile.text.length >= 10 &&
                        _controllermobile.text.isNotEmpty) {
                      validate4 = false;
                    } else {
                      validate4 = true;
                    }
                    if (!validate && !validate2 && !validate3 && !validate4) {
                      var data = Method(
                          name: _controllerffname.text,
                          lastname: _controllerlast.text,
                          email: _controlleremail.text,
                          mobile: _controllermobile.text,
                        fav: true,);

                      Navigator.pop(context, data);
                    } else {}
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
class Method {
  late String name;
  late String lastname;
  late String email;
  late String mobile;
  late bool fav;

  Method(
      {required this.name,
      required this.lastname,
      required this.email,
      required this.mobile,
      required this.fav
      });
}
