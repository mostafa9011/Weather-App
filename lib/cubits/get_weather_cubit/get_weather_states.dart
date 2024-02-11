import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class InitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailedState extends WeatherState {
  final String text;

  WeatherFailedState({required this.text});
}
