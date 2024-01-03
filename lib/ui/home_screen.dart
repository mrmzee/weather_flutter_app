import 'package:flutter/material.dart';
import 'package:weather_flutter_app/util/colors.dart';

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
                return _weatherBox();
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
            hintStyle: TextStyle(color: MyColors.grey),
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

  Widget _weatherBox() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset('assets/images/weather_box.png'),
          Positioned(
            top: -5,
            right: 20,
            bottom: 20,
            child: Image.asset('assets/images/Day_Snow.png'),
          ),
          const Positioned(
            top: 70,
            left: 50,
            child: Text(
              '17°',
              style: TextStyle(
                color: Colors.white,
                fontSize: 64,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 0.01,
                letterSpacing: 0.37,
              ),
            ),
          ),
          const Positioned(
            top: 120,
            left: 50,
            child: Text(
              'Rasht',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 0.01,
                letterSpacing: 0.37,
              ),
            ),
          ),
          const Positioned(
            top: 150,
            left: 50,
            child: Text(
              '20:20',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 0.01,
                letterSpacing: 0.37,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
