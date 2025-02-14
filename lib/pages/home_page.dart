import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/country_model.dart';
import '../providers/theme_provider.dart';
import '../services/country_services.dart';
import 'country_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Country> countries = [];
  List<Country> filteredCountries = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  /// Fetches and sorts countries alphabetically
  Future<void> fetchCountries() async {
    try {
      List<Country> fetchedCountries = await CountryService.fetchCountries();
      setState(() {
        countries = fetchedCountries;
        filteredCountries = fetchedCountries;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error fetching countries: $e");
    }
  }

  /// Filters the country list based on search input
  void filterCountries(String query) {
    setState(() {
      filteredCountries = countries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Logo & Theme Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 98,
                    height: 24,
                    child: Image.asset('explore.png'),
                  ),
                  IconButton(
                    icon: Icon(
                      themeProvider.isDarkMode
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Search Bar
              Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.search, size: 24),
                      const SizedBox(width: 40),
                      Expanded(
                        child: TextField(
                          onChanged: filterCountries,
                          decoration: InputDecoration(
                            hintText: "Search Country",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade500,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Display Countries List
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : filteredCountries.isEmpty
                        ? const Center(child: Text("No countries found"))
                        : ListView.builder(
                            itemCount: filteredCountries.length,
                            itemBuilder: (context, index) {
                              final country = filteredCountries[index];

                              return Card(
                                elevation: 0,
                                color: Theme.of(context).cardColor,
                                child: ListTile(
                                  leading: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: country.flagUrl.isNotEmpty
                                        ? Image.network(
                                            country.flagUrl,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const SizedBox(),
                                          )
                                        : const SizedBox(),
                                  ),
                                  title: Text(
                                    country.name,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  subtitle: Text(
                                    country.capital,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetails(country: country),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
