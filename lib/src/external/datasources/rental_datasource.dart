import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:rental_app/config.dart';
import 'package:rental_app/src/external/adapters/rental_adapter.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class RentalDatasource {
  final client = http.Client();

  Future<bool> rentalMovie(Rental rental) async {
    Uri uri = Uri.parse("$baseUrl/rental-movie");
    Uint8List content = RentalAdapter.encodeProto(rental);
    try {
      final response = await client.post(uri, body: content);
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Can\'t connect with the server');
    }
  }

  Future<bool> watchMovie(Rental rental) async {
    Uri uri = Uri.parse("$baseUrl/watch-movie");
    Uint8List content = RentalAdapter.encodeProto(rental);

    try {
      final response = await client.post(uri, body: content);
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Can\'t connect with the server');
    }
  }
}
