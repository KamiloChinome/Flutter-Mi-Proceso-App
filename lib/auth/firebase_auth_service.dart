import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;



class AuthServiceProvider extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBCQn0kst0KOaT8hJgM2k-zCAUV3jmsjZY';
  final storage = const FlutterSecureStorage();

  Future<String?> signUp (String email, String password) async {
    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password,
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key' : _firebaseToken
    });
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp.containsKey('idToken')) {
      storage.write(key: 'idToken', value: decodedResp['idToken']);
      return null;
    }else{
      return decodedResp['error']['message'];
    }
  }


  Future<String?> logIn (String email, String password) async {
    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key' : _firebaseToken
    });
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp.containsKey('idToken')) {
      storage.write(key: 'idToken', value: decodedResp['idToken']);
      return null;
    }else{
      return decodedResp['error']['message'];
    }
  }

  Future logOut()async {
    await storage.delete(key: 'idToken');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'idToken') ?? '';
  }
}