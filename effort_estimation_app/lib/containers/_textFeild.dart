// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class InputFeild extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  InputFeild({ Key? key, required this.controller,required this.hintText}) : super(key: key);

  @override
  _InputFeildState createState() => _InputFeildState();
}

class _InputFeildState extends State<InputFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
      child:  TextField(
        controller: widget.controller,
        decoration: InputDecoration(
         enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.white, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.white, width: 0),
              ),
              filled: true,
              hintStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              hintText: widget.hintText,
              fillColor: Colors.white,
        ),
      ),
    );
  }
}