import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'c7558ccb1e92b084efd7b8647dc31771';
Future<List<Map<String, dynamic>>> fetchGenres() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return (data['genres'] as List).map((genre) {
      return {
        'id': genre['id'],
        'name': genre['name'],
      };
    }).toList();
  } else {
    throw Exception('Failed to load genres');
  }
}

Future<List<dynamic>> fetchMoviesByGenre(int genreId) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&with_genres=$genreId&sort_by=popularity.desc'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['results'];
  } else {
    throw Exception('Failed to load movies');
  }
}
