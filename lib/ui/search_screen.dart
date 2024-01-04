import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/bloc/home/home_bloc.dart';
import 'package:weather_flutter_app/bloc/home/home_event.dart';
import 'package:weather_flutter_app/bloc/search/search_bloc.dart';
import 'package:weather_flutter_app/bloc/search/search_event.dart';
import 'package:weather_flutter_app/bloc/search/search_state.dart';
import 'package:weather_flutter_app/util/colors.dart';
import 'package:weather_flutter_app/widgets/toast_widget.dart';
import 'package:weather_flutter_app/widgets/weather_search_box_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen(
    this.cityName, {
    Key? key,
  }) : super(key: key);

  final String cityName;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchBloc searchBloc;

  @override
  void initState() {
    searchBloc = SearchBloc();
    searchBloc.add(SearchGetDataEvent(widget.cityName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: searchBloc,
      child: const SearchMainWidget(),
    );
  }
}

class SearchMainWidget extends StatelessWidget {
  const SearchMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: MyColors.darkPurple,
      body: CustomScrollView(
        slivers: [
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoadingState) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              if (state is SearchGetDataState) {
                return state.getWeatherData.fold(
                  (error) {
                    return SliverToBoxAdapter(
                      child: Text(error),
                    );
                  },
                  (response) {
                    return SliverList.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: weatherSearchBox(
                              response[index].name, response[index].degri!),
                          onTap: () {
                            context.read<SearchBloc>().add(
                                  WeatherAddToHomeEvent(
                                    response[index],
                                  ),
                                );
                            context
                                .read<HomeBloc>()
                                .add(WeatherGetHiveDataEvent());

                            toastWidget(context, 'Add home screen . . . !',
                                Icons.delete, MyColors.green);
                          },
                        );
                      },
                      itemCount: response.length,
                    );
                  },
                );
              }
              return const SliverToBoxAdapter(
                child: Text('error'),
              );
            },
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: MyColors.darkPurple,
      leading: const BackButton(color: MyColors.white),
      title: const Text('Search'),
      titleTextStyle: const TextStyle(
        color: MyColors.white,
        fontSize: 24,
      ),
    );
  }
}
