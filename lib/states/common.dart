import 'package:flutter/material.dart';
import 'package:exam/common.dart';

class CommonModel {
    String currentRouteName;
    double width, height;

    setScreenSize(Size size){
        width = size.width;
        height = size.height;
        Common.log("ScreenSize: $width x $height");
    }
}