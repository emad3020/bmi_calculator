import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final double result;
  final int age;
  final bool isMale;

  BmiResultScreen({this.age, this.isMale, this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender: ${isMale ? 'Male' : 'Female'}',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Result: ${result.round()}',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Age: $age',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
