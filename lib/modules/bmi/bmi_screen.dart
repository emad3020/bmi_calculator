import 'dart:math';

import 'package:bmicalculater/modules/bmi_result/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  var isMale = true;
  var sliderHeight = 120.0;
  var weight = 40;
  var age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isMale ? Colors.blue : Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/male.png'),
                            height: 90.0,
                            width: 90.0,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'MALE',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isMale ? Colors.grey[400] : Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/female.png'),
                            height: 90.0,
                            width: 90.0,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${sliderHeight.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Slider(
                        value: sliderHeight,
                        max: 220.0,
                        min: 80.0,
                        onChanged: (newValue) {
                          setState(() {
                            sliderHeight = newValue;
                          });
                          print(newValue.round());
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age minus',
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              mini: true,
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              heroTag: 'age plus',
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              mini: true,
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$weight',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'weight minus',
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              mini: true,
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              heroTag: 'weight pluss',
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              mini: true,
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              height: 50.0,
              onPressed: () {
                var result = weight / pow(sliderHeight / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BmiResultScreen(
                            age: age,
                            isMale: isMale,
                            result: result,
                          )),
                );
              },
              child: Text(
                'Calculate',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
