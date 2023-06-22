// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:provider/provider.dart';
// class Authentication with ChangeNotifier
// {
//   Future<void> signUp(String email, String password,) async
//   {
//     // const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyBqaA7u3HPVvW4drvjdNSrKZL0lWAmj7mY';
//     Uri url =Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyBqaA7u3HPVvW4drvjdNSrKZL0lWAmj7mY');
//     final response = await http.post( url, body: json.encode(
//       {
//         'email' : email,
//         'password' : password,
//         'returnSecureToken' : true,
//       }
//     ));
//     final responseData = json.decode(response.body);
//     print(responseData);
//   }
// }