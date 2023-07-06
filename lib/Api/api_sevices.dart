import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/usermodel.dart';
import 'package:trip/Api/api.dart';

class ApiService {
  late SharedPreferences prefs;
  late int user_id;

  Future<List<UserModel>> fetchuser() async {
    var response = await Api().getData('/register/view-users');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<UserModel> products = List<UserModel>.from(
          items['data'].map((e) => UserModel.fromJson(e)).toList());
      return products;
    } else {
      List<UserModel> products = [];
      return products;
    }
  }

  Future<List<UserModel>> fetchtcounter() async {
    var response = await Api().getData('/register/view-counter');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<UserModel> products = List<UserModel>.from(
          items['data'].map((e) => UserModel.fromJson(e)).toList());
      return products;
    } else {
      List<UserModel> products = [];
      return products;
    }
  }

  Future<List<UserModel>> fetchgodown() async {
    var response = await Api().getData('/register/view-godown');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<UserModel> products = List<UserModel>.from(
          items['data'].map((e) => UserModel.fromJson(e)).toList());
      return products;
    } else {
      List<UserModel> products = [];
      return products;
    }
  }

  Future<List<UserModel>> fetchdelivery() async {
    var response = await Api().getData('/register/view-delivery');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<UserModel> products = List<UserModel>.from(
          items['data'].map((e) => UserModel.fromJson(e)).toList());
      return products;
    } else {
      List<UserModel> products = [];
      return products;
    }
  }
}