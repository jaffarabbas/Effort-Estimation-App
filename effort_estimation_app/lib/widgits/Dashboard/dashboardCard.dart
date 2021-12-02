// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, unused_import, must_be_immutable

import 'package:effort_estimation_app/pages/slim_page.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  String name;
  StatefulWidget page;

  DashboardCard({Key? key, required this.name,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          )),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Card(
          color: Colors.blueAccent,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
