import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:rental_app/config.dart';
import 'package:rental_app/src/external/adapters/movies_adapter.dart';
import 'package:rental_app/src/external/adapters/user_adapter.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class MoviesDatasource {
  final client = http.Client();

  Future<List<Movie>> getAvailableMovies() async {
    Uri uri = Uri.parse("$baseUrl/available-movies");

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return MoviesAdapter.decodeProto(response.bodyBytes);
      } else {
        throw Exception('Server can\'t process the request');
      }
    } catch (e) {
      throw Exception('Can\'t connect with the server');
    }
  }

  Future<List<Movie>> getMoviesRentalByUser(User user) async {
    Uri uri = Uri.parse("$baseUrl/movies-rental-by-user");
    Uint8List content = UserAdapter.encodeProto(user);

    try {
      final response = await client.post(uri, body: content);
      if (response.statusCode == 200) {
        return MoviesAdapter.decodeProto(response.bodyBytes);
      } else {
        throw Exception('Server can\'t process the request');
      }
    } catch (e) {
      throw Exception('Can\'t connect with the server');
    }
  }
}
