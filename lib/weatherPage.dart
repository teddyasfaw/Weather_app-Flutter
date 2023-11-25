import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/detailedWeather.dart';
import 'package:weatherapp/services/bottomList.dart';
import 'package:weatherapp/services/weatherFetcher.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({required this.city, required this.color});

  String city;
  Color color;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
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
                      top: 80,
                      left: 30,
                      child: GestureDetector(
                        onTap: (() {
                          // Within the `FirstRoute` widget
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedWeatherPage(
                                        color: widget.color,
                                        city: widget.city,
                                      )));
                        }),
                        child: GlassmorphicContainer(
                          width: 200,
                          height: 280,
                          borderRadius: 20,
                          blur: 5,
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
                          child: Column(children: [
                            SizedBox(
                              height: 70,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'http://openweathermap.org/img/w/${weather.data!.weatherIcon}.png',
                                ),
                              ),
                            ),
                            Text(
                              widget.city,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: widget.color),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                weather.data!.country.toString(),
                                style: TextStyle(
                                    color: widget.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${weather.data!.temperature!.celsius!.round().toString()}C°",
                                style: TextStyle(
                                    color: widget.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50),
                              ),
                            ),
                            Text(
                              DateFormat("EEEE")
                                  .format(weather.data!.date!.toLocal()),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Feels Like: ${weather.data!.tempFeelsLike!.celsius!.round()} C°",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      left: 10,
                      top: 650,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: WeatherForecast(
                          city: widget.city,
                          color: widget.color,
                        ),
                      ),
                    )
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
