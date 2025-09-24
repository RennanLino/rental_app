import 'package:flutter/services.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class MoviesAdapter {
  static Movies decodeProto(Uint8List encodedMovie) {
    try {
      final movies = Movies.fromBuffer(encodedMovie);
      return movies;
    } catch (e) {
      throw Exception("Error decoding proto");
    }
  }

  static Uint8List encodeProto(Movie movie) {
    final encodedMovie = movie.writeToBuffer();
    return encodedMovie;
  }
}
