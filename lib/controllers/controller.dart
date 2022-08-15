

import 'dart:math';

import 'package:get/get.dart';

class LogicControllers extends GetxController{
  late RxInt rand1;
  late RxInt rand2;
  late RxInt rand3;
  print(){
   rand1 = Random().nextInt(9).obs;
   rand2 = Random().nextInt(9).obs;

   rand3 = Random().nextInt(9).obs;
  // int rand2 = Random().nextInt(16);
  while(rand1 == rand2){
  rand1 = Random().nextInt(9).obs;
  rand2 = Random().nextInt(9).obs;
  }
  while(rand1 == rand3){
  rand1 = Random().nextInt(9).obs;
  rand2 = Random().nextInt(9).obs;
  }
   while(rand2 == rand3){
  rand1 = Random().nextInt(9).obs;
  rand2 = Random().nextInt(9).obs;
  }
  
  // print('$rand1 $rand2')
  // ;
  // print(");
  // print('');
  }
}