import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whetherapp/view_models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 55, 232, 226),
   
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<WeatherViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.loading) {
                  return const CircularProgressIndicator();
                } else if (viewModel.weather != null) {
                  return Column(
                    children: [
                      const Text(
                        'Current Weather',
                        style: TextStyle(fontSize: 24,color: Color.fromARGB(255, 248, 249, 248)),
                      ),
                      Text(
                        'Location: ${viewModel.weather!.location}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Condition: ${viewModel.weather!.condition}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Temperature: ${viewModel.weather!.temperature.toString()} °C',
                        style: const TextStyle(fontSize: 18,color: Colors.blue,),
                      ),
                    ],
                  );
                } else {
                  return const Text('No weather data available.');
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<WeatherViewModel>(context, listen: false)
                    .fetchWeather(0.0, 0.0); // Example coordinates
              },
              child: const Text('Refresh'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Row(
                  children: [
                    TextButton(
                              onPressed: () {
                    // Navigate to SettingsScreen when the button is pressed
                    Navigator.pushNamed(context, '/settings');
                              },
                              child: const Text('Find other Location',style: TextStyle(color: Colors.deepOrange),),
                            ),Icon(Icons.location_on,color: Colors.brown,)
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
