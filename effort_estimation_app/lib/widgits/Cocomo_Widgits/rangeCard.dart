// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class RangeCard extends StatelessWidget {
  String title,description;
  RangeCard({ Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListTile(
        tileColor: Colors.white,
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}