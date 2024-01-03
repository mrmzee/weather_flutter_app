import 'package:flutter/material.dart';

class SingleWeatherScreen extends StatefulWidget {
  const SingleWeatherScreen({super.key});

  @override
  State<SingleWeatherScreen> createState() => _SingleWeatherScreenState();
}

class _SingleWeatherScreenState extends State<SingleWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/night.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(),
      ),
    );
  }
}
