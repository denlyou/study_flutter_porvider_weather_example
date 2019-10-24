import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart' show immutable;
import 'package:exam/common.dart';

/// 검색 가능한 도시 목록
class CityModel {
    final List<CityItem> _cityList = [];
    bool isDataInit = false;

    List<CityItem> get cityList => _cityList;

    // 내부 json파일에서 읽어옴
    CityModel(){
        Common.log4method("CityModel.CityModel");

        rootBundle.loadString("assets/data/city.korea.list.json").then((fileContents) => jsonDecode(fileContents)).then((dataJsonArray) {
            dataJsonArray.forEach( (dataJson) {
                Map<String, dynamic> itemjson = dataJson as Map<String, dynamic>;
                _cityList.add( CityItem.fromJson(itemjson) );
            });
            isDataInit = true;
        }).catchError( (err) =>Common.log4error(err) );
    }

    /// 데이터 비우기
    void clearData(){
        Common.log4method("CityModel.clearData");

        _cityList.clear();
        isDataInit = false;
    }

    /// 도시 목록 반환
    List<CityItem> findCityList(String searchKeyword){
        Common.log4method("CityModel.getCityList($searchKeyword)");
        // 검색어가 있다면... (^^; 검색 성능은 따지지 않는 걸로!!)
        return _cityList.where( (CityItem city) {
            return city.name.toString().toLowerCase().contains( searchKeyword.toLowerCase() );
        } ).toList();
    }

    // id로 도시 객체 반환
    CityItem getById(int cityId){
        for (CityItem city in _cityList) {
            if (cityId == city.id) return city;
        }
        return null;
    }

}

@immutable
class CityItem {
    final int id;
    final String name;

    CityItem(this.id, this.name);
    CityItem.fromJson(Map<String, dynamic> json) :
        id=json["id"],
        name=json["name"]
    ;
}