import 'dart:math';

import 'package:flutter/material.dart';


//获取随即颜色
Color getRandomColor({double opacity = 1}){
  return Color.fromARGB(255, Random.secure().nextInt(255),
      Random.secure().nextInt(255),
      Random.secure().nextInt(255)).withOpacity(opacity);
}