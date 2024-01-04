import 'package:weather_flutter_app/data/datasourse/weather_datasourse.dart';
import 'package:weather_flutter_app/data/model/weather_model.dart';

class WebApiFake implements IWeatherDataSource {
  @override
  Future<List<Weather>> getWeatherDataList(String cityName) async {
    var tempList = [
      Weather('rasht2', 17, 270),
      Weather('rasht1', 15, 220),
      Weather('rasht3', 12, 210),
    ];
    return tempList;
  }
}
