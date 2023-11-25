import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/logo1.png',
                  width: 250,
                  height: 150,
                ),
              ),
              SizedBox(height: 5),
              SizedBox(height: 16),
              Text(
                'Debo Engineering is an integrated engineering discipline organization based on recently emerging technologies such as Artificial Intelligence, Machine Learning (ML), Internet of things (IOT), Image Processing, Big Data analysis, Mobile computing and any field related to engineering. We design, analyze, develop and implement smart business applications, solution for any problems those need Digital solution for agriculture, transportation, health, education, and other sectors.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Meet Our Team',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset('assets/jermia bayisa.jpg',
                            width: 100, height: 100), // Member 1 photo
                      ),
                      Text('JERMIA BAYISA', style: TextStyle(fontSize: 15)),
                      Text('CEO, Cofounder', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset('assets/boaz.png',
                            width: 100, height: 100), // Member 2 photo
                      ),
                      Text('BOAZ BERHANU', style: TextStyle(fontSize: 16)),
                      Text('CTO,Cofounder', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  // Add more members here
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset('assets/Lidya Kinfe.jpg',
                            width: 100, height: 100), // Member 1 photo
                      ),
                      Text('JLIDYA KINFE', style: TextStyle(fontSize: 15)),
                      Text('CFO, Web Developer',
                          style: TextStyle(fontSize: 11)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset('assets/Roba Weyuma.jpg',
                            width: 100, height: 100), // Member 2 photo
                      ),
                      Text('ROBA WEYUMA', style: TextStyle(fontSize: 16)),
                      Text('Project Manager', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  // Add more members here
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset('assets/Lemlem Alemayehu.jpg',
                            width: 100, height: 100), // Member 3 photo
                      ),
                      Text('LEMLEM ALEMAYEHU', style: TextStyle(fontSize: 14)),
                      Text('AgriTech Team leader,',
                          style: TextStyle(fontSize: 11)),
                      Text(' AI Developer', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset('assets/ISIYAK SOLOMON.jpg',
                            width: 100, height: 100), // Member 4 photo
                      ),
                      Text('ISIYAK SOLOMON', style: TextStyle(fontSize: 16)),
                      Text('Developer', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  // Add more members here
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Our Latest Stories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  const url = 'https://deboengineering.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Coffeeberry disease (CBD) has happened in Southern Ethiopia',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  const url = 'https://deboengineering.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ኮቪድ-19ን በአርቴፊሻል ኢንተለጀንስ ቴክኖሎጂ የመመርመር ውጥን',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  const url = 'https://deboengineering.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ኮቪድ-19ን በአርቴፊሻል ኢንተለጀንስ ቴክኖሎጂ የመመርመር ውጥን',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () async {
                      const email =
                          'mailto:info@deboengineering.com'; // replace with your email
                      if (await canLaunch(email)) {
                        await launch(email);
                      }
                    },
                    child: Text(
                      'Email: info@deboengineering.com', // replace with your email
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Colors.blue, // this will make it look like a link
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Phone: +251 911 234 567', // replace with your phone number
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Address: Addis Ababa, Ethiopia', // replace with your address
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
