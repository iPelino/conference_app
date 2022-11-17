import 'package:conference_app/themes/colors.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
    });
    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          incrementCounter();
        },
      ),
      body: Center(
        child: Text(
          "$counter",
          style: TextStyle(
            fontSize: 40,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
