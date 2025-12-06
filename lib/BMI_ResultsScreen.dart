import 'dart:math';
import 'package:flutter/material.dart';
import 'BMI_CalculatorScreen.dart';

class BmiResultscreen extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;
  final int weight;
  final double height;
  final Gender gender;

  const BmiResultscreen({Key? key,
    required this.gender,
    required this.isMale,
    required this.result,
    required this.height,
    required this.weight,
    required this.age,
  }) : super(key:key);

  double calculateBMI(){
    return weight / pow(height / 100, 2);
  }

  String getBMICategory(double result) {
    if (result < 18.5) {
      return 'Under Weight';
    } else if (result >= 18.5 && result <= 24.9) {
      return 'Healthy Weight';
    } else if (result >= 25 && result <= 29.9) {
      return 'Over Weight';
    } else {
      return 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    double result = calculateBMI();
    String bmiCategory = getBMICategory(result);
    String genderText = isMale ? "Male" : 'Female';
    print(genderText);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gender == Gender.Male ? Colors.blue : Colors.pink,
        title: Text(
          "BMI Results",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
              "Gender: ${genderText}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height: ${height.round()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  'CM',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Weight: ${weight}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  'KG',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Age: ${age}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  'yrs',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI: ${result.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 4),
              ],
            ),
            Text(
              "Category: $bmiCategory",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}