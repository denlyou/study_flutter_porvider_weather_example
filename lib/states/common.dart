import 'package:flutter/material.dart';
import 'package:exam/common.dart';

class CommonModel {
    bool isNavStackOnSearchScreen = false; // 검색화면이 네비게이션 스택에 존재하는가? (최상단 화면여부 체크)
    double width, height; // 화면의 가로, 세로 크기 정보

    setScreenSize(Size size){
        width = size.width;
        height = size.height;
        Common.log("ScreenSize: $width x $height");
    }
}