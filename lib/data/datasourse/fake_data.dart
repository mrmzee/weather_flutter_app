import 'package:weather_flutter_app/data/datasourse/weather_datasourse.dart';
import 'package:weather_flutter_app/data/model/weather_model.dart';

class WebApiFake implements IWeatherDataSource {
  @override
  Future<List<Weather>> getWeatherDataList(String cityName) async {
    var tempList = [
      Weather('rasht2', 17, 270),
      Weather('rasht1', 15, 220),
      Weather('rasht3', 12, 210),
      Weather('Tehran', 20, 180),
      Weather('Dubai', 30, 320),
      Weather('London', 18, 250),
      Weather('New York', 25, 280),
      Weather('Paris', 22, 230),
      Weather('Tokyo', 28, 300),
      Weather('Sydney', 25, 290),
      Weather('Berlin', 15, 200),
      Weather('Moscow', 10, 170),
      // Add more cities as needed
    ];

    return tempList;
  }
}
