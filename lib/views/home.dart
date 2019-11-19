import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam/common.dart';
import 'package:exam/models/weather.dart';
import 'package:exam/states/weather.dart';
import 'package:exam/states/common.dart';
import 'package:exam/networks/weather_api.dart';
import 'package:exam/views/home/fav_list.dart';

class HomePage extends StatelessWidget {
    static const String routeName = '/home';

    @override
    Widget build(BuildContext context) {
        Common.log4method("HomePage.build");

        new Future.delayed(Duration(milliseconds: 1), () {
            // if( ModalRoute.of(context).settings.name == routeName ) {
                // 기본 지역(인천) ID 가져와서 네트워킹
                final int cityId = Provider.of<WeatherModel>(context, listen: false).cityId;
                WeatherNetwork.getData4CityIdAndUpdateTrigger(cityId, context);
            // }
        });
        
        return Scaffold(
            body: _HomeBody(),
            backgroundColor: Color.fromRGBO(37, 97, 161, 1.0),
            appBar: AppBar(
                title: Text("날씨"),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async { // 버튼 누르면 검색 화면으로 전환
                            // Navigator.pushNamed(context, "/search");
                            final cityId = await Navigator.pushNamed(context, "/search");
                            if(cityId == null) return;
                            // 선택해서 돌아오면
                            WeatherNetwork.getData4CityIdAndUpdateTrigger(cityId, context);
                        }
                    ),
                ],
            ),
        );
    }
}

/// 홈 내용
class _HomeBody extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        Common.log4method("HomePage > _HomeBody.build");
        // final screenWidth = MediaQuery.of(context).size.width;
        final screenWidth = Provider.of<CommonModel>(context, listen: false).width;

        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Expanded(
                    child: Consumer<WeatherModel>(
                        builder: (context, weatherState, child) {
                            Common.log4method("HomePage > _HomeBody.build > Consumer<WeatherModel>");
                            Common.log4warning(weatherState.status);
                            // 에러면
                            if (weatherState.status == WeatherStatus.error) return Common.buildErrorScaffold(weatherState.errorException);
                            // 로딩중 또는 완료
                            return (weatherState.status == WeatherStatus.done) ? _WeatherWidget(weatherState.nowWeather) :
                                Center(child: CircularProgressIndicator()); // 로딩 화면인 척..
                        }
                    ),
                ),
                SizedBox(       
                    width: screenWidth,
                    height: 48,
                    child: FavoriteCityList(),
                    // Container(color: Colors.amber)
                )
            ],
        );
    }
}

/// 날씨 화면이 보여지는 부분
class _WeatherWidget extends StatelessWidget {
    final Weather _nowWeather;
    _WeatherWidget(this._nowWeather);

    @override
    Widget build(BuildContext context) {

        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Image.asset("assets/images/${_nowWeather.icon.substring(0,2)}.png"),
                    // 온도
                    Text(
                        "${_nowWeather.temp.toStringAsFixed(2) }°C",
                        style: TextStyle(color: Colors.white, fontSize: 80.0)
                    ),
                    // 도시-국가
                    Text(
                        "${_nowWeather.cityName} - ${_nowWeather.countryCode}",
                        style: TextStyle(color: Colors.white70)
                    ),
                ],
            )
        );
    }
}