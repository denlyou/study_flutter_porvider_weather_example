import 'package:flutter/material.dart';
import 'package:exam/common.dart';

/// 인트로 페이지 (Scaffold Widget)
class IntroPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        Common.log4method("IntroPage.build");

        // 2초후 페이지 전환
        new Future.delayed(
            Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(context, "/home")
        );

        // 인트로 화면 반환
        return Scaffold(
            body: Container(
                color: Color.fromRGBO(37, 97, 161, 1.0),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            SizedBox(
                                width: 300.0,
                                height: 100.0,
                                child: Text("Weather Example", style: TextStyle(color: Colors.white, fontSize: 36.0) ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                    Image.asset("assets/images/02.png", width: 100.0, height: 100.0),
                                    Image.asset("assets/images/03.png", width: 100.0, height: 100.0),
                                    Image.asset("assets/images/04.png", width: 100.0, height: 100.0),
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                    Image.asset("assets/images/09.png", width: 100.0, height: 100.0),
                                    Image.asset("assets/images/01.png", width: 100.0, height: 100.0),
                                    Image.asset("assets/images/10.png", width: 100.0, height: 100.0),
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                    Image.asset("assets/images/11.png", width: 100.0, height: 100.0),
                                    Image.asset("assets/images/13.png", width: 100.0, height: 100.0),
                                    Image.asset("assets/images/50.png", width: 100.0, height: 100.0),
                                ]
                            ),
                        ],
                    )
                ),
            ),
        );
    }
}