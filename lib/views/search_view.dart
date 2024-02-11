
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: TextField(
            // style: TextStyle(color: Colors.amber),
            onSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: value);
                  Navigator.pop(context);
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide()),
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter a City',
                labelText: 'Search',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 33, horizontal: 16)),
          ),
        ),
      ),
    );
  }
}
