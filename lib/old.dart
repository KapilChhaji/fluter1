import 'package:flutter/material.dart';
import './add.dart' show Add;
import './add.dart' show Method;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: Listex(
          title: '',
        ),
      ),
    );
  }
}

class Listex extends StatefulWidget {
  const Listex({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Listex> createState() => _Listex();
}

class _Listex extends State<Listex> {
  List<Method> items = [];
  List<Method> newList = [];
  List<Method> fave = [];
  bool fav = true;
  final controllerg = TextEditingController();

  @override
  initState() {
    newList = items.cast<Method>();
    super.initState();
  }

  void runfilter(String enteredKeyword) {
    List<Method> results = [];

    if (enteredKeyword.isEmpty) {
      results = items.cast<Method>();
    } else {
      results = items
          .where((element) =>
          element.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .cast<Method>()
          .toList();
    }
    setState(() {
      newList = results;
    });
  }


  ListView showlsit(List newList){
    return ListView.builder(
        itemCount: newList.length,
        itemBuilder: ((context, index) {
          return ListTile(
              textColor: (index % 2 == 0)
                  ? Colors.red
                  : Colors.blue,
              title: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    CircleAvatar(
                        backgroundColor:
                        Colors.grey,
                        child: Text(
                          newList[index]
                              .name[0]
                              +newList[index]
                              .lastname[0],
                          style: const TextStyle(
                              color: Colors
                                  .black),
                        )),
                    Expanded(
                      child:Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            Text(newList[
                            index]
                                .name +
                                " "+newList[
                            index]
                                .lastname),

                            Text(newList[index]
                                .email),
                            Text(newList[index]
                                .mobile),
                          ],
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        setState(() {
                          newList[index].fav =
                          !newList[index]
                              .fav;
                        });
                      },
                      child: Text(
                        newList[index].fav
                            ? 'Fav'
                            : "Unfav",
                        style:
                        const TextStyle(
                            fontSize: 20),
                      ),
                    ),
                  ]));
        }));

  }
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10),
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Padding(
                  padding: EdgeInsets.only(left: 150.0),
                  child: Text(
                    ' List ',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push<Method>(MaterialPageRoute(
                        builder: (_) => const Add(
                          title: '',
                        )))
                    // fetching data form next page.
                        .then((value) => setState(() {
                      if (value?.name != "" &&
                          value?.lastname != "" &&
                          value?.email != "" &&
                          value?.mobile != "" &&
                          value?.fav != "") {
                        items.add(Method(
                            name: value!.name,
                            lastname: value.lastname,
                            email: value.email,
                            mobile: value.mobile,
                            fav: value.fav));
                      }
                    }));
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ]),
              const SizedBox(height: 20.0),
              DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const TabBar(
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'List'),
                            Tab(text: 'fav'),
                          ],
                        ),
                        Container(
                            height: 300, //height of TabBarView
                            //  decoration: const BoxDecoration(
                            // border: Border(
                            //   top: BorderSide(
                            //      color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              Column(
                                  children: [
                                    TextField(
                                      onChanged: (value) => runfilter(value),
                                      decoration: const InputDecoration(
                                          hintText: "Search",
                                          suffixIcon: Icon(Icons.search)),
                                    ),
                                    Expanded(

                                      // child:showlsit(newList),
                                        child: ListView.builder(
                                            itemCount: newList.length,
                                            itemBuilder: ((context, index) {
                                              return ListTile(
                                                  textColor: (index % 2 == 0)
                                                      ? Colors.red
                                                      : Colors.blue,
                                                  title: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor:
                                                            Colors.grey,
                                                            child: Text(
                                                              newList[index]
                                                                  .name[0]
                                                                  +newList[index]
                                                                  .lastname[0],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                        Expanded(
                                                          child:Padding(
                                                            padding: const EdgeInsets.only(left: 15.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(newList[
                                                                index]
                                                                    .name +
                                                                    " "+newList[
                                                                index]
                                                                    .lastname),

                                                                Text(newList[index]
                                                                    .email),
                                                                Text(newList[index]
                                                                    .mobile),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                        TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              newList[index].fav =
                                                              !newList[index]
                                                                  .fav;
                                                            });
                                                          },
                                                          child: Text(
                                                            newList[index].fav
                                                                ? 'Fav'
                                                                : "Unfav",
                                                            style:
                                                            const TextStyle(
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                      ]));
                                            }))),

                                  ]
                              ),

                              //  showlsit(fave)
                              ListView.builder(
                                  itemCount: newList.length,
                                  itemBuilder: ((context, index) {
                                    return newList[index].fav
                                        ? const Text("")
                                        : ListTile(
                                        textColor: (index % 2 == 0)
                                            ? Colors.red
                                            : Colors.blue,
                                        title: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                  backgroundColor:
                                                  Colors.grey,
                                                  child: Text(
                                                    newList[index]
                                                        .name[0]
                                                        +newList[index]
                                                        .lastname[0],
                                                    style: const TextStyle(
                                                        color: Colors
                                                            .black),
                                                  )),
                                              Expanded(
                                                child:Padding(
                                                  padding: const EdgeInsets.only(left: 15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(newList[
                                                      index]
                                                          .name +
                                                          " "+newList[
                                                      index]
                                                          .lastname),

                                                      Text(newList[index]
                                                          .email),
                                                      Text(newList[index]
                                                          .mobile),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    newList[index].fav =
                                                    !newList[index].fav;
                                                  });
                                                },
                                                child: const Text("Un fav", style:
                                                const TextStyle(
                                                    fontSize: 20),),
                                              )
                                            ]));
                                  })),
                            ]))
                      ]))
            ])));
  }
}
