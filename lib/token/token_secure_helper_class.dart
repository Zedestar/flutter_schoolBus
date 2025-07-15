import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenSecureHelperClass {
  static final _secureStorage = FlutterSecureStorage();

  static Future<String?> getToken() async {
    final theToken = await _secureStorage.read(key: "the_token");
    return theToken;
  }

  static Future<void> setToken(String token) async {
    await _secureStorage.write(key: "the_token", value: token);
  }

  static Future<void> deleteToken() async {
    await _secureStorage.delete(key: "the_token");
  }
}
