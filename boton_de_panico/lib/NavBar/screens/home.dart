import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:boton_de_panico/Screenspush/derechos.dart';
import 'package:boton_de_panico/Screenspush/tipos.dart';
import 'package:boton_de_panico/Screenspush/eventos.dart';
import 'package:boton_de_panico/services/user_service.dart';
// import 'package:boton_de_panico/services/BotonProvider.dart';
import 'package:flutter/services.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 255, 244, 229),
        elevation: 0.0,
        toolbarHeight: 80,
        title: const Text(
          "TÚ MUJER ERES LA FUERZA",
          style: TextStyle(
              color: Color.fromARGB(255, 103, 63, 196),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              color: Color.fromARGB(255, 255, 229, 204),
              width: 100,
              height: 50,
              child: Text(
                "Por una vida libre de violencias para niñas, mujers y adolecentes",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 178, 112, 162),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Derechos priorizados de las mujeres",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 176, 30, 233),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              color: Color.fromARGB(255, 255, 229, 204),
              width: 200,
              height: 150,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Derechos()),
                  );
                },
                child: Image.asset('assets/images/APPMUJERES/MUJERES-13.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Tipos de violencia",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 176, 30, 233),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              color: Color.fromARGB(255, 255, 229, 204),
              width: 200,
              height: 150,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tipos()),
                  );
                },
                child: Image.asset(
                    'assets/images/APPMUJERES/TIPOSVIOLENCIA-15.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Eventos",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 176, 30, 233),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              color: Color.fromARGB(255, 255, 229, 204),
              width: 200,
              height: 150,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Eventos()),
                  );
                },
                child: Image.asset('assets/images/APPMUJERES/EVENTOS-14.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
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
