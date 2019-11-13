import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam/common.dart';
import 'package:exam/networks/weather_api.dart';
import 'package:exam/states/fav_city.dart';
import 'package:exam/states/weather.dart';

class FavoriteCityList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        Common.log4method("HomePage.build");

        final favItems = Provider.of<FavoriteCityModel>(context).favItems;
        final selectedCityId = Provider.of<WeatherModel>(context).cityId;

        return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(8, 4, 0, 4),
            itemCount: favItems.length,
            itemBuilder: (context, index) {
                final city = favItems[index];
                return GestureDetector(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Chip(
                            backgroundColor: city.id == selectedCityId ? Colors.lightBlueAccent : Colors.blue,
                            avatar: Icon(Icons.favorite_border, color: Colors.white),
                            label: Text(city.name, style: TextStyle(color: Colors.white)),
                        ),
                    ),
                    onTap: () async {
                        Common.log4panic(city.name);
                        Provider.of<WeatherModel>(context, listen: false).cityId = city.id;
                        WeatherNetwork.getData4CityIdAndUpdateTrigger(city.id, context);
                    },
                );
            }
        );
    }

}