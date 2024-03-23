import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Car Wash Lighting Control App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to our Car Wash Lighting Control App! This app uses Tuya Hardware to give you full control over the lighting in any sub tunnel of your car wash. With our easy-to-use interface, you can adjust the brightness, color, and temperature of the lights to create the perfect environment for your customers.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Our app is designed to be user-friendly and intuitive. You can easily switch between different sub tunnels, save your favorite lighting settings, and even schedule the lights to turn on and off at specific times. Plus, with our remote access feature, you can control the lights from anywhere, at any time.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for choosing our Car Wash Lighting Control App. We hope you enjoy using it as much as we enjoyed creating it!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}