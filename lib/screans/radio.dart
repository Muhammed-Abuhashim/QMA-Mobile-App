// ignore_for_file: prefer_const_constructors


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../controller/radio_controller.dart';
import '../model/user_model.dart';



class radio2 extends StatefulWidget {
  @override
  RadioGroupWidget2 createState() => RadioGroupWidget2();
}
DiseaseSelectionController diseaseSelectionController = Get.put(DiseaseSelectionController());
 final _auth = FirebaseAuth.instance;
class RadioGroupWidget2 extends State {

  
  
  
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => Radio(
                value: "YES",
                groupValue: diseaseSelectionController.selecteddisease.value,
                onChanged: (val) {
                  setState(() {
                    diseaseSelectionController.onChangedisease(val);
                  });
                },
              ),
            ),
            Text(
                'YES',
                style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),
              ),
 
            Radio(
              value: "NO",
              groupValue: diseaseSelectionController.selecteddisease.value,
              onChanged: (val) {
                setState(() {
                   diseaseSelectionController.onChangedisease(val);
                   
                });
              },
            ),
             Text(
                'NO',
                style: new TextStyle(
                  fontSize: 15.0,fontWeight: FontWeight.w500
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class radio3 extends StatefulWidget {
  @override
  RadioGroupWidget3 createState() => RadioGroupWidget3();
}
 
class RadioGroupWidget3 extends State {

   final _auth = FirebaseAuth.instance;
  DiseaseSelectionController2 diseaseSelectionController2 = Get.put(DiseaseSelectionController2());
  
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => Radio(
                value: "YES",
                groupValue: diseaseSelectionController2.selecteddisease2.value,
                onChanged: (val) {
                  setState(() {
                    diseaseSelectionController2.onChangedisease(val);
                  });
                },
              ),
            ),
            Text(
                'YES',
                style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),
              ),
 
            Radio(
              value: "NO",
              groupValue: diseaseSelectionController2.selecteddisease2.value,
              onChanged: (val) {
                setState(() {
                   diseaseSelectionController2.onChangedisease(val);
                   
                });
              },
            ),
             Text(
                'NO',
                style: new TextStyle(
                  fontSize: 15.0,fontWeight: FontWeight.w500
                ),
              ),
          ],
        ),
      ],
    );
  }
}
