// ignore_for_file: prefer_const_constructors

import 'package:effort_estimation_app/pages/cocomo_page.dart';
import 'package:effort_estimation_app/pages/functional_point.dart';
import 'package:effort_estimation_app/pages/slim_page.dart';
import 'package:effort_estimation_app/widgits/Dashboard/dashboardCard.dart';
import 'package:effort_estimation_app/widgits/Dashboard/dashboardCard.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        DashboardCard(name: "Slim",page:SlimModel()),
        DashboardCard(name: "Cocomo",page:CocomoModel()),
        DashboardCard(name: "FP",page:FunctionalPoint())
      ],
    );
  }
}