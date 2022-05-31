import 'package:flutter/material.dart';
import 'myappwithsearch.dart';

class Word {
  final String itself;
  final String definition;
  final int thumbsup;
  final String example;

  const Word({
    required this.itself,
    required this.definition,
    required this.thumbsup,
    required this.example,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      itself: json['word'],
      definition: json['definition'],
      thumbsup: json['thumbs_up'],
      example: json['example'],
    );
  }
}

class WordCard extends StatelessWidget {
  const WordCard({
    required this.itself,
    required this.definition,
    required this.thumbsup,
    required this.example,
    Key? key,
  }) : super(key: key);

  final String itself;
  final String definition;
  final int thumbsup;
  final String example;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue[500],
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.blue.shade500,
        //     offset: Offset(4, 4),
        //     blurRadius: 15,
        //     spreadRadius: 1,
        //   ),
        //   BoxShadow(
        //     color: Colors.blue.shade300,
        //     offset: Offset(-4, -4),
        //     blurRadius: 15,
        //     spreadRadius: 1,
        //   )
        // ]
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[500],
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade800,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.blue.shade300,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  )
                ]),
            child: Text(
              itself,
              style: TextStyle(color: Colors.blue[900], fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[500],
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade800,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.blue.shade300,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Definition:",
                      style: TextStyle(color: Colors.blue[900], fontSize: 20)),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(definition,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.blue[900])),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue[500],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade800,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.blue.shade300,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    )
                  ]),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Examples:",
                        style:
                            TextStyle(color: Colors.blue[900], fontSize: 20)),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(example,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.blue[900])),
                  ),
                ],
              )),

          // Container(
          //     padding: EdgeInsets.all(15),
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30),
          //         color: Colors.blue[500],
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.blue.shade800,
          //             offset: Offset(4, 4),
          //             blurRadius: 15,
          //             spreadRadius: 1,
          //           ),
          //           BoxShadow(
          //             color: Colors.blue.shade300,
          //             offset: Offset(-4, -4),
          //             blurRadius: 15,
          //             spreadRadius: 1,
          //           )
          //         ]),
          //     child: Text(example,
          //         textAlign: TextAlign.start,
          //         style: TextStyle(color: Colors.blue[900]))),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[500],
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade800,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.blue.shade300,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up_off_alt,
                  color: Color.fromARGB(255, 19, 79, 230),
                ),
                Text(thumbsup.toString(),
                    style: TextStyle(color: Colors.blue[900])),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
