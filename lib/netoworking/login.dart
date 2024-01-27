import 'package:flutter/material.dart';

Future<void> loginUser(String username, String password) async {
  final String apiUrl = 'https://imdemo.onrender.com/account/login/';

  final Map<String, String> headers = {'Content-Type': 'application/json'};
  final Map<String, dynamic> body = {
    'username': username,
    'passsword': password,
  }
}