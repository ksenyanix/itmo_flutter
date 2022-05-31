import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'word_model.dart';

class MyAppws extends StatelessWidget {
  const MyAppws({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Urban Dictionary'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var term = ''; //for testing purposes
String req = "http://api.urbandictionary.com/v0/define?term=${term}";
String randreq = "http://api.urbandictionary.com/v0/random";
bool responseIsEmpty = false;

List<Word> words = []; //empty list of words with definitions

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false; //variable for setstate

  final _textController =
      TextEditingController(); //variable for search implementation

  String upost = ''; //variable for search implementation

  void _setState() {
    setState(() {
      _isLoading = true;
    });
  }

  bool getLoad() {
    return this._isLoading;
  }

  void fetchWord() async {
    _isLoading = true;
    final response = await http
        .get(Uri.parse(req), headers: {"Access-Control-Allow-Origin": "*"});

    if (response.contentLength != null /*&& response.contentLength! > 10*/) {
      var decoded = jsonDecode(response.body);

      if (decoded["list"] == null && decoded["list"].isEmpty) {
        responseIsEmpty = true;
      } else {
        var rest = decoded["list"] as List;
        if (response.statusCode == 200) {
          Words(rest);
        } else {
          throw Exception('Failed to load album');
        }
      }
    } else {
      responseIsEmpty = true;
    }
    print(req);
  }

  void Words(rest) {
    words = rest
        .map<Word>((json) => Word.fromJson(json))
        .toList(); //method to slice, map and save the json to the list previously created
    _isLoading = false;
  }

  //these 2 methods could have been implemented as one, but i decided to leave them be as it all works fine

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   child: const Center(
                //     child: Text(
                //       "Search for definitions \n from Urban Dictionary",
                //       style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                //     ),
                //   ),
                //   color: Colors.blue[200],
                //   height: 100,
                // ),
                // const SizedBox(
                //   height: 25,
                // ),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    controller: _textController,
                    decoration: InputDecoration(
                        hintText: "Type in a word to search",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        suffixIcon: IconButton(
                          onPressed: () {
                            //clears the text field
                            _textController.clear();
                          },
                          icon: const Icon(Icons.clear),
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                  ),
                ),
                SizedBox(width: 5),
                ButtonTheme(
                  height: 60,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        );
                        setState(() {
                          req =
                              "http://api.urbandictionary.com/v0/define?term=${_textController.text}";
                        });
                        fetchWord();
                        await Future.delayed(const Duration(seconds: 3));

                        Navigator.of(context).pop();

                        if (responseIsEmpty == true || words.isEmpty) {
                          final snackBar = SnackBar(
                            content: new Text(
                                "There is no definition for your search"),
                            duration: new Duration(seconds: 3),
                            behavior: SnackBarBehavior.floating,
                            elevation: 20,
                            backgroundColor: Color.fromARGB(255, 19, 79, 230),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SecondPage(title: "Second");
                          }));

                          setState(() {
                            _isLoading = false;
                          });
                        }
                      },
                      color: Color.fromARGB(255, 19, 79, 230),
                      child: const Text(
                        "Search",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              constraints: BoxConstraints(minWidth: double.infinity),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade500,
                  )
                ],
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[500],
              ),
              child: Column(
                children: [
                  Image.asset(
                    'images/1233.png',
                    height: 200,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Powered by Urban Dictionary",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int like = 0;

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[500],
        // appBar: AppBar(
        //   backgroundColor: Colors.blue[500],
        //   title: const Text(
        //     "Definitions",
        //     textAlign: TextAlign.center,
        //   ),
        // ),
        body: Center(
            child:
                // responseIsEmpty == true || words.isEmpty
                //     ? Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(30),
                //             color: Colors.blue[500],
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.blue.shade800,
                //                 offset: Offset(4, 4),
                //                 blurRadius: 15,
                //                 spreadRadius: 1,
                //               ),
                //               BoxShadow(
                //                 color: Colors.blue.shade300,
                //                 offset: Offset(-4, -4),
                //                 blurRadius: 15,
                //                 spreadRadius: 1,
                //               )
                //             ]),
                //         padding: const EdgeInsets.all(50),
                //         margin: const EdgeInsets.all(50),
                //         child: const Center(
                //             child: Text(
                //           "No search has been submitted or the dictionary doesn't contain any definitions for your search, return to the home page and try again",
                //           textAlign: TextAlign.center,
                //         )))
                //     :
                Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ButtonTheme(
              height: 60,
              minWidth: double.infinity,
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Color.fromARGB(255, 19, 79, 230),
                  child: const Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: words.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        child: WordCard(
                          itself: words[index].itself,
                          definition:
                              (words[index].definition.replaceAll("[", ""))
                                  .replaceAll("]", ""),
                          thumbsup: (words[index].thumbsup + like),
                          example: (words[index].example.replaceAll("[", ""))
                              .replaceAll("]", ""),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ],
        )));
  }
}
