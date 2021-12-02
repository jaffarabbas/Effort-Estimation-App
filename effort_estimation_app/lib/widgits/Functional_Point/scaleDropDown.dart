// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ScaleDropDown extends StatefulWidget {
  String title;
  List<String> Scale;
  int index;
  Function refresh;
  ScaleDropDown({Key? key, required this.Scale, required this.index , required this.refresh , required this.title,}) : super(key: key);

  @override
  _ScaleDropDownState createState() => _ScaleDropDownState();
}

class _ScaleDropDownState extends State<ScaleDropDown> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          value: value,
          isExpanded: true,
          focusColor: Colors.white,
          hint: Text(
            widget.title,
            style: TextStyle(
                color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          
          icon: Icon(
            Icons.arrow_drop_down_circle_sharp,
            color: Colors.blue,
          ),
          items: widget.Scale.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() {
            this.value = value;
            widget.index = widget.Scale.indexOf(value);
            widget.refresh(widget.index);
          }),
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(
          color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
    ));
