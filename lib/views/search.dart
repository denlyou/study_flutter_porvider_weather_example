import 'package:exam/models/fav_city.dart';
import 'package:exam/models/search_keyword.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam/common.dart';
import 'package:exam/models/weather.dart';
import 'package:exam/models/city.dart';

/// 도시 검색 페이지
class SearchPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        Common.log4method("SearchPage.build");

        // 화면 세팅
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.purple,
                title: Text("도시 검색"),
            ),
            // body: _HomeBody(),
            body: Column(
                children: <Widget>[
                    _SearchInputBar(),
                    Expanded(child: _CityListview())
                ]
            )

        );
    }


}

/// 검색 화면 위젯 (stateful)
class _SearchInputBar extends StatefulWidget { @override State<StatefulWidget> createState() => new _SearchInputBarState(); }
class _SearchInputBarState extends State<_SearchInputBar> {
    final _searchTextController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        Common.log4method("SearchInputBarState.build");

        return Container(
            padding: EdgeInsets.fromLTRB(8.0,8.0,8.0,16.0),
            child: TextField(
                controller: _searchTextController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "지역 검색 (영문으로만, KR지역 Only)"
                ),
                onChanged: (text) => Provider.of<SearchKeywordModel>(context, listen: false).setSearchKeyword(text)
            ),
        );
    }
}

/// 도시 목록 ListviewBuild
class _CityListview extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        Common.log4method("SearchPage>_SearchBar.build");

        // 데이터 읽어오기
        final String searchKeyword = Provider.of<SearchKeywordModel>(context).searchKeyword;
        final cityModel = Provider.of<CityModel>(context);
        final favCityModel = Provider.of<FavoriteCityModel>(context);
        final List<CityItem> listItems = searchKeyword.length < 1 ? cityModel.cityList : cityModel.findCityList(searchKeyword);
        // 리스트 뷰 빌드
        return ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (BuildContext ctxt, int idx){
                final title = listItems[idx].name;
                final strId = "${listItems[idx].id}";
                return ListTile(
                    title: Text(title),
                    subtitle: Text(strId),
                    onTap: () {
                        Provider.of<WeatherModel>(context, listen: false).cityId = listItems[idx].id ;
                        Navigator.pop(context, listItems[idx].id);
                    },
                    trailing: IconButton(
                        icon: Icon(
                            favCityModel.contains(listItems[idx].id) ? Icons.favorite : Icons.favorite_border ,
                            color: favCityModel.contains(listItems[idx].id) ? Colors.red : Colors.grey ,
                        ),
                        onPressed: () async {
                            if( favCityModel.contains( listItems[idx].id ) ){ // 있으면 -> 제거
                                favCityModel.remove(listItems[idx].id);
                            }else{ // 없으면 추가
                                favCityModel.add(listItems[idx]);
                            }
                        },
                    ),
                );
            },
        );
    }
}