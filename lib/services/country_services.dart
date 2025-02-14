import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

class CountryService {
  static const String apiUrl = 'https://restcountries.com/v3.1/all';

  static Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse(apiUrl));

    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body); // Decode JSON response

      if (data is List) {
        return data
            .map((json) => Country.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Unexpected JSON structure: Expected a list');
      }
    } else {
      throw Exception(
          'Failed to load countries. Status code: ${response.statusCode}');
    }
  }
}
