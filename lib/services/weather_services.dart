import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'key=53b90223e9b1402395b211725240302';
  WeatherServices({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      //statusCode!=200
      Response response =
          await dio.get('$baseUrl/forecast.json?$apiKey&q=$cityName');
      return WeatherModel.fromJason(response.data);
      //statusCode!=200
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Opps..,there was an error,try later';
      throw (errorMessage);
    } catch (e) {
      log(e.toString());
      throw ('Opps..,there was an error,try later');
    }
  }
}
