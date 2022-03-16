import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewsData with ChangeNotifier {
  String url = 'https://dl.dropbox.com/s/hmsbaqmi10x88z9/story.json?dl=0';
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errormessage = '';
  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errormessage => _errormessage;
  void initialvalues() {
    _map = {};
    _errormessage = '';
    _error = false;
    notifyListeners();
  }

  Future<void> get fetchData async {
    final response = await get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errormessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errormessage = 'Error, could be your internet connection';
      _map = {};
    }
    notifyListeners();
  }
}
