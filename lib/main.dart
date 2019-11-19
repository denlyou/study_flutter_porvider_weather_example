import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam/common.dart';
import 'package:exam/states/weather.dart';
import 'package:exam/states/city.dart';
import 'package:exam/states/fav_city.dart';
import 'package:exam/states/search_keyword.dart';
import 'package:exam/states/common.dart';
import 'package:exam/views/intro.dart';
import 'package:exam/views/home.dart';
import 'package:exam/views/search.dart';

void main() => runApp(MyApp());
/// 시작
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        Common.log4method("MyApp.build");

        return MultiProvider( // 멀티 프로바이더를 사용
            providers: [
                Provider(builder: (context) => CommonModel()), // 현재라우트, 화면 크기 등 정보를 가지고 있을 모델
                Provider(builder: (context) => CityModel()), // 도시 정보 목록을 가지고 있고 + 한번 읽어오면 변하지 않음!
                ChangeNotifierProvider(builder: (context) => WeatherModel()), // 홈(날씨)화면 표시용 데이터들
                ChangeNotifierProvider(builder: (context) => SearchKeywordModel()), // 검색 키워드
                ChangeNotifierProxyProvider<CityModel, FavoriteCityModel> ( // 즐겨찾는 도시
                    builder: (context, cityModel, previousFavCity) => FavoriteCityModel(cityModel, previousFavCity)
                ),
            ],
            /// 머터리얼앱 사용
            child: MaterialApp(
                title: 'Weather Provider Demo',
                initialRoute: IntroPage.routeName,
                routes: {
                    // '/intro': (context) => IntroPage(), '/': (context) => HomePage(), // 디버깅용으로 인트로 생략시
                    IntroPage.routeName: (context) => IntroPage(), // 인트로(스플래시) 화면
                    HomePage.routeName: (context) => HomePage(), // 홈(현재날씨) 화면
                    SearchPage.routeName: (context) => SearchPage(), // 지역 검색 화면
                },
            ),
        );
    }
}

