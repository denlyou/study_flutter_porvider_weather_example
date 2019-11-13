import 'package:flutter/foundation.dart';
import 'package:exam/common.dart';
import 'package:exam/models/city.dart';
import 'package:exam/states/city.dart';

class FavoriteCityModel extends ChangeNotifier {
    final CityModel _cityModel;
    final List<int> _favCityIds;

    FavoriteCityModel(this._cityModel, FavoriteCityModel previous) :
        assert(_cityModel != null),
        _favCityIds = previous?._favCityIds ?? []
    ;

    // 북마크 목록 가져오기
    List<CityItem> get favItems => _favCityIds.map(
        (cityId) => _cityModel.getById(cityId)
    ).toList();

    // 북마크 추가
    void add(CityItem cityItem) {
        Common.log4method("FavoriteCityModel.add");
        _favCityIds.add(cityItem.id);
        notifyListeners();
    }

    // 북마크 해제
    void remove(int cityId) {
        Common.log4method("FavoriteCityModel.remove");
        _favCityIds.removeAt( _favCityIds.indexOf(cityId) );
        notifyListeners();
    }

    // 해당 cityId가 즐겨찾기에 있는가?
    bool contains(int cityId) => _favCityIds.contains(cityId);
}