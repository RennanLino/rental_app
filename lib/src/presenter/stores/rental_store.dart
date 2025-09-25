import 'package:flutter/material.dart';
import 'package:rental_app/src/external/datasources/rental_datasource.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class RentalStore extends ChangeNotifier {
  final rentalDatasource = RentalDatasource();

  var _rental = Rental();
  Rental get rental => _rental;

  String errorMessage = "";

  Future<bool> rentalMovie(int userId, int movieId) async {
    Rental rental = Rental(userId: userId, movieId: movieId);
    bool success = false;
    try {
      success = await rentalDatasource.rentalMovie(rental);
      _rental = rental;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
    return success;
  }

  Future<bool> watchMovie(int userId, int movieId) async {
    Rental rental = Rental(userId: userId, movieId: movieId);
    bool success = false;
    try {
      success = await rentalDatasource.watchMovie(rental);
      _rental = rental;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
    return success;
  }

  void clearErrorMessage() {
    errorMessage = "";
  }
}
