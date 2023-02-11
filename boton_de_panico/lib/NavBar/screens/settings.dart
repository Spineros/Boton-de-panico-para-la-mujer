import 'package:boton_de_panico/Screenspush/datos.dart';
import 'package:flutter/material.dart';
import 'package:boton_de_panico/services/user_service.dart';
import 'package:boton_de_panico/constant.dart';
import 'package:boton_de_panico/screens/login.dart';
import 'package:boton_de_panico/models/api_response.dart';
import 'package:boton_de_panico/models/user.dart';
import 'package:flutter/services.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SettingsContent createState() => _SettingsContent();
}

class _SettingsContent extends State<SettingsContent> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 255, 244, 229),
        elevation: 0.0,
        toolbarHeight: 80,
        title: Text(
          "CONFIGURACIÓN",
          style: TextStyle(
              color: Color.fromARGB(255, 103, 63, 196),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 252, 156, 79),
                  Color.fromARGB(255, 252, 156, 79),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              )),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 244, 229),
        ),
        child: ListView(
          padding: EdgeInsets.only(right: 10, left: 10),
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 250, 182, 127)),
                margin: const EdgeInsets.only(right: 10, left: 10),
                width: 200,
                height: 120,
                child: Image.asset(
                    'assets/images/APPMUJERES/TIPOSVIOLENCIA-15.png')),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text("ACTUALIZAR DATOS DE USUARIO"),
              onPressed: (() async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Datos()),
                );
              }),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 80),
                foregroundColor: const Color.fromARGB(255, 252, 219, 249),
                backgroundColor: Color.fromARGB(255, 142, 76, 168),
                shadowColor: const Color.fromARGB(255, 85, 25, 75),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  logout().then((value) => {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false)
                      });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 104, 182, 134),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: Text("CERRAR SESIÓN",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(right: 10, left: 10),
                width: 200,
                height: 120,
                child: Image.network(
                    'https://www.fusagasuga-cundinamarca.gov.co/Style%20Library/images/logo-header.png')),
          ],
        ),
      ),
    );
  }
}