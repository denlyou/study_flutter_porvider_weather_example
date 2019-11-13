import 'package:flutter/foundation.dart' show immutable;

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