import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:nike_shop_flutter/common/constants.dart';
import 'package:nike_shop_flutter/data/numbers_list.dart';
import 'package:nike_shop_flutter/features/theme_provider.dart';
import 'package:nike_shop_flutter/presentation/widgets/buttons.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

ThemeManager _changeTheme = ThemeManager();

class _MyHomePageState extends State<MyHomePage> {
  int value = 0;
  bool positive = false;
  bool i = true;
  String equation = "";
  String result = "0";
  String expression = "";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// toggle switch to change themen
            ///

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedToggleSwitch<bool>.dual(
                  current: positive,
                  first: false,
                  second: true,
                  dif: 20.0,
                  borderColor:
                      Theme.of(context).scaffoldBackgroundColor == Colors.black
                          ? Colors.white
                          : Colors.transparent,
                  borderWidth: 5.0,
                  height: 50,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                  onChanged: (b) {
                    setState(() {
                      final provider =
                          Provider.of<ThemeManager>(context, listen: false);
                      positive = b;
                      provider.toggleTheme(b);
                    });
                  },
                  colorBuilder: (b) => b ? Colors.red : Colors.green,
                  iconBuilder: (value) => value
                      ? const Icon(Icons.nightlight)
                      : const Icon(Icons.sunny),
                  textBuilder: (value) => value
                      ? const Center(child: Text('Light...'))
                      : const Center(child: Text('Night :)')),
                ),
              ],
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      equation,
                      style: const TextStyle(fontSize: 48),
                    )),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    result,
                    style: myNumberStyle,
                  ),
                ),
              ],
            )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: numbers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Mybutton(
                        child: numbers[index],
                        onTap: () => buttonTapped(
                          numbers[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void buttonTapped(String button) {
    setState(() {
      if (button == "=") {
        // calculate numbers anyway
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
          debugPrint(e.toString());
        }
      } else if (button == "C") {
        //clear answer
        equation = "";
        result = "0";
      } else if (button == "DEL") {
        //delete numbers from textfiled
        if (equation.isNotEmpty) {
          equation = equation.substring(0, equation.length - 1);
        }
      } else if (equation.length < 20) {
        equation += button;
      }
    });
  }
}
