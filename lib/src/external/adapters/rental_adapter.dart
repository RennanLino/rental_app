import 'package:flutter/services.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class RentalAdapter {
  static Rental decodeProto(Uint8List encodedRental) {
    try {
      final rentals = Rental.fromBuffer(encodedRental);
      return rentals;
    } catch (e) {
      throw Exception("Error decoding proto");
    }
  }

  static Uint8List encodeProto(Rental rental) {
    final encodedRental = rental.writeToBuffer();
    return encodedRental;
  }
}
