import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/bloc/home/home_bloc.dart';
import 'package:weather_flutter_app/bloc/home/home_event.dart';
import 'package:weather_flutter_app/bloc/search/search_bloc.dart';
import 'package:weather_flutter_app/bloc/search/search_event.dart';
import 'package:weather_flutter_app/data/model/weather_api_model.dart';
import 'package:weather_flutter_app/util/colors.dart';
import 'package:weather_flutter_app/widgets/toast_widget.dart';

Widget weatherSearchBox(WeatherCity weather, context, index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 130,
          width: 345,
          decoration: const BoxDecoration(
            color: MyColors.darkPurple,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 130,
                width: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      weather.name,
                      style: const TextStyle(
                        color: MyColors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      weather.state,
                      style: const TextStyle(
                        color: MyColors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      weather.country,
                      style: const TextStyle(
                        color: MyColors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<SearchBloc>(context).add(
                    WeatherAddToHomeEvent(index, weather.name),
                  );
                  BlocProvider.of<HomeBloc>(context).add(
                    RefreshHomeEvent(),
                  );

                  showToast(context, 'Add home screen . . . ');
                },
                child: Container(
                  height: 130,
                  width: 145,
                  decoration: const BoxDecoration(
                    color: MyColors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/images/Plus.png'),
                      ),
                      const Text(
                        'Add to home',
                        style: TextStyle(
                          color: MyColors.white,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
