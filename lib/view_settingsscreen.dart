import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:your_app/weather_repository.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
     
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Location:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  hintText: 'City',
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _countryController,
                decoration: const InputDecoration(
                  hintText: 'Country',
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveLocation();
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 10),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveLocation() async {
    final String city = _cityController.text.trim();
    final String country = _countryController.text.trim();

    if (city.isEmpty || country.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter city and country';
      });
      return;
    }

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('savedCity', city);
      await prefs.setString('savedCountry', country);

      Navigator.pop( BuildContext as BuildContext,true); // Navigate back to the previous screen
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to save location: $e';
      });
    }
  }
}
