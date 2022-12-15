import 'package:climate_app/services/networking.dart';
import 'package:climate_app/services/location.dart';
import 'package:flutter/material.dart';

const apikey = '0dd18ad9ac21f7a43d99d32d8f805630';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitude;
  late double latitide;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitide = location.latitude;
    longitude = location.longitude;
    NetworkHandler networkHandler = NetworkHandler(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitide&lon=$longitude&appid=$apikey');

    var weatherData = networkHandler.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
