import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:weather_app/view/home_screen.dart';
// import 'package:weather_app/view/settings_screen.dart';
// import 'package:weather_app/viewmodel/weather_viewmodel.dart';
import 'package:whetherapp/view_homescreen.dart';
import 'package:whetherapp/view_models.dart';
import 'package:whetherapp/view_settingsscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        // title: 'Weather App',
        theme: ThemeData(
          fontFamily: 'YourCustomFont',
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/settings': (context) => SettingsScreen(),
        },
      ),
    );
  }
}
