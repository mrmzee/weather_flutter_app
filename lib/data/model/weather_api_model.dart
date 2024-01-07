class WeatherCity {
  String name;
  String country;
  double lat;
  double lon;
  String state;

  WeatherCity(this.name, this.country, this.lat, this.lon, this.state);

  factory WeatherCity.fromJson(Map<String, dynamic> json) {
    return WeatherCity(
      json['name'],
      json['country'],
      json['lat'],
      json['lon'],
      json['state'] ?? '',
    );
  }
}
