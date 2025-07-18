import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/bloc/search/search_bloc.dart';
import 'package:weather_flutter_app/bloc/search/search_event.dart';
import 'package:weather_flutter_app/bloc/search/search_state.dart';
import 'package:weather_flutter_app/util/colors.dart';
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
      appBar: _appBar(context),
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
                return state.getWeatherCityData.fold(
                  (error) {
                    return SliverToBoxAdapter(
                      child: Text(
                        error,
                        style: const TextStyle(
                          color: MyColors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  (response) {
                    return SliverList.builder(
                      itemBuilder: (context, index) {
                        return weatherSearchBox(
                          response[index],
                          context,
                          index,
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

  PreferredSizeWidget _appBar(context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: MyColors.purple,
      leading: const BackButton(color: MyColors.white),
      title: const Text('Search'),
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
    );
  }
}
