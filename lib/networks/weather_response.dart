class WeatherResponse {
    WeatherResponseCoordData coord; // 좌표
    List<WeatherResponseWeatherData> weather; // 날씨 정보 배열
    String base; // Internal parameter?!
    WeatherResponseMainData main;
    int visibility; // ?
    WeatherResponseWindData wind;
    WeatherResponseCloudsData clouds;
    WeatherResponseRainData rain;
    WeatherResponseSnowData snow;
    int dt;
    WeatherResponseSysData sys;
    int id;
    String name;
    int cod;

    // 생성자
    WeatherResponse(
        this.coord, this.weather, this.base, this.main, this.visibility, this.wind, this.clouds,
          this.rain, this.snow, this.dt, this.sys, this.id, this.name, this.cod
    );

    // json 직렬화
    WeatherResponse.fromJson(Map<String, dynamic> json){
        List<dynamic> jsonList;
        Map<String, dynamic> subJson;
        this.coord= WeatherResponseCoordData.fromJson(json["coord"]);
        jsonList = json["weather"];
        this.weather = jsonList.map(
            (subJson) => WeatherResponseWeatherData.fromJson(subJson)
        ).toList();
        this.base = json["base"];
        this.main = WeatherResponseMainData.fromJson(json["main"]);
        this.visibility = json["visibility"];
        this.wind = WeatherResponseWindData.fromJson(json["wind"]);
        this.clouds = WeatherResponseCloudsData.fromJson(json["clouds"]);
        subJson = json["rain"];
        this.rain = subJson==null?null:WeatherResponseRainData.fromJson(subJson);
        subJson = json["snow"];
        this.snow = subJson==null?null:WeatherResponseSnowData.fromJson(json["snow"]);
        this.dt = json["dt"];
        this.sys = WeatherResponseSysData.fromJson(json["sys"]);
        this.name = json["name"];
        this.cod = json["cod"];
        subJson = null;
        jsonList = null;
    }
}

class WeatherResponseCoordData {
    double lat, lon;
    WeatherResponseCoordData(this.lat, this.lon);
    WeatherResponseCoordData.fromJson(Map<String, dynamic> json) :
        lat=json["lat"].toDouble(),
        lon=json["lon"].toDouble()
    ;
}

class WeatherResponseWeatherData {
    int id; // Weather condition id
    String main; // 현재 날씨
    String description; // 날씨 상세
    String icon; // 아이콘id
    WeatherResponseWeatherData(this.id, this.main, this.description, this.icon);
    WeatherResponseWeatherData.fromJson(Map<String, dynamic> json) :
        id=json["id"],
        main=json["main"],
        description=json["description"],
        icon=json["icon"]
    ;
}

class WeatherResponseMainData {
    double temp; // 온도
    int pressure, humidity;
    double tempMin, tempMax; // 최소, 최대온도
    WeatherResponseMainData(this.temp, this.pressure, this.humidity, this.tempMin, this.tempMax);
    WeatherResponseMainData.fromJson(Map<String, dynamic> json) :
        temp=double.parse("${json["temp"]}") - double.parse("273.15"),
        pressure=json["pressure"],
        humidity=json["humidity"],
        tempMin=json["temp_min"].toDouble(),
        tempMax=json["temp_max"].toDouble()
    ;
}

class WeatherResponseWindData {
    double speed; // 풍속
    int deg; // 풍향
    double gust; //
    WeatherResponseWindData(this.speed, this.deg, this.gust);
    WeatherResponseWindData.fromJson(Map<String, dynamic> json) :
        speed=json["speed"].toDouble(),
        deg=json["deg"],
        gust=json["gust"]
    ;
}

class WeatherResponseCloudsData {
    int all;
    WeatherResponseCloudsData(this.all);
    WeatherResponseCloudsData.fromJson(Map<String, dynamic> json) :
        all=json["all"]
    ;
}

class WeatherResponseRainData {
    int h1, h3;
    WeatherResponseRainData(this.h1, this.h3);
    WeatherResponseRainData.fromJson(Map<String, dynamic> json) :
        h1=json["1h"], h3=json["3h"]
    ;
}

class WeatherResponseSnowData {
    int h1, h3;
    WeatherResponseSnowData(this.h1, this.h3);
    WeatherResponseSnowData.fromJson(Map<String, dynamic> json) :
        h1=json["1h"], h3=json["3h"]
    ;
}

class WeatherResponseSysData {
    int type, id;
    double message;
    String country;
    int sunrise, sunset;
    WeatherResponseSysData(this.type, this.id, this.message, this.country, this.sunrise, this.sunset);
    WeatherResponseSysData.fromJson(Map<String, dynamic> json) :
        type=json["type"],
        id=json["id"],
        message=json["message"],
        country=json["country"],
        sunrise=json["sunrise"],
        sunset=json["sunset"]
    ;
}