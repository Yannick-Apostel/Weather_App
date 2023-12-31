import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/application/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/home/widget/detailButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case > 200 && <= 300: // Thunderstorm
        return Image.asset('assets/images/1-1.png');
        break;
      case > 300 && < 400: // Drizzle
        return Image.asset('assets/images/2-1.png');
        break;
      case >= 500 && < 600: // Rain
        return Image.asset('assets/images/2-1.png');
        break;
      case >= 600 && < 700: //SNOW
        return Image.asset('assets/images/3-1.png');
        break;
      case >= 700 && < 800:
        return Image.asset('assets/images/2-1.png');
        break;
      case == 800: // clear 
        return Image.asset('assets/images/0-1.png');
      case > 800 && <= 804: // cloud 
        return Image.asset('assets/images/0-2.png');
        break;
      default:
        return Image.asset('assets/images/0-1.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white, //TODO change Theme
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Align(
              alignment: const AlignmentDirectional(0, -1.5),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.lightBlue),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(6, -1.9),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[700]),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-6, -1.9),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[700]),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.75),
              child: Container(
                height: 300,
                width: 300,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(1, 255, 220, 1)),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
              ),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherSucces) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${state.weather.areaName}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Good Morning', //TODO: adjust to time
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: DetailButton(callback: () {
                              debugPrint('button pressed');
                            }),
                          ),
                        ]),
                  );
                } else {
                  return Container(); // TODO: Failure
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
