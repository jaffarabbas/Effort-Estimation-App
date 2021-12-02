// ignore_for_file: prefer_const_constructors, unnecessary_new, non_constant_identifier_names, unused_element

import 'dart:math';

import 'package:effort_estimation_app/containers/_textFeild.dart';
import 'package:effort_estimation_app/containers/calculateButton.dart';
import 'package:effort_estimation_app/containers/outputCalculation.dart';
import 'package:effort_estimation_app/widgits/Cocomo_Widgits/CocomoRange.dart';
import 'package:flutter/material.dart';

class CocomoModel extends StatefulWidget {
  const CocomoModel({Key? key}) : super(key: key);

  @override
  _CocomoModelState createState() => _CocomoModelState();
}

class _CocomoModelState extends State<CocomoModel> {
  TextEditingController locController = new TextEditingController();
  late String personMonth = '';
  late String developmentTime = '';
  late String outputValue = '';
  @override
  Widget build(BuildContext context) {
    void Organic(double range){
      personMonth = double.parse(((2.4 * pow(range,1.05)).toStringAsFixed(2))).toString();
      developmentTime = double.parse(((2.5 * pow(double.parse(personMonth),0.38)).toStringAsFixed(2))).toString();
      outputValue = "Organic\nPerson Month : $personMonth\nDevelopment Time : $developmentTime DT";
    }
    void Semidetached(double range){
      personMonth = double.parse(((3.0 * pow(range,1.12)).toStringAsFixed(2))).toString();
      developmentTime = double.parse(((2.5 * pow(double.parse(personMonth),0.35)).toStringAsFixed(2))).toString();
      outputValue = "Semidetached\nPerson Month : $personMonth\nDevelopment Time : $developmentTime DT";
    }
    void Embedded(double range){
      personMonth = double.parse(((3.6 * pow(range,1.20)).toStringAsFixed(2))).toString();
      developmentTime = double.parse(((2.5 * pow(double.parse(personMonth),0.32)).toStringAsFixed(2))).toString();
      outputValue = "Embedded\nPerson Month : $personMonth\nDevelopment Time : $developmentTime DT";
    }
    void Runner() {
      setState(() {
        double range = double.parse(locController.value.text);
        Organic(range);
        if (range >= 2 && range <= 50) {
          Organic(range);
        } else if (range >= 51 && range <= 300) {
          Semidetached(range);
        } else if (range > 300) {
          Embedded(range);
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'COCOMO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputFeild(controller: locController, hintText: 'Write KLOC'),
                CocomoRange(),
                OutPutScreen(
                  calculatedValue: outputValue,
                ),
                CalculateButton(
                  runner: Runner,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
