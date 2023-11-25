import 'package:weather/weather.dart';

Future<Weather> fetchWeather({required String city}) async {
  String apiKey = '5266fb6408e770930ec04f862e3f5e7a';
  WeatherFactory wf = new WeatherFactory(apiKey);
  Weather weatherOutput = await wf.currentWeatherByCityName(city);
  return weatherOutput;
}

Future<List<Weather>> fetchWeatherForecast({required String city}) async {
  String apiKey = '5266fb6408e770930ec04f862e3f5e7a';
  WeatherFactory wf = new WeatherFactory(apiKey);
  List<Weather> weatherForecast = await wf.fiveDayForecastByCityName(city);

  return weatherForecast;
}
