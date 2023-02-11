import 'dart:convert';

import 'package:boton_de_panico/NavBar/fluid_nav_bar.dart';
import 'package:boton_de_panico/NavBar/screens/button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boton_de_panico/constant.dart';

class PostProvider with ChangeNotifier {
  String? _address;
  static var ads;
  static var _location;
  static var _user_id;
  SharedPreferences? prefs;

  registro(String Address, location, user_id, context) async {
    prefs = await SharedPreferences.getInstance();
    Map data2 = {
      'address': Address,
      'location': location,
      'user_id': user_id,
    };
    print(data2);
    _address = Address;
    print(" boton ");
    print(_address);

    String body = json.encode(data2);
    var url = Uri.parse(postsURL);
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    prefs!.setString('address', Address);
    prefs!.setString('location', location);
    prefs!.setString('user_id', user_id.toString());

    ads = prefs!.getString('address');
    _location = prefs!.getString('location');
    _user_id = prefs!.getString('user_id');

    print(ads + _location + _user_id);

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //Or put here your next screen using Navigator.push() method
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NavBar()));

      print('success');
    } else {
      print('error');
    }
  }
}