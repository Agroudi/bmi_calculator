import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BMI_ResultsScreen.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

enum Gender {Male, Female}

class _BmiCalculatorState extends State<BmiCalculator> {
  Gender selectedGender = Gender.Female;
  double height = 130;
  int weight = 40;
  int age = 16;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    Color genderColor = selectedGender == Gender.Male ? Colors.blue : Colors.pink;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: selectedGender == Gender.Male ? Colors.blue : Colors.pink,
        title: Text(
          "BMI Calculator",
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: ()
                          {
                            setState(()
                            {
                              selectedGender = Gender.Male;
                            });
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('assets/images/Male.png'),
                                  height: 90.0,
                                  width: 90.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "MALE",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(color: selectedGender == Gender.Male ? genderColor : Colors.grey[800], borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: ()
                          {
                            setState(()
                            {
                              selectedGender = Gender.Female;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(color: selectedGender == Gender.Female ? genderColor : Colors.grey[800], borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('assets/images/Female.png'),
                                  width: 90.0,
                                  height: 90.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "FEMALE",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${height.round()}',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'CM',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Slider(value: height, min: 120, max: 220,
                            onChanged: (value)
                            {
                              setState(() {
                                height = value;
                              });
                            }),
                      ],
                    ),
                    decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children:[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${weight}',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  FloatingActionButton( heroTag: 'weight--' ,onPressed: ()
                                  {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                    mini: true,
                                    backgroundColor: genderColor,
                                    child: Icon(Icons.remove),
                                  ),
                                  FloatingActionButton( heroTag: 'weight++',onPressed: ()
                                  {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                    mini: true,
                                    backgroundColor: genderColor,
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${age}',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  FloatingActionButton( heroTag:'age--',onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                    mini: true,
                                    backgroundColor: genderColor,
                                    child: Icon(Icons.remove),
                                  ),
                                  FloatingActionButton(heroTag: 'age++',onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                    mini: true,
                                    backgroundColor: genderColor,
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(genderColor),),
                  onPressed: ()
                  {
                    var result = weight / pow(height / 100, 2);
                    print(result.round());

                    print("selected Gender: ${selectedGender == Gender.Male ? "Male" : "Female"}");

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => BmiResultscreen(
                        gender: selectedGender,
                        result: result.round(),
                        height: height,
                        weight: weight,
                        age: age,
                        isMale: selectedGender == Gender.Male,
                      ),
                    )
                    );
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}