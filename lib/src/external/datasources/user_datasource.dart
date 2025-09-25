import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:rental_app/config.dart';
import 'package:rental_app/src/external/adapters/user_adapter.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class UserDatasource {
  final client = http.Client();

  Future<User> login(User user) async {
    Uri uri = Uri.parse("$baseUrl/login");
    Uint8List content = UserAdapter.encodeProto(user);

    try {
      final response = await client.post(uri, body: content);
      if (response.statusCode == 200) {
        return UserAdapter.decodeProto(response.bodyBytes);
      } else {
        throw Exception('Server can\'t process the request');
      }
    } catch (e) {
      throw Exception('Can\'t connect with the server');
    }
  }
}
