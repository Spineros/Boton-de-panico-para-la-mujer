import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:boton_de_panico/services/user_service.dart';
// import 'package:boton_de_panico/provider/BotonProvider.dart';
import 'package:flutter/services.dart';

class Tipos extends StatefulWidget {
  const Tipos({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _TiposState createState() => _TiposState();
}

class _TiposState extends State<Tipos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        toolbarHeight: 80,
        title: const Text(
          "TIPOS DE VIOLENCIA",
          style: TextStyle(
              color: Color.fromARGB(255, 122, 68, 149),
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
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            color: Color.fromARGB(255, 255, 255, 255),
            width: 100,
            height: 100,
            child: Text(
              "La ley 1257 de 2008 tipifica algunas formas de violencia en contra de las mujeres que deben ser atendidas para garantizar una vida libre y segura.",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 178, 112, 162),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              Container(
                width: 170,
                height: 100,
                margin: EdgeInsets.only(
                  right: 0,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                  image: new DecorationImage(
                    image: new AssetImage(
                        'assets/images/APPMUJERES/VIOLENCIA/PSICOLOGICA-08.png'),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 100,
                margin: const EdgeInsets.only(
                  left: 0,
                  right: 10,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                ),
                child: Text(
                  "\nVIOLENCIA PSICOLÓGICA",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 178, 112, 162),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 170,
                height: 100,
                margin: EdgeInsets.only(
                  right: 0,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                  image: new DecorationImage(
                    image: new AssetImage(
                        'assets/images/APPMUJERES/VIOLENCIA/FISICA-09.png'),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 100,
                margin: const EdgeInsets.only(
                  left: 0,
                  right: 10,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                ),
                child: Text(
                  "\n\nVIOLENCIA FÍSICA",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 178, 112, 162),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 170,
                height: 100,
                margin: EdgeInsets.only(
                  right: 0,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                  image: new DecorationImage(
                    image: new AssetImage(
                        'assets/images/APPMUJERES/VIOLENCIA/SEXUAL-10.png'),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 100,
                margin: const EdgeInsets.only(
                  left: 0,
                  right: 10,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                ),
                child: Text(
                  "\n\nVIOLENCIA SEXUAL",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 178, 112, 162),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 170,
                height: 100,
                margin: EdgeInsets.only(
                  right: 0,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                  image: new DecorationImage(
                    image: new AssetImage(
                        'assets/images/APPMUJERES/VIOLENCIA/ECONOMICA-11.png'),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 100,
                margin: const EdgeInsets.only(
                  left: 0,
                  right: 10,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                ),
                child: Text(
                  "\nVIOLENCIA ECONÓMICA Y/O PARTRIMONIAL",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 178, 112, 162),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 170,
                height: 100,
                margin: EdgeInsets.only(
                  right: 0,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                  image: new DecorationImage(
                    image: new AssetImage(
                        'assets/images/APPMUJERES/VIOLENCIA/SIMBOLICA-12.png'),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 100,
                margin: const EdgeInsets.only(
                  left: 0,
                  right: 10,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 229, 204),
                ),
                child: Text(
                  "\nVIOLENCIA SIMBÓLICA",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 178, 112, 162),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
