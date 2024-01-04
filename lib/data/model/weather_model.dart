class Weather {
  String name;
  double temp;
  int dt;
  double? degri;

  Weather(this.name, this.temp, this.dt) {
    degri = temp - 273;
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      json['name'],
      json['main']['temp'],
      json['dt'],
    );
  }
}
