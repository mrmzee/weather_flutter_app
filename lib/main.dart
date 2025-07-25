import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_flutter_app/bloc/home/home_bloc.dart';
import 'package:weather_flutter_app/bloc/home/home_event.dart';
import 'package:weather_flutter_app/data/model/weather_condition_code_model.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/di/di.dart';
import 'package:weather_flutter_app/ui/home_screen.dart';
import 'package:weather_flutter_app/util/font_style.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherItemAdapter());
  Hive.registerAdapter(WeatherConditionCodeModelAdapter());
  await Hive.openBox<WeatherItem>('weatherBox');
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = locator.get<HomeBloc>();
        bloc.add(WeatherGetHiveDataEvent());
        return bloc;
      },
      child: MaterialApp(
        theme: MyThemes.appTheme,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
