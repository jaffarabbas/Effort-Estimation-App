// ignore_for_file: file_names, unnecessary_new, unused_field, prefer_final_fields

import 'package:effort_estimation_app/containers/_textFeild.dart';
import 'package:flutter/material.dart';

class FunctionPointInputArea extends StatefulWidget {
  TextEditingController EI; 
  TextEditingController EO;
  TextEditingController EQ;
  TextEditingController ILF;
  TextEditingController ELF;

  FunctionPointInputArea({ Key? key,required this.EI, required this.EO, required this.EQ , required this.ILF, required this.ELF}) : super(key: key);

  @override
  _FunctionPointInputAreaState createState() => _FunctionPointInputAreaState();
}

class _FunctionPointInputAreaState extends State<FunctionPointInputArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFeild(controller: widget.EI,hintText: "Write External Input (EI)"),
        InputFeild(controller: widget.EO,hintText: "Write External Output (EO)"),
        InputFeild(controller: widget.EQ,hintText: "Write External Inquiries (EQ)"),
        InputFeild(controller: widget.ILF,hintText: "Write Internal Logical File (ILF)"),
        InputFeild(controller: widget.ELF,hintText: "Write External Interface File (EIF)"),
      ],
    );
  }
}