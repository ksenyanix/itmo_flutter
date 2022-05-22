import 'dart:convert';

import 'package:flutter/material.dart';
import 'Product_model.dart';
import 'barcode.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool responseIsEmpty = false;
List<Prod> products = [];

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();

  void fetchProd() async {
    final response = await http.get(Uri.parse(barcode)
        //, headers: {"Access-Control-Allow-Origin": "*"}
        );
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      print(decoded['status']);
      var list1 = decoded['additives_old_tags'] as List;
      print(list1);

      productSorter(decoded);

      //   // if (decoded['status'] == '0') {
      //   //   responseIsEmpty = true;
      //   // } else {
      //   //   productSorter(decoded);
      //   // }
      // } else {
      //   throw Exception('Failed to load album');
    }
    print(barcode);
    print("this is ");
    print(products);
  }

  void productSorter(rest) {
    products = rest
        .map<Prod>((json) => Prod.fromJson(json))
        .toList(); //method to map and save the json to the list previously created
  }

  String fd = '';
  bool entryIsNotNumber = false;
  int entry = 0;
  String hintText = "Barcode number";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.yellow[200],
                ),
                child: const Center(
                  child: Center(
                    child: Text(
                      "Enter a 12-digit barcode value \n to search for a product",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                    hintText: hintText,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    suffixIcon: IconButton(
                      onPressed: () {
                        //clears the text field
                        _textController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    )),
              ),
              const SizedBox(height: 20),
              Center(
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () async {
                      if (_textController.text.length == 12) {
                        print("length is 12");
                        try {
                          entry = int.parse(_textController.text);
                          print("entry is intable");
                        } catch (e) {
                          entryIsNotNumber = true;
                        }
                      } else {
                        entryIsNotNumber = true;
                      }
                      if (!entryIsNotNumber) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        );
                        setState(() {
                          barcode =
                              "https://world.openfoodfacts.org/api/v0/product/${entry}.json";
                        });

                        fetchProd();
                        await Future.delayed(const Duration(seconds: 4));
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SecondPage(title: "Second");
                        }));
                      } else {
                        hintText = "Enter a 12-digit barcode number";
                        _textController.clear();

                        final snackBar = SnackBar(
                          content: new Text("Enter a 12-digit barcode number"),
                          duration: new Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          elevation: 20,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    color: Colors.yellow[500],
                    child: const Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Result",
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
            child: responseIsEmpty == true || products.isEmpty
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.yellow[120],
                    ),
                    padding: const EdgeInsets.all(50),
                    margin: const EdgeInsets.all(50),
                    child: const Center(
                        child: Text(
                      "No search has been submitted or there are no products that match your search",
                      textAlign: TextAlign.center,
                    )))
                // : ListView.separated(
                //     padding: const EdgeInsets.all(8),
                //     itemCount: 1,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         child: ProdCard(
                //           itself: products[index].itself,
                //           ingredients: (products[index].ingredients),
                //           additives: (products[index].additives),
                //           nutriments: (products[index].nutriments),
                //         ),
                //       );
                //     },
                //     separatorBuilder: (BuildContext context, int index) =>
                //         const Divider(),
                //   )
                : Center(child: Text("have decoded json"))));
  }
}
