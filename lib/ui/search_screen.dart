import 'package:flutter/material.dart';
import 'package:weather_flutter_app/util/colors.dart';
import 'package:weather_flutter_app/widgets/weather_list_box.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: MyColors.darkPurple,
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemBuilder: (context, index) {
              return weatherBox();
            },
            itemCount: 10,
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
