import 'package:flutter/foundation.dart';

class SearchKeywordModel extends ChangeNotifier {
    String _searchKeyword = "";

    setSearchKeyword(String text){
        this._searchKeyword = text;
        notifyListeners();
    }

    String get searchKeyword => _searchKeyword;
}