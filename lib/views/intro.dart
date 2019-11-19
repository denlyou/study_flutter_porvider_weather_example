import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:exam/common.dart';
import 'package:exam/states/city.dart';
import 'package:exam/states/common.dart';

/// 인트로 페이지 (Scaffold Widget)
class IntroPage extends StatelessWidget {
    static const String routeName = '/';

    @override
    Widget build(BuildContext context) {
        Common.log4method("IntroPage.build");

        // 0.2초후 
        new Future.delayed( Duration(milliseconds: 200), () {
            // City 모델 데이터 읽기어두기
            Provider.of<CityModel>(context, listen: false).initData();
            // 화면 사이즈를 저장
            Provider.of<CommonModel>(context, listen: false).setScreenSize( MediaQuery.of(context).size );
        });

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