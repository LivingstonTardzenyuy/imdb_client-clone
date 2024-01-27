import 'dart:convert';
import 'package:http/http.dart' as http;  // Add this line
import 'package:flutter/material.dart';

Future<void> loginUser(String username, String password) async {
  final String apiUrl = 'https://imdemo.onrender.com/account/login/';

  final Map<String, String> headers = {'Content-Type': 'application/json'};
  final Map<String, dynamic> body = {
    'username': username,
    'password': password,
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );
    
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      // ScaffoldMessenger.of(context).showSnackBar(context, 'Login successfully',)
      print('Login successful: $responseData');
    } else {
      print('Login failed: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

  } catch(error){
    print("Error during login: $error");
  }
}


Future<void> fetchData() async() {
  final String apiUrl = 'https://imdemo.onrender.com/streamplatform/';

  try{
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print('Data retieved: $responseData');
    } else {
      print('Data retrieval failed: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch(error){
    print('Error during data retrieval: $error');
  }
}