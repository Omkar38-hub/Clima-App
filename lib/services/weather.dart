import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
const apiKey='e058f1ae50e0bdafecb4d6c4cac40d60';
const weatherLoader='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityWeather(var typedName) async{
    var url = Uri.parse('$weatherLoader?q=$typedName&appid=$apiKey&units=metric',
    );
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData=await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather() async
  {
    Location location=Location();
    await location.getCurrentLocation();
    var url = Uri.parse('$weatherLoader?lat=${location.lattitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData=await networkHelper.getData();
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
