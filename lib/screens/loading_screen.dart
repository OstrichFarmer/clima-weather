import 'package:clima_weather/services/networking.dart';
import 'package:flutter/material.dart';
import './../services/location.dart';

const apiKey = '4ef1f8be98dc4a22f5d4a841fb1fce8a';

class LoadingScreen extends StatefulWidget {
  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid={$apiKey}');

    var weatherData = await networkHelper.getData();
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
