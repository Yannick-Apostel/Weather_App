import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/application/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/detailpage/detailpage.dart';
import 'package:weather_app/presentation/home/homeScreen.dart';
import 'package:weather_app/presentation/splashScreen/splashscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     home: FutureBuilder(
      future: _determinePosition(), 
      builder: (context, snap){
        if(snap.hasData){
          return BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc()..add(CurrentWeather(snap.data as Position)),
            child: const DetailPage(),
            );
            
        }else{
          //Loading Screen
          return const Scaffold(
            body: Center(
              child: SplashScreen(),
            ),
          );
        }
      }),
    );
  }
}


//! Geolocator -  requesting permission

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

 
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 
  return await Geolocator.getCurrentPosition();
}