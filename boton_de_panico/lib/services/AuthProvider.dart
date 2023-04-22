import 'dart:convert';

import 'package:boton_de_panico/screens/loading.dart';
import 'package:boton_de_panico/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:boton_de_panico/NavBar/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boton_de_panico/constant.dart';
import 'package:boton_de_panico/screens/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  static var _nombrefamiliar;
  static var _telfamiliar;
  SharedPreferences? prefs;

  register(String name, email, phoneNumber, tipodocumento, documento, sexo,
      tipopoblacion, password, confirmpassword, countryCode, nombrefamiliar, telfamiliar, context) async {
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
      'countryCode': 'BD',
      'nombrefamiliar':nombrefamiliar,
      'telfamiliar': telfamiliar,
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
    prefs!.setString('nombrefamiliar', nombrefamiliar);
    prefs!.setString('telfamiliar', telfamiliar);

    nm = prefs!.getString('name');
    _email = prefs!.getString('email');
    _phoneNumber = prefs!.getString('phoneNumber');
    _tipodocumento = prefs!.getString('tipodocumento');
    _documento = prefs!.getString('documento');
    _sexo = prefs!.getString('sexo');
    _tipopoblacion = prefs!.getString('tipopoblacion');
    _password = prefs!.getString('password');
    _confirmpassword = prefs!.getString('confirmpassword');
    _nombrefamiliar = prefs!.getString('nombrefamiliar');
    _telfamiliar = prefs!.getString('telfamiliar');

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
      Fluttertoast.showToast(
          msg: 'Usuario registrado',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 229, 226, 226),
          textColor: Colors.black);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

      print('success');
    } else if (response.statusCode == 404) {
      final body = response.body;
      final json = await jsonDecode(body);
      print(body);
      switch (body) {
        case '{"success":false,"message":"Error validation","data":{"password":["The password must be at least 8 characters."]}}':
          Fluttertoast.showToast(
              msg: 'La contraseña debe tener al menos 8 caracteres.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;

        case '{"success":false,"message":"Error validation","data":{"password":["The password must contain at least one uppercase and one lowercase letter."]}}':
          Fluttertoast.showToast(
              msg:
                  'La contraseña debe contener al menos una letra mayúscula y una minúscula.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"password":["The password must contain at least one symbol."]}}':
          Fluttertoast.showToast(
              msg: 'La contraseña debe contener al menos un símbolo.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"password":["The password must contain at least one number."]}}':
          Fluttertoast.showToast(
              msg: 'La contraseña debe contener al menos un numero.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"password":["The password field is required."]}}':
          Fluttertoast.showToast(
              msg: 'El campo de contraseña es obligatorio.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"name":["The name field is required."]}}':
          Fluttertoast.showToast(
              msg: 'El campo de nombre es obligatorio.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"name":["The name must be at least 8 characters."]}}':
          Fluttertoast.showToast(
              msg: 'El nombre es muy corto.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"phoneNumber":["The phone number must be a number."]}}':
          Fluttertoast.showToast(
              msg: 'El número de teléfono debe ser un número.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"phoneNumber":["The phone number must be 10 digits."]}}':
          Fluttertoast.showToast(
              msg: 'El número de teléfono debe tener 10 dígitos.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"phoneNumber":["The phone number field is required."]}}':
          Fluttertoast.showToast(
              msg: 'El campo del número de teléfono es obligatorio.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"phoneNumber":["The phone number has already been taken."]}}':
          Fluttertoast.showToast(
              msg: 'El número de teléfono ya ha sido tomado.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"documento":["The documento must be a number."]}}':
          Fluttertoast.showToast(
              msg: 'El documento debe ser un número.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"documento":["The documento must not be greater than 10."]}}':
          Fluttertoast.showToast(
              msg: 'El documento no debe ser mayor a 10 digitos.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"documento":["The documento field is required."]}}':
          Fluttertoast.showToast(
              msg: 'El campo documento es obligatorio.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"documento":["The documento has already been taken."]}}':
          Fluttertoast.showToast(
              msg: 'El documento ya ha sido tomado',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"email":["The email has already been taken."]}}':
          Fluttertoast.showToast(
              msg: 'El correo electronico ya ha sido tomado',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"email":["The email must be a valid email address."]}}':
          Fluttertoast.showToast(
              msg:
                  'El correo electrónico debe ser una dirección de correo electrónico válida.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"email":["The email field is required."]}}':
          Fluttertoast.showToast(
              msg: 'El campo de correo electronico es obligatorio.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        case '{"success":false,"message":"Error validation","data":{"name":["The name field is required."],"email":["The email field is required."],"phoneNumber":["The phone number field is required."],"documento":["The documento field is required."],"password":["The password field is required."]}}':
          Fluttertoast.showToast(
              msg: 'los campos estan vacios.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
          break;
        default:
          Fluttertoast.showToast(
              msg: 'Revise los datos',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 229, 226, 226),
              textColor: Colors.black);
      }
    } else if (response.statusCode == 500) {
      Fluttertoast.showToast(
          msg: 'Algo salio mal, puede que el usuario ya haya sido registrado',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 229, 226, 226),
          textColor: Colors.black);
    }
  }
}
