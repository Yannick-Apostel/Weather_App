import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/home/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const HomeScreen(),
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