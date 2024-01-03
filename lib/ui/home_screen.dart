import 'package:flutter/material.dart';
import 'package:weather_flutter_app/util/colors.dart';
import 'package:weather_flutter_app/widgets/weather_list_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const HomeMain();
  }
}

class HomeMain extends StatefulWidget {
  const HomeMain({
    super.key,
  });

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final TextEditingController _textController = TextEditingController();
  FocusNode focusNodeController = FocusNode();
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
      backgroundColor: MyColors.darkPurple,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _searchBox(),
            SliverList.builder(
              itemBuilder: (context, index) {
                return weatherBox();
              },
              itemCount: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: TextField(
          focusNode: focusNodeController,
          controller: _textController,
          style: const TextStyle(color: MyColors.white),
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
    );
  }
}
