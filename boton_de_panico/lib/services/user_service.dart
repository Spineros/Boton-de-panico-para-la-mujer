import 'dart:convert';
import 'dart:io';

import 'package:boton_de_panico/constant.dart';
import 'package:boton_de_panico/models/api_response.dart';
import 'package:boton_de_panico/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';

// login
Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}

// Register
Future<ApiResponse> register(String name, email, phoneNumber, tipodocumento,
    documento, sexo, tipopoblacion, nombrefamiliar, telfamiliar, password, confirmpassword) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'tipodocumento': tipodocumento,
      'documento': documento,
      'sexo': sexo,
      'tipopoblacion': tipopoblacion,
      'nombrefamiliar': nombrefamiliar,
      'telfamiliar': telfamiliar,
      'password': password,
      'password_confirmation': confirmpassword
    });

    print(name +
        email +
        phoneNumber +
        tipodocumento +
        documento +
        sexo +
        tipopoblacion +
        nombrefamiliar +
        telfamiliar +
        password +
        confirmpassword);

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// User
Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(userURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// Update user
Future<ApiResponse> updateUser(
    String name,
    String phoneNumber,
    String tipodocumento,
    String documento,
    String sexo,
    String tipopoblacion,
    String nombrefamiliar,
    String telfamiliar) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.put(Uri.parse(userURL),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: phoneNumber == null
            ? {
                'name': name,
              }
            : {
                'name': name,
                'phoneNumber': phoneNumber,
                'tipodocumento': tipodocumento,
                'documento': documento,
                'sexo': sexo,
                'tipopoblacion': tipopoblacion,
                'nombrefamiliar': nombrefamiliar,
                'telfamiliar': telfamiliar,
              });
    // user can update his/her name or name and image

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        print(response.body);
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

// get user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

// logout
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

// Get base64 encoded image
String? getStringImage(File? file) {
  if (file == null) return null;
  return base64Encode(file.readAsBytesSync());
}
