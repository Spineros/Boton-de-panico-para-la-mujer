// import 'dart:convert';

// import 'package:boton_de_panico/models/api_response.dart';
// import 'package:boton_de_panico/models/post.dart';
// import 'package:boton_de_panico/services/user_service.dart';
// import 'package:http/http.dart' as http;

// import '../constant.dart';

// // get all posts
// Future<ApiResponse> getPosts() async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.get(Uri.parse(postsURL),
//     headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     });

//     switch(response.statusCode){
//       case 200:
//         apiResponse.data = jsonDecode(response.body)['posts'].map((p) => Post.fromJson(p)).toList();
//         // we get list of posts, so we need to map each item to post model
//         apiResponse.data as List<dynamic>;
//         break;
//       case 401:
//         apiResponse.error = unauthorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   }
//   catch (e){
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }


// // Create post
// Future<ApiResponse> createPost(String body, String? image) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.post(Uri.parse(postsURL),
//     headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     }, body: image !=null ? {
//       'body': body,
//       'image': image
//     } : {
//       'body': body
//     });

//     // here if the image is null we just send the body, if not null we send the image too

//     switch(response.statusCode){
//       case 200:
//         apiResponse.data = jsonDecode(response.body);
//         break;
//       case 422:
//         final errors = jsonDecode(response.body)['errors'];
//         apiResponse.error = errors[errors.keys.elementAt(0)][0];
//         break;
//       case 401:
//         apiResponse.error = unauthorized;
//         break;
//       default:
//         print(response.body);
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   }
//   catch (e){
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }



// // Edit post
// Future<ApiResponse> editPost(int postId, String body) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.put(Uri.parse('$postsURL/$postId'),
//     headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     }, body: {
//       'body': body
//     });

//     switch(response.statusCode){
//       case 200:
//         apiResponse.data = jsonDecode(response.body)['message'];
//         break;
//       case 403:
//         apiResponse.error = jsonDecode(response.body)['message'];
//         break;
//       case 401:
//         apiResponse.error = unauthorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   }
//   catch (e){
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }


// // Delete post
// Future<ApiResponse> deletePost(int postId) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.delete(Uri.parse('$postsURL/$postId'),
//     headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     });

//     switch(response.statusCode){
//       case 200:
//         apiResponse.data = jsonDecode(response.body)['message'];
//         break;
//       case 403:
//         apiResponse.error = jsonDecode(response.body)['message'];
//         break;
//       case 401:
//         apiResponse.error = unauthorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   }
//   catch (e){
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }


// // Like or unlike post
// Future<ApiResponse> likeUnlikePost(int postId) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.post(Uri.parse('$postsURL/$postId/likes'),
//     headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     });

//     switch(response.statusCode){
//       case 200:
//         apiResponse.data = jsonDecode(response.body)['message'];
//         break;
//       case 401:
//         apiResponse.error = unauthorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   }
//   catch (e){
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }

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

  registro(String address, location, user_id, context) async {
    prefs = await SharedPreferences.getInstance();
    Map data2 = {
      'address': address,
      'location': location,
      'user_id': user_id,
    };
    print(data2);
    _address = address;
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
    prefs!.setString('address', address);
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