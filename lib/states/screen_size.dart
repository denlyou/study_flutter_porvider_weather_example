import 'package:flutter/material.dart';
import 'package:exam/common.dart';

class ScreenSizeModel {
    Size size;
    int width, height;

    init(Size size){
        Common.log4method("ScreenSizeModel.init");
        this.size = size;
        width = size.width.toInt();
        height = size.height.toInt();
        Common.log("ScreenSize: $width x $height");
    }
}