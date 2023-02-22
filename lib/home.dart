import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var offsetword = "";
  var changedText = "";
  int direction = -1;
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(0, 1),
                      color: Colors.blueGrey)
                ]),
            child: Center(
                child: Text(
              offsetword,
              style: TextStyle(fontSize: 25),
            )),
          ),
          const Divider(),
          Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: 35,
                      child: TextField(
                        obscureText: showPass,
                        onChanged: (text) {
                          setState(() {
                            changedText = text;
                          });
                        },
                        onSubmitted: (text) {
                          setState(() {
                            offsetword = decString(changedText, direction);
                          });
                        },
                        decoration: InputDecoration(
                            icon: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(5.0)),
                              width: 100,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            direction *= -1;
                                            offsetword = decString(
                                                changedText, direction);
                                          });
                                        },
                                        icon: Icon(
                                          direction == -1
                                              ? Icons.navigate_before
                                              : Icons.navigate_next,
                                          size: 25,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            showPass = !showPass;
                                          });
                                        },
                                        icon: Icon(
                                          showPass
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          size: 25,
                                        ))
                                  ]),
                            ),
                            border: const OutlineInputBorder(),
                            labelText: 'Enter word here..',
                            labelStyle: const TextStyle(fontSize: 15)),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 15.0),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                        ),
                        child: Center(
                          child: IconButton(
                            iconSize: 22,
                            color: Colors.white,
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              setState(() {
                                offsetword = decString(changedText, direction);
                              });
                            },
                          ),
                        ))
                  ])),
        ],
      )),
    );
  }
}

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.blueGrey,
    title: const Text(
      "Offset Word.",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

String decString(String word, int direction) {
  String newWord = "";
  for (int i = 0; i < word.length; i++) {
    newWord += decChar(word[i], direction);
  }

  print(newWord.length);
  return newWord;
}

String decChar(String letter, int direction) {
  const alphabet = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];

  final index = alphabet.indexOf(letter);

  if (index + direction >= 0 && index + direction <= 25) {
    letter = alphabet[index + direction];
  } else if (index + direction < 0) {
    letter = alphabet[25];
  } else {
    letter = alphabet[0];
  }

  return letter;
}
