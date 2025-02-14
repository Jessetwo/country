class Country {
  final String name;
  final List<String> states; // Not available in the API, keeping it empty
  final String flagUrl;
  final int population;
  final String capital;
  final String president; // Not in API, setting a default
  final String continent;
  final String countryCode;

  Country({
    required this.name,
    required this.states,
    required this.flagUrl,
    required this.population,
    required this.capital,
    required this.president,
    required this.continent,
    required this.countryCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] ?? 'Unknown',
      states: [], // API does not provide states, setting empty list
      flagUrl: json['flags']?['png'] ?? '',
      population: json['population'] ?? 0,
      capital: (json['capital'] != null &&
              json['capital'] is List &&
              json['capital'].isNotEmpty)
          ? json['capital'][0]
          : 'No Capital',
      president: 'N/A', // Not available in the API
      continent: (json['continents'] != null &&
              json['continents'] is List &&
              json['continents'].isNotEmpty)
          ? json['continents'][0]
          : 'Unknown',
      countryCode: json['cca2'] ?? 'N/A', // Use 'cca2' for country code
    );
  }
}
