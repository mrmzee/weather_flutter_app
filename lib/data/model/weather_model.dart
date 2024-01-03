class Weather {
  String name;
  int temp;
  int dt;

  Weather(this.name, this.temp, this.dt);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      json['name'],
      json['main']['temp'],
      json['dt'],
    );
  }
}
