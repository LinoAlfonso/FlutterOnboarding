
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:onbording_provider_app/src/Models/User.dart';
import 'package:http/http.dart' as http;


class LoginProvider with ChangeNotifier{

  bool _isLoading = false;

  User userApp;

  bool get isLoading => this._isLoading;
  set isLoading( bool valor ) {
    this._isLoading = valor;
    notifyListeners();
  }


  Future<User> loginUser(String email, String password,String status) async {
    Map params = {
      'email': email,
      'password': convertSha1(password),
      'pushToken':"ñkhdlkfghioertnrkt",
      'version': "0.0.0",
      'status': status,
      "platformId": Platform.isIOS == true ? "2" : "1"
    };
    final response = await http
        .post('http://tugoapiriders.inkubo.co:50008/api/v1/onboarding/login',
        headers: {'X-TGR-Access-Token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlhdCI6MTYxMTkzOTI3M30sImlhdCI6MTYxMTkzOTI3MywiZXhwIjoxNjQzNDk2ODczfQ.hwX6SHOGxgwqe4gU6pf5GeQFQIG-CljHMCLsOcyM5xY'}, body: params)
        .timeout(Duration(seconds: 10))
        .catchError((value) {
      throw Exception("error de servidor");
    });
    Map<String, dynamic> decodeJson = json.decode(response.body);
    if (response.statusCode == 200) {
      this.isLoading = false;
      return User.fromJson(decodeJson['body']);
    } else {
      this.isLoading = false;
      throw Exception(decodeJson['message']);
    }
  }

  String convertSha1(String password){
    var valueBytes = utf8.encode(password);
    return sha1.convert(valueBytes).toString();
  }

}