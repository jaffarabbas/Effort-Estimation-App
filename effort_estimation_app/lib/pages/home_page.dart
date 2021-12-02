// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names, unused_import
import 'package:effort_estimation_app/containers/calculateButton.dart';
import 'package:effort_estimation_app/widgits/Dashboard/dashboard.dart';
import 'package:effort_estimation_app/widgits/Slim_Widgits/inputFeilds.dart';
import 'package:effort_estimation_app/containers/outputCalculation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController locController = new TextEditingController();
  TextEditingController cController = new TextEditingController();
  TextEditingController tController = new TextEditingController();
  late String kValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  'ESTIMATION COST',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Dashboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
