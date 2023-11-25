import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:weather/weather.dart';
import 'package:weatherapp/services/weatherFetcher.dart';

// ignore: must_be_immutable
class DetailedWeatherPage extends StatefulWidget {
  DetailedWeatherPage({required this.city, required this.color});

  String city;
  Color color;

  @override
  State<DetailedWeatherPage> createState() => _DetailedWeatherPageState();
}

class _DetailedWeatherPageState extends State<DetailedWeatherPage> {
  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/${widget.city}.png';
    return Scaffold(
      body: FutureBuilder(
        future: fetchWeather(city: widget.city),
        builder: (BuildContext context, AsyncSnapshot<Weather> weather) {
          if (weather.hasData) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: -2.5,
                      left: -2.5,
                      right: -2.5,
                      bottom: -2.5,
                      child: GlassmorphicContainer(
                        width: MediaQuery.of(context).size.width + 5,
                        height: MediaQuery.of(context).size.height + 5,
                        borderRadius: 20,
                        blur: 20,
                        alignment: Alignment.bottomCenter,
                        border: 1,
                        linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.1),
                              const Color(0xFFFFFFFF).withOpacity(0.05),
                            ],
                            // ignore: prefer_const_literals_to_create_immutables
                            stops: [
                              0.1,
                              1,
                            ]),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.5),
                            const Color((0xFFFFFFFF)).withOpacity(0.5),
                          ],
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Center(
                                    child: Text(
                                      widget.city,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                            ListTile(
                              leading: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'http://openweathermap.org/img/w/${weather.data!.weatherIcon}.png',
                                ),
                              ),
                              title: Text(
                                weather.data!.weatherDescription.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.thermostat),
                              title: Text(
                                "Temperature: ${weather.data!.temperature!.celsius!.round()} C°",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.thermostat),
                              title: Text(
                                "Max Temperature: ${weather.data!.tempMax!.celsius!.round()} C°",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.thermostat_auto),
                              title: Text(
                                "Min Temperature: ${weather.data!.tempMin!.celsius!.round()} C°",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.sick),
                              title: Text(
                                "Real Feel Temperature: ${weather.data!.tempFeelsLike!.celsius!.round()} C°",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.water),
                              title: Text(
                                "Humidity: ${weather.data!.humidity}%",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.air),
                              title: Text(
                                "Wind Speed: ${weather.data!.windSpeed} MPH",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.cloud),
                              title: Text(
                                "Overcast: ${weather.data!.cloudiness}%",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.compress),
                              title: Text(
                                "Pressure: ${weather.data!.pressure!.round()} Pa",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.compass_calibration),
                              title: Text(
                                "Wind Degree: ${weather.data!.windDegree!.round()}°",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          }
          return Center(
            child: Container(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  color: widget.color,
                )),
          );
        },
      ),
    );
  }
}
