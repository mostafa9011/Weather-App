class WeatherModel {
  final String cityName, image, weatherCondition;
  final double temp, maxTemp, minTemp;
  final DateTime date;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.image,
    required this.weatherCondition,
  });
  factory WeatherModel.fromJason(jason) {
    return WeatherModel(
      cityName: jason['location']['name'],
      date: DateTime.parse(jason['current']['last_updated']),
      temp: jason['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: jason['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: jason['forecast']['forecastday'][0]['day']['mintemp_c'],
      image: jason['forecast']['forecastday'][0]['day']['condition']['icon'],
      weatherCondition: jason['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
