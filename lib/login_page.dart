import 'package:flutter/material.dart';
import 'package:weatherapp/pages/home_page.dart';
import 'package:weatherapp/us_page.dart';
import 'package:weatherapp/weatherPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PageController pagecontroller = PageController();
  var screens = [
    WeatherPage(
      city: "Addis Ababa",
      color: Colors.greenAccent,
    ),
    WeatherPage(
      city: "Jimma, ET",
      color: Colors.pinkAccent,
    ),
    WeatherPage(
      city: "Hawassa, ET",
      color: Colors.black,
    ),
    WeatherPage(
      city: "Gondar, ET",
      color: Colors.limeAccent,
    ),
    WeatherPage(
      city: "Mek'ele, ET",
      color: Colors.redAccent,
    ),
    WeatherPage(
      city: "New York",
      color: Colors.purpleAccent,
    ),
    WeatherPage(
      city: "London",
      color: Colors.white,
    ),
    WeatherPage(
      city: "Moscow, RU",
      color: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            PageView(
              controller: pagecontroller,
              children: screens,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.search),
                    Text('የአየር ሁኔታ ፈልግ'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 24, 24, 24),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                },
                child: Icon(Icons.message_sharp,
                    size: 35), // You can adjust the size as needed
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(
                      2), // Adjust padding to make the button smaller
                  primary: Colors.grey, // Change the color as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ይህ አዲስ ገጽ ነው'),
      ),
    );
  }
}
