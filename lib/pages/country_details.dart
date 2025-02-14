import 'package:flutter/material.dart';
import '../models/country_model.dart';

class CountryDetails extends StatelessWidget {
  final Country country;

  const CountryDetails({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Flag
            Center(
              child: Image.network(
                country.flagUrl,
                width: 180,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.flag, size: 100),
              ),
            ),

            const SizedBox(height: 16),

            // Country Info
            Text("Name: ${country.name}", style: _infoTextStyle()),
            Text("Capital: ${country.capital}", style: _infoTextStyle()),
            Text("Continent: ${country.continent}", style: _infoTextStyle()),
            Text("Country Code: ${country.countryCode}",
                style: _infoTextStyle()),
            Text("Population: ${country.population.toString()}",
                style: _infoTextStyle()),
            Text("President: ${country.president}", style: _infoTextStyle()),

            const SizedBox(height: 16),

            // States/Provinces (if available)
            if (country.states.isNotEmpty) ...[
              const Text("States/Provinces:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: country.states
                    .map((state) => Text("• $state", style: _infoTextStyle()))
                    .toList(),
              ),
            ] else ...[
              const Text("States/Provinces: N/A",
                  style: TextStyle(fontSize: 16)),
            ],
          ],
        ),
      ),
    );
  }

  TextStyle _infoTextStyle() {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  }
}
