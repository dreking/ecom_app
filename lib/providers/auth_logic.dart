import 'dart:convert';

import 'package:ecommerce/data/get_urls.dart';
import 'package:ecommerce/models/server_response.dart';
import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/services/decode_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthLogic with ChangeNotifier {
  final _domain = getServerDomain();

  Future<ServerResponse> signUp(User user) async {
    final Uri uri = Uri.parse(_domain + '/auth/signup');

    try {
      final response = await http.post(
        uri,
        body: jsonEncode({
          'username': user.username,
          'password': user.password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final serverResponse = ServerResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode == 422) {
        serverResponse.message = serverResponse.message! + '\n';
        serverResponse.errors!.forEach((element) {
          serverResponse.message = serverResponse.message! + '${element.msg}\n';
        });
      }

      if (!serverResponse.status!) return serverResponse;

      await decodeToken(serverResponse);
      notifyListeners();

      return serverResponse;
    } catch (e) {
      print(e);

      return ServerResponse(
        status: false,
        message: 'Something went wrong. Please try again later',
      );
    }
  }

  Future<ServerResponse> signIn(User user) async {
    final Uri uri = Uri.parse(_domain + '/auth/signin');

    try {
      final response = await http.post(
        uri,
        body: jsonEncode({
          'username': user.username,
          'password': user.password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final serverResponse = ServerResponse.fromJson(jsonDecode(response.body));
      if (!serverResponse.status!) return serverResponse;

      await decodeToken(serverResponse);
      notifyListeners();

      return serverResponse;
    } catch (e) {
      print(e);

      return ServerResponse(
        status: false,
        message: 'Something went wrong. Please try again later',
      );
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await clearPrefs(prefs);
  }
}
