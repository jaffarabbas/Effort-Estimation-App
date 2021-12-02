// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class OutPutScreen extends StatefulWidget {
  String calculatedValue;
  OutPutScreen({Key? key, required this.calculatedValue}) : super(key: key);

  @override
  _OutPutScreenState createState() => _OutPutScreenState();
}

class _OutPutScreenState extends State<OutPutScreen> {
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top:20,left:20),
      height: height * 0.3,
      width: width * 0.9,
      margin: EdgeInsets.only(top:20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        widget.calculatedValue,
        style: TextStyle(
          fontSize: widget.calculatedValue.length > 50  ? 20 : 40,
          color: Colors.blue,
        ),
      ),
    );
  }
}
