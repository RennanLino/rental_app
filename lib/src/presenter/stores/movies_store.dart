import 'package:flutter/material.dart';
import 'package:rental_app/src/external/datasources/movies_datasource.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class MoviesStore extends ChangeNotifier {
  final _moviesDatasource = MoviesDatasource();

  List<Movie> _availableMovies = [];
  List<Movie> get availableMovies => _availableMovies;

  List<Movie> _rentedMovies = [];
  List<Movie> get rentedMovies => _rentedMovies;

  String errorMessage = "";

  Future<void> getAvailableMovies() async {
    try {
      List<Movie> movies = await _moviesDatasource.getAvailableMovies();
      _availableMovies = movies;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> getMoviesRentalByUser(User user) async {
    try {
      List<Movie> movies = await _moviesDatasource.getMoviesRentalByUser(user);
      _rentedMovies = movies;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void clearErrorMessage() {
    errorMessage = "";
  }
}
