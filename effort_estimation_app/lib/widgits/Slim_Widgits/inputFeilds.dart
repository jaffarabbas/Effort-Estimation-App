// ignore_for_file: file_names, unnecessary_new, unused_field, prefer_final_fields

import 'package:effort_estimation_app/containers/_textFeild.dart';
import 'package:flutter/material.dart';

class InputArea extends StatefulWidget {
  TextEditingController locController;
  TextEditingController cController;
  TextEditingController tController;

  InputArea({ Key? key,required this.locController, required this.cController, required this.tController}) : super(key: key);

  @override
  _InputAreaState createState() => _InputAreaState();
}

class _InputAreaState extends State<InputArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFeild(controller: widget.locController,hintText: "Write LOC (Line Of Code)"),
        InputFeild(controller: widget.cController,hintText: "Write C (technology constant) 610 to 57314"),
        InputFeild(controller: widget.tController,hintText: "Write t (development constant)"),
      ],
    );
  }
}