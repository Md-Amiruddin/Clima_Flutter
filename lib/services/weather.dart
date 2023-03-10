import '../services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

const String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '${openWeatherMapURL}q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherDate = await networkHelper.getData();
    return weatherDate;
  }

  Future<dynamic> getLocationWeather() async{
    Location currLocation = Location();
    await currLocation.getCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper('${openWeatherMapURL}lat=${currLocation.latitude}&lon=${currLocation.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
