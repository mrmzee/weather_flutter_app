import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/bloc/home/home_bloc.dart';
import 'package:weather_flutter_app/bloc/home/home_event.dart';
import 'package:weather_flutter_app/bloc/home/home_state.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/di/di.dart';
import 'package:weather_flutter_app/ui/search_screen.dart';
import 'package:weather_flutter_app/util/colors.dart';
import 'package:weather_flutter_app/widgets/toast_widget.dart';
import 'package:weather_flutter_app/widgets/weather_home_box_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  FocusNode focusNodeController = FocusNode();
  final ScrollController _scrollController = ScrollController();
  bool isFabVisible = false;

  @override
  void initState() {
    focusNodeController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingButton(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<HomeBloc>(context).add(
              RefreshHomeEvent(),
            );
          },
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                setState(() {
                  isFabVisible = false;
                });
              }
              if (notification.direction == ScrollDirection.reverse) {
                setState(() {
                  isFabVisible = true;
                });
              }
              return false;
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    _searchBox(context),
                    if (state is HomeLoadingState) ...{
                      const SliverToBoxAdapter(
                        child: Center(
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    },
                    if (state is HomeDataState) ...{
                      state.weatherItemList.fold(
                        (error) {
                          return SliverToBoxAdapter(
                            child: Text(error),
                          );
                        },
                        (response) {
                          return SliverList.builder(
                            itemBuilder: (context, index) {
                              return _getWeatherHomeBox(
                                context,
                                response,
                                index,
                              );
                            },
                            itemCount: response.length,
                          );
                        },
                      )
                    },
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWeatherHomeBox(
      BuildContext context, List<WeatherItem> response, int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        BlocProvider.of<HomeBloc>(context).add(
          DismissWeatherItemEvent(index),
        );
        showToast(context, 'Delete weather box . . . !');
      },
      child: WeatherHomeBox(
        weatherItem: response[index],
      ),
    );
  }

  Widget _searchBox(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) async {
                  _searchAction();
                },
                focusNode: focusNodeController,
                controller: _textController,
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  hintText: 'Search for a city',
                  hintStyle: const TextStyle(color: MyColors.grey),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: (focusNodeController.hasFocus)
                      ? MyColors.lightPurple
                      : MyColors.grey,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: MyColors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: MyColors.lightPurple,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            _searchButton(context)
          ],
        ),
      ),
    );
  }

  Widget _searchButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _searchAction();
      },
      child: Container(
        width: 55.0,
        height: 52.0,
        decoration: ShapeDecoration(
          color: MyColors.lightPurple,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: const Icon(
          Icons.location_searching,
          color: MyColors.white,
        ),
      ),
    );
  }

  Widget _floatingButton() {
    return Visibility(
      visible: isFabVisible,
      child: FloatingActionButton(
        backgroundColor: MyColors.lightPurple,
        splashColor: MyColors.green,
        elevation: 10,
        child: const Icon(
          Icons.arrow_upward,
          color: MyColors.white,
        ),
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }

  void _searchAction() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<HomeBloc>.value(
          value: locator.get<HomeBloc>(),
          child: SearchScreen(_textController.text),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    focusNodeController.dispose();
    super.dispose();
  }
}
