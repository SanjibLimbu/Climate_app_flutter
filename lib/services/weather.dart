import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';

var apikey = '0dd18ad9ac21f7a43d99d32d8f805630';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHandler networkHandler = NetworkHandler(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkHandler.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHandler networkHandler = NetworkHandler(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkHandler.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
