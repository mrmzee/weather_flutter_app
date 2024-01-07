import 'package:flutter/material.dart';
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '${weather.state} / ${weather.country}',
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
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
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        child: Image.asset('assets/images/Plus.png'),
                      ),
                      Text('Add to home',
                          style: Theme.of(context).textTheme.titleSmall)
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
