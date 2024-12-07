import 'package:flutter/material.dart';

class Calculatorpage extends StatefulWidget {
  const Calculatorpage({super.key});

  @override
  State<Calculatorpage> createState() => _CalculatorpageState();
}

class _CalculatorpageState extends State<Calculatorpage> {
  //user entered values
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();

  int _result = 0;

  //methods
  void add() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;

      print("$number1 $number2");

      _result = number1 + number2;
    });
  }

  void subtraction() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;

      _result = number1 - number2;
    });
  }

  void multiply() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;

      _result = number1 * number2;
    });
  }

  void divide() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;

      double ans = number1 / number2;
      _result = ans.floor();
    });
  }

  @override
  void dispose() {
    //ToDo implement
    super.dispose();
    _number1Controller.dispose();
    _number2Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Calculator"),
        backgroundColor: const Color.fromARGB(183, 21, 90, 201),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              "Enter number 1",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            TextField(
              controller: _number1Controller,
              decoration: InputDecoration(
                  hintText: "Enter first Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.all(20)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Enter number 2",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            TextField(
              controller: _number2Controller,
              decoration: InputDecoration(
                  hintText: "Enter second Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.all(20)),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                _result.toString(),
                style: const TextStyle(fontSize: 40),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: add,
              child: const Text("+"),
            ),
            FloatingActionButton(
              onPressed: subtraction,
              child: const Text("-"),
            ),
            FloatingActionButton(
              onPressed: multiply,
              child: const Text("x"),
            ),
            FloatingActionButton(
              onPressed: divide,
              child: const Text("/"),
            )
          ],
        ),
      ),
    );
  }
}
