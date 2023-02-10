import 'dart:convert';

import 'package:boton_de_panico/screens/loading.dart';
import 'package:boton_de_panico/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:boton_de_panico/NavBar/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boton_de_panico/constant.dart';
import 'package:boton_de_panico/screens/login.dart';

class AuthProvider with ChangeNotifier {
  String? _name;
  static var nm;
  static var _email;
  static var _phoneNumber;
  static var _tipodocumento;
  static var _documento;
  static var _sexo;
  static var _tipopoblacion;
  static var _password;
  static var _confirmpassword;
  SharedPreferences? prefs;

  register(String name, email, phoneNumber, tipodocumento, documento, sexo,
      tipopoblacion, password, confirmpassword, countryCode, context) async {
    prefs = await SharedPreferences.getInstance();
    Map data1 = {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'tipodocumento': tipodocumento,
      'documento': documento,
      'sexo': sexo,
      'tipopoblacion': tipopoblacion,
      'password': password,
      'confirmpassword': confirmpassword,
      'countryCode': 'BD'
    };
    print(data1);
    _name = name;
    print(" User name(1) ");
    print(_name);

    String body = json.encode(data1);
    var url = Uri.parse(registerURL);
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    prefs!.setString('name', name);
    prefs!.setString('email', email);
    prefs!.setString('phoneNumber', phoneNumber);
    prefs!.setString('tipodocumento', tipodocumento);
    prefs!.setString('documento', documento);
    prefs!.setString('sexo', sexo);
    prefs!.setString('tipopoblacion', tipopoblacion);
    prefs!.setString('password', password);
    prefs!.setString('confirmpassword', confirmpassword);

    nm = prefs!.getString('name');
    _email = prefs!.getString('email');
    _phoneNumber = prefs!.getString('phoneNumber');
    _tipodocumento = prefs!.getString('tipodocumento');
    _documento = prefs!.getString('documento');
    _sexo = prefs!.getString('sexo');
    _tipopoblacion = prefs!.getString('tipopoblacion');
    _password = prefs!.getString('password');
    _confirmpassword = prefs!.getString('confirmpassword');

    print(nm +
        _email +
        _phoneNumber +
        _tipodocumento +
        _documento +
        _sexo +
        _tipopoblacion +
        _password +
        confirmpassword);

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //Or put here your next screen using Navigator.push() method
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Loading()));

      print('success');
    } else {
      print('error');
    }
  }

  registerOtp(String otpNumberForEmail, otpNumberForPhone, context) async {
    // ignore: prefer_interpolation_to_compose_strings
    print(" User name (otp) " + nm);

    Map data = {
      'name': nm,
      'email': _email,
      'phoneNumber': _phoneNumber,
      'password': _password,
      'confirmpassword': _confirmpassword,
      'countryCode': 'BD',
    };
    print(data);
    print(" User name ${data["_name"]}");
    // print(" User name2 ${data["name"]}");

    String body = json.encode(data);

    var url = Uri.parse(registerURL);
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //Or put here your next screen using Navigator.push() method
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeContent()));
      print('success');
    } else {
      print('error');
    }
  }
}
