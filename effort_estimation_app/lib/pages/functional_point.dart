// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:effort_estimation_app/containers/_text.dart';
import 'package:effort_estimation_app/containers/calculateButton.dart';
import 'package:effort_estimation_app/containers/outputCalculation.dart';
import 'package:effort_estimation_app/widgits/Functional_Point/InputFeilds.dart';
import 'package:effort_estimation_app/widgits/Functional_Point/scaleDropDown.dart';
import 'package:effort_estimation_app/widgits/mediaQuery.dart';
import 'package:flutter/material.dart';

class FunctionalPoint extends StatefulWidget {
  const FunctionalPoint({Key? key}) : super(key: key);

  @override
  _FunctionalPointState createState() => _FunctionalPointState();
}

class _FunctionalPointState extends State<FunctionalPoint> {
  TextEditingController EI = new TextEditingController();
  TextEditingController EO = new TextEditingController();
  TextEditingController EQ = new TextEditingController();
  TextEditingController ILF = new TextEditingController();
  TextEditingController ELF = new TextEditingController();
  //variables
  num F = 0, CAF = 0, UFP = 0, FP = 0;
  List<num> feildData = [];
  int scaleIndex = 0;
  int ufpIndex = 0;
  String calculatedValue = "";
  List<String> Scale = [
    '0 No Influence',
    '1 Incidental',
    '2 Moderate',
    '3 Average',
    '4 Significant',
    '5 Essential'
  ];
  List<String> UFPScale = ['Low', 'Average', 'High'];
  List<int> low = [3, 4, 3, 7, 5];
  List<int> average = [4, 5, 4, 10, 7];
  List<int> high = [6, 7, 6, 15, 10];

  //refresh the dropdown index
  void Refresh(int newIndex) {
    setState(() {
      scaleIndex = newIndex;
    });
  }

  void UFPRefresh(int newIndex) {
    setState(() {
      ufpIndex = newIndex;
    });
  }

  //collect text feilds values
  void CollectFeildsValues() {
    feildData.add(num.parse(EI.value.text));
    feildData.add(num.parse(EO.value.text));
    feildData.add(num.parse(EQ.value.text));
    feildData.add(num.parse(ILF.value.text));
    feildData.add(num.parse(ELF.value.text));
  }

  //formula for F
  void Fformula() {
    F = (14 * scaleIndex);
  }

  //CAF formula
  void CAFformula() {
    CAF = (0.65 + (0.01 * F));
  }

  //UFP
  void UFPformula() {
    feildData.forEach((element) {
      UFP += element;
    });
  }

  //FP
  void FPformula() {
    FP = (UFP * CAF);
  }

  //fill feilds data with ufp scale
  void fillFeildData(List<int> ufpScale) {
    for (int i = 0; i < feildData.length; i++) {
      feildData[i] = feildData[i] * ufpScale[i];
    }
  }

  void Caculation() {
    //populate feild data
    CollectFeildsValues();
    //caculate F
    Fformula();
    //caculate CAF
    CAFformula();
    //add ing fillFeildData value according to there range
    if (ufpIndex == 0) {
      fillFeildData(low);
    } else if (ufpIndex == 1) {
      fillFeildData(average);
    } else if (ufpIndex == 2) {
      fillFeildData(high);
    }
    //calculate UFP
    UFPformula();
    //calculate FP
    FPformula();
    //showing output Calculations
    calculatedValue = "F : $F\nCAF : $CAF\nUFP : $UFP\nFP : $FP";
  }

  // set decimal to two point
  num SetDecimal(num value) {
    return double.parse(((value).toStringAsFixed(2)));
  }

  //advance module
  bool isAdvance = true;
  @override
  List weightFactors = [];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 20, right: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextArea('FUNCTIONAL POINT',
                    Resposive.ResponsiveWidth(context, 0.1)),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAdvance = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            color: isAdvance ? Colors.white : Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Normal",
                            style: TextStyle(
                                color: isAdvance
                                    ? Colors.blueAccent
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAdvance = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            color: !isAdvance ? Colors.white : Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Advance",
                            style: TextStyle(
                                color: isAdvance
                                    ? Colors.white
                                    : Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                !isAdvance
                    ? Column(
                        children: [
                          FunctionPointInputArea(
                              EI: EI, EO: EO, EQ: EQ, ILF: ILF, ELF: ELF),
                          ScaleDropDown(
                            Scale: Scale,
                            index: scaleIndex,
                            refresh: Refresh,
                            title: 'Scale Values',
                          ),
                          ScaleDropDown(
                            Scale: UFPScale,
                            index: ufpIndex,
                            refresh: UFPRefresh,
                            title: 'UFP Range',
                          ),
                          Container(
                              height: 290,
                              child: OutPutScreen(
                                  calculatedValue: calculatedValue)),
                          CalculateButton(runner: () {
                            setState(() {
                              Caculation();
                            });
                          }),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: Resposive.ResponsiveWidth(context, 0.73),
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    hintText: 'Enter text',
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                ),
                                width: 70,
                                height: 55,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text("999",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                ),
                                width: 130,
                                height: 55,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    hintText: 'Enter text',
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                ),
                                width: 130,
                                height: 55,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    hintText: 'Enter text',
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          weightFactors.add(
                                              weightFactors.length.toInt());
                                        });
                                      },
                                      icon: Icon(Icons.add)),
                                ),
                              )
                            ],
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: weightFactors.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      width: 130,
                                      height: 55,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 0),
                                          ),
                                          filled: true,
                                          hintStyle: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          hintText: 'Enter text',
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      width: 130,
                                      height: 55,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 0),
                                          ),
                                          filled: true,
                                          hintStyle: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          hintText: 'Enter text',
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(
                                              () {
                                                weightFactors.removeAt(weightFactors.length - 1);
                                              },
                                            );
                                          },
                                          icon: Icon(
                                              Icons.delete),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              }),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
