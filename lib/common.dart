import 'package:flutter/material.dart';

class Common {
    static const bool _isDebug = true;
    static const bool _isMethodLog = true;
    static const bool _isNetworkLog = true;

    static void log(obj){           if( _isDebug ) print("🐞 $obj"); }
    static void log4warning(obj){	if( _isDebug ) print("⚠️ $obj"); }
    static void log4error(obj){		if( _isDebug ) print("⛔ $obj"); }
    static void log4panic(obj){		if( _isDebug ) print("😱 $obj"); }
    static void log4method(name){	if( _isDebug && _isMethodLog ) print("✅ $name()"); }
    static void log4network(obj){	if( _isDebug && _isNetworkLog) print("⚡ $obj"); }

    /// 공통 에러 화면
    static Widget buildErrorScaffold(dynamic errorObj){
        Common.log4error(errorObj);
        return Scaffold(
          backgroundColor: Color.fromRGBO(37, 97, 161, 1.0),
          body: Container(color: Colors.purple, child: Center(child: Icon(Icons.warning, size: 256.0,))),
        );
    }
}