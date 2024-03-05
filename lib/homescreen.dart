import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userinput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      answer.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 3,
              child: Column(children: [
                Row(
                  children: [
                    MyButton(
                      title1: 'AC',
                      onpress: () {
                        userinput = '';
                        answer = '';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '+/-',
                      onpress: () {},
                    ),
                    MyButton(
                      title1: '%',
                      onpress: () {
                        userinput += '%';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '/',
                      color1: Color(0xffffa00a),
                      onpress: () {
                        userinput += '/';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title1: '7',
                      onpress: () {
                        userinput += '7';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '8',
                      onpress: () {
                        userinput += '8';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '9',
                      onpress: () {
                        userinput += '9';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: 'x',
                      color1: Color(0xffffa00a),
                      onpress: () {
                        userinput += 'x';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title1: '4',
                      onpress: () {
                        userinput += '4';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '5',
                      onpress: () {
                        userinput += '5';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '6',
                      onpress: () {
                        userinput += '6';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '-',
                      color1: Color(0xffffa00a),
                      onpress: () {
                        userinput += '-';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title1: '1',
                      onpress: () {
                        userinput += '1';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '2',
                      onpress: () {
                        userinput += '2';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '3',
                      onpress: () {
                        userinput += '3';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '+',
                      color1: Color(0xffffa00a),
                      onpress: () {
                        userinput += '+';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title1: '0',
                      onpress: () {
                        userinput += '0';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '.',
                      onpress: () {
                        userinput += '.';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: 'del',
                      onpress: () {
                        userinput =
                            userinput.substring(0, userinput.length - 1);
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title1: '=',
                      color1: Color(0xffffa00a),
                      onpress: () {
                        equalPress();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  void equalPress() {
    String finaluserinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
