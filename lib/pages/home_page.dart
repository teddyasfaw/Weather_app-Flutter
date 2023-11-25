import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';
import 'package:weatherapp/cubits/weather/weather_cubit.dart';
import 'package:translator/translator.dart';

import 'package:weatherapp/pages/search_page.dart';
import 'package:weatherapp/widgets/error_dialog.dart';

import '../constants/constants.dart';
import '../cubits/temp_settings/temp_settings_cubit.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  final translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('የአየር ሁኔታ መተግበሪያ'),
        actions: [
          IconButton(
              onPressed: () async {
                _city = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));

                print('city->$_city');
                if (_city != null) {
                  context.read<WeatherCubit>().fetchWeather(_city!);
                }
              },
              icon: const Icon(Icons.search)),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SettingsPage();
                }),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sky.png"), // replace with your image
            fit: BoxFit.cover,
          ),
        ),
        child: _showWeather(),
      ),
    );
  }

  String showTemperature(double temperature) {
    final tempUnit = context.watch<TempSettingsCubit>().state.tempUnit;

    if (tempUnit == TempUnit.fahrenheit) {
      return ((temperature * 9 / 5) + 32).toStringAsFixed(2) + '℉';
    }

    return temperature.toStringAsFixed(2) + '℃';
  }

  Widget showIcon(String icon) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/loading.gif',
      image: 'http://$kIconHost/img/wn/$icon@4x.png',
      width: 96,
      height: 96,
    );
  }

  Future<Widget> formatText(String description) async {
    final translation =
        await translator.translate(description, from: 'en', to: 'am');
    final formattedString = ReCase(translation.text).titleCase;

    return Text(
      formattedString,
      style: const TextStyle(
          fontSize: 35.0,
          color: Colors.yellow), // replace with your desired color
      textAlign: TextAlign.center,
    );
  }

  Widget _showWeather() {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state.status == WeatherStatus.error) {
          errorDialog(context, state.error.errMsg);
        }
      },
      builder: (context, state) {
        if (state.status == WeatherStatus.initial) {
          return const Center(
            child: Text(
              'የከተማ ስም ከላይ ምረጥ',
              style: TextStyle(
                  fontSize: 40.0,
                  color: Color.fromARGB(
                      255, 192, 189, 14)), // replace with your desired color
            ),
          );
        }
        if (state.status == WeatherStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == WeatherStatus.error && state.weather.name == '') {
          return const Center(
            child: Text(
              'የከተማ ስም ከላይ ምረጥ',
              style: TextStyle(
                  fontSize: 40.0,
                  color: Color.fromARGB(
                      255, 223, 202, 14)), // replace with your desired color
            ),
          );
        }
        return ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Text(
              state.weather.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // replace with your desired color
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TimeOfDay.fromDateTime(state.weather.lastUpdated)
                      .format(context),
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white), // replace with your desired color
                ),
                const SizedBox(width: 10.0),
                Text(
                  '(${state.weather.country})',
                  style: const TextStyle(
                      fontSize: 25.0,
                      color: Color.fromARGB(255, 238, 244,
                          54)), // replace with your desired color
                ),
              ],
            ),
            const SizedBox(height: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  showTemperature(state.weather.temp),
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow, // replace with your desired color
                  ),
                ),
                const SizedBox(width: 20.0),
                Column(
                  children: [
                    Text(
                      showTemperature(state.weather.tempMax),
                      style: const TextStyle(
                          fontSize: 25.0,
                          color:
                              Colors.white), // replace with your desired color
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      showTemperature(state.weather.tempMin),
                      style: const TextStyle(
                          fontSize: 25.0,
                          color:
                              Colors.white), // replace with your desired color
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                showIcon(state.weather.icon),
                Expanded(
                  flex: 3,
                  child: FutureBuilder<Widget>(
                    future: formatText(state.weather.description),
                    builder:
                        (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        else
                          return snapshot.data!; // widget to display
                      }
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        );
      },
    );
  }
}
