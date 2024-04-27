class notes {
  final String name, country, region, id;
  String condition;
  final double latitude, longitude;
  final double tempF, tempC;

  final double windKMH;
  final int humidity;
  final double uv;
  final String localtime;
  final String weatherimg;

  notes({
    required this.condition,
    required this.name,
    required this.country,
    required this.region,
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.tempF,
    required this.tempC,
    required this.windKMH,
    required this.humidity,
    required this.uv,
    required this.localtime,
    required this.weatherimg,
  });

  factory notes.fromJson(Map<String, dynamic> json) {
    return notes(
      name: json["location"]["name"],
      country: json["location"]["country"],
      region: json["location"]["region"],
      id: json["location"]["tz_id"],
      latitude: json["location"]["lat"],
      longitude: json["location"]["lon"],
      tempC: json["current"]["temp_c"],
      tempF: json["current"]["temp_f"],
      windKMH: json["current"]["wind_kph"],
      humidity: json["current"]["humidity"],
      uv: json["current"]["uv"],
      localtime: json["location"]["localtime"],
      condition: json["current"]["condition"]["text"],
      weatherimg: json["current"]["condition"]["icon"],
    );
  }
}
