// ignore_for_file: prefer_const_constructors_in_immutables, file_names

import 'package:effort_estimation_app/widgits/Cocomo_Widgits/rangeCard.dart';
import 'package:flutter/material.dart';

class CocomoRange extends StatefulWidget {
  CocomoRange({ Key? key }) : super(key: key);

  @override
  _CocomoRangeState createState() => _CocomoRangeState();
}

class _CocomoRangeState extends State<CocomoRange> {
  List rangeInfo = [
    {
      "title":"Organic",
      "description":"2-50 KLOC",
    },
    {
      "title":"Semidetached",
      "description":"51-300 KLOC",
    },
    {
      "title":"Embedded",
      "description":">300 KLOC",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: rangeInfo.length,
        itemBuilder: (context, index) {
          return RangeCard(title: rangeInfo[index]["title"], description: rangeInfo[index]["description"]);
        },
      ),
    );
  }
}