import 'package:flutter/material.dart';
import 'package:rental_app/src/external/datasources/movies_datasource.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class MoviesStore extends ChangeNotifier {
  final moviesDatasource = MoviesDatasource();

  var _available_movies = Movies();
  Movies get available_movies => _available_movies;

  var _rented_movies = Movies();
  Movies get rented_movies => _rented_movies;

  String errorMessage = "";

  Future<void> availableMovies() async {
    try {
      Movies movies = await moviesDatasource.availableMovies();
      _available_movies = movies;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> moviesRentalByUser(User user) async {
    try {
      Movies movies = await moviesDatasource.moviesRentalByUser(user);
      _rented_movies = movies;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void clearErrorMessage() {
    errorMessage = "";
  }
}
