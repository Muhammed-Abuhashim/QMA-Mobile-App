import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class DiseaseSelectionController extends GetxController{
  var selecteddisease = "".obs;

  onChangedisease(var disease){
    selecteddisease.value = disease;
    debugPrint("$selecteddisease");
  }
}

class DiseaseSelectionController2 extends GetxController{
  var selecteddisease2 = "".obs;
  
  onChangedisease(var disease){
    selecteddisease2.value = disease;
    debugPrint("$selecteddisease2");
  }
}