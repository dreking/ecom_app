import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ecommerce/models/server_response.dart';

Future<void> decodeToken(ServerResponse serverResponse) async {
  final prefs = await SharedPreferences.getInstance();

  final Map<String, dynamic> authData =
      JwtDecoder.decode(serverResponse.token!);

  await clearPrefs(prefs);

  await prefs.setString('id', authData['id']);
  await prefs.setString(
    'token',
    '${serverResponse.type} ${serverResponse.token}',
  );
}

Future<void> clearPrefs(SharedPreferences prefs) async {
  await prefs.remove('id');
  await prefs.remove('token');
}
