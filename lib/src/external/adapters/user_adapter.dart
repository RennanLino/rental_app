import 'package:flutter/services.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';

class UserAdapter {
  static User decodeProto(Uint8List encodedUser) {
    try {
      final user = User.fromBuffer(encodedUser);
      return user;
    } catch (e) {
      throw Exception("Error decoding proto");
    }
  }

  static Uint8List encodeProto(User user) {
    final encodedUser = user.writeToBuffer();
    return encodedUser;
  }
}
