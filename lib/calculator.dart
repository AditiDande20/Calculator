import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Color baseColor = Colors.purple;
  TextEditingController userInput = TextEditingController();
  String answer = "";

  @override
  void initState() {
    hideKeyboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      backgroundColor: brightness == Brightness.light
          ? Colors.grey.shade100
          : const Color.fromARGB(255, 17, 17, 17),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      textAlign: TextAlign.end,
                      controller: userInput,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                            color: brightness == Brightness.light
                                ? Colors.grey
                                : Colors.white70),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                          fontSize: 30,
                          color: baseColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        answer,
                        style: TextStyle(
                            fontSize: 50,
                            color: brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: calculatorButtomWidget("AC", baseColor)),
                      Expanded(child: calculatorButtomWidget("DEL", baseColor)),
                      Expanded(child: calculatorButtomWidget("%", baseColor)),
                      Expanded(child: calculatorButtomWidget("/", baseColor)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: calculatorButtomWidget(
                              "7",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(
                          child: calculatorButtomWidget(
                              "8",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(
                          child: calculatorButtomWidget(
                              "9",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(child: calculatorButtomWidget("*", baseColor)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: calculatorButtomWidget(
                              "4",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(
                          child: calculatorButtomWidget(
                              "5",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(
                          child: calculatorButtomWidget(
                              "6",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(child: calculatorButtomWidget("-", baseColor)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: calculatorButtomWidget(
                              "1",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(
                          child: calculatorButtomWidget(
                              "2",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(
                          child: calculatorButtomWidget(
                              "3",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(child: calculatorButtomWidget("+", baseColor)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: calculatorButtomWidget(
                              "00",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(
                          child: calculatorButtomWidget(
                              "0",
                              brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white)),
                      Expanded(child: calculatorButtomWidget(".", baseColor)),
                      Expanded(child: calculatorButtomWidget("=", baseColor)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  calculatorButtomWidget(
    String text,
    Color textColor,
  ) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;

    return InkWell(
    onTap: () {
        handleTap(text);
      },
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        height: 80,
        width: 80,
        margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
        decoration: BoxDecoration(
            color: text == "="
                ? baseColor
                : brightness == Brightness.light
                    ? Colors.grey.shade100
                    : const Color.fromARGB(255, 17, 17, 17),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: brightness == Brightness.light
                      ? Colors.grey.shade300
                      : Colors.black,
                  offset: const Offset(
                    7,
                    7,
                  ),
                  blurRadius: 10,
                  spreadRadius: 1),
              BoxShadow(
                  //top
                  color: brightness == Brightness.light
                      ? Colors.white
                      : Colors.grey.shade900,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(
                    brightness == Brightness.light ? -7 : -3,
                    brightness == Brightness.light ? -7 : -3,
                  ))
            ]),
        duration: const Duration(seconds: 3),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 22,
                color: text == "=" ? Colors.white : textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void handleTap(String text) {
    var operatorList = ["+", "-", "*", "/", "%", "."];
    if (text == "AC") {
      userInput.clear();
      setState(() {
        answer = "";
      });
    } else if (text == "DEL") {
      setState(() {
        if (RegExp(r'^[a-zA-Z]+$').hasMatch(userInput.text.trim())) {
          userInput.clear();
          answer = "";
        }
        userInput.text = removeLastString(userInput.text);
      });
    } else if (operatorList.contains(text) && _isNumeric(validateOperator())) {
      if (text == ".") {
        if (!userInput.text.trim().contains(".")) {
          userInput.text = userInput.text + text;
        }
      } else {
        setState(() {
          userInput.text = userInput.text + text;
        });
      }
    } else if (_isNumeric(text) &&
        !RegExp(r'^[a-zA-Z]+$').hasMatch(userInput.text.trim())) {
      setState(() {
        userInput.text = userInput.text + text;
      });
    } else if (text == "=" && userInput.text.trim().isNotEmpty) {
      calculateAnswer();
    }
  }

  bool _isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  removeLastString(String text) {
    if (text.trim().isNotEmpty) {
      String result = text.substring(0, text.length - 1);
      return result;
    } else {
      return "";
    }
  }

  validateOperator() {
    if (userInput.text.trim().isNotEmpty) {
      var last = userInput.text[0];
      if (userInput.text.length >= 2) {
        last = userInput.text.substring(userInput.text.length - 1);
      }
      if (userInput.text.length == 1) {
        last = userInput.text[0];
      }
      return last;
    } else {
      return "";
    }
  }

  calculateAnswer() {
    try {
      setState(() {
        answer = userInput.text.interpret().toString();
        userInput.text = answer;
      });
    } on Error catch (e) {
      debugPrint('error caught: ${e.toString()}');
    }
  }

  hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
