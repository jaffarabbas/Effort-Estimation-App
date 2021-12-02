// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names

import 'package:effort_estimation_app/containers/calculateButton.dart';
import 'package:effort_estimation_app/widgits/Slim_Widgits/inputFeilds.dart';
import 'package:effort_estimation_app/containers/outputCalculation.dart';
import 'package:flutter/material.dart';

class SlimModel extends StatefulWidget {
  SlimModel({Key? key}) : super(key: key);

  @override
  _SlimModelState createState() => _SlimModelState();
}

class _SlimModelState extends State<SlimModel> {
  TextEditingController locController = new TextEditingController();
  TextEditingController cController = new TextEditingController();
  TextEditingController tController = new TextEditingController();
  late String kValue = '';
  @override
  Widget build(BuildContext context) {
    void CalculateSILM() {
      setState(() {
        double loc = double.parse(locController.value.text);
        double c = double.parse(cController.value.text);
        double t = double.parse(tController.value.text);
        //k=((loc/c)*t(4)(4/3))*3
        double K = double.parse((((loc / (c * (t * (4 / 3))))* 3).toStringAsFixed(2)));
        kValue = "${K.toString()} K";
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
                  height:20,
                ),
                Text(
                  'SLIM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputArea(
                    locController: locController,
                    cController: cController,
                    tController: tController),
                OutPutScreen(
                  calculatedValue: kValue,
                ),
                CalculateButton(
                  runner: CalculateSILM,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
