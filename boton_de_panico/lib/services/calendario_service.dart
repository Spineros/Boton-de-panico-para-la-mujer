import 'dart:convert';
import 'package:boton_de_panico/models/calendario.dart';
import 'package:http/http.dart' as http;
import 'package:boton_de_panico/models/api_response.dart';

import '../constant.dart';
import 'user_service.dart';

// Get post comments
class ConnectionCalendario {
  Future<List<Calendario>> getCalendario() async {
    List<Calendario> listArguments = [];

    Uri uri = Uri.parse(calendarioURL);
    final response = await http.get(uri).timeout(const Duration(seconds: 100));

    if (response.statusCode == 200) {
      final body = utf8.decode(response.bodyBytes);
      final json = jsonDecode(body);

      print(json);
      for (var item in json['informacion']) {
        listArguments.add(Calendario(
            item['calendario']['titulo'],
            item['calendario']['descripcion'],
            item['calendario']['direccion'],
            item['calendario']['ruta'],
            item['calendario']['multimedia']));
      }

      print(json);
    }

    return listArguments;
  }
}
