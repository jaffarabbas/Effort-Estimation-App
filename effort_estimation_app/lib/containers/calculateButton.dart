// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CalculateButton extends StatefulWidget {
  Function runner;
  CalculateButton({Key? key, required this.runner}) : super(key: key);

  @override
  _CalculateButtonState createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.runner();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 105, vertical: 20),
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'CALCULATE',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
