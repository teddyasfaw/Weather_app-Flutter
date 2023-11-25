import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/services/weatherFetcher.dart';

// ignore: must_be_immutable
class WeatherForecast extends StatefulWidget {
  WeatherForecast({required this.city, required this.color});

  String city;
  Color color;

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchWeatherForecast(city: widget.city),
      builder: ((BuildContext context, AsyncSnapshot<List<Weather>> weather) {
        if (weather.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      DateFormat("Hm")
                          .format(weather.data![index].date!.toLocal())
                          .toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GlassmorphicContainer(
                      width: 80,
                      height: 100,
                      borderRadius: 10,
                      blur: 2,
                      alignment: Alignment.bottomCenter,
                      border: 2,
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
                      child: Column(children: [
                        Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'http://openweathermap.org/img/w/${weather.data![index].weatherIcon}.png',
                          ),
                        ),
                        Text(
                          "${weather.data![index].temperature!.celsius!.round().toString()}C°",
                          style: TextStyle(
                              color: widget.color,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return Center();
      }),
    );
  }
}
