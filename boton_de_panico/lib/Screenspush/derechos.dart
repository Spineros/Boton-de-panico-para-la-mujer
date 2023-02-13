import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:boton_de_panico/services/user_service.dart';
// import 'package:boton_de_panico/provider/BotonProvider.dart';
import 'package:flutter/services.dart';

class Derechos extends StatefulWidget {
  const Derechos({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _DerechosState createState() => _DerechosState();
}

class _DerechosState extends State<Derechos> {
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
          "DERECHOS PRIORIZADOS",
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
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 244, 229),
        ),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              color: Color.fromARGB(255, 255, 244, 229),
              width: 100,
              height: 100,
              child: Text(
                "El acuerdo 13 del 2010 contiene la politica publica de mujer y género del municipío. en ella se priorizan los siquientes derechos:",
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
                    color: Color.fromARGB(255, 250, 182, 127),
                    image: new DecorationImage(
                      image: new AssetImage(
                          'assets/images/APPMUJERES/DERECHOS/TRABAJO-01.png'),
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
                    color: Color.fromARGB(255, 250, 182, 127),
                  ),
                  child: Text(
                    "                          Derecho a un trabajo digno y autonomía económica",
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
                  width: 200,
                  height: 100,
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 0,
                    top: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 182, 127),
                  ),
                  child: Text(
                    "Derecho de la salud y a la salud sexual y reproductiva libre e informada",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 178, 112, 162),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: 170,
                  height: 100,
                  margin: EdgeInsets.only(
                    right: 10,
                    left: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 182, 127),
                    image: new DecorationImage(
                      image: new AssetImage(
                          'assets/images/APPMUJERES/DERECHOS/SALUD-02.png'),
                    ),
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
                    color: Color.fromARGB(255, 250, 182, 127),
                    image: new DecorationImage(
                      image: new AssetImage(
                          'assets/images/APPMUJERES/DERECHOS/EDUCACION-03.png'),
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
                    color: Color.fromARGB(255, 250, 182, 127),
                  ),
                  child: Text(
                    "\nDerecho a una educación equitativa",
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
                  width: 200,
                  height: 100,
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 0,
                    top: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 182, 127),
                  ),
                  child: Text(
                    "\nDerecho a una cultura transformadora y libre de sexismo",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 178, 112, 162),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: 170,
                  height: 100,
                  margin: EdgeInsets.only(
                    right: 10,
                    left: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 182, 127),
                    image: new DecorationImage(
                      image: new AssetImage(
                          'assets/images/APPMUJERES/DERECHOS/VIOLENCIA-04.png'),
                    ),
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
                    color: Color.fromARGB(255, 250, 182, 127),
                    image: new DecorationImage(
                      image: new AssetImage(
                          'assets/images/APPMUJERES/DERECHOS/CULTURA-07.png'),
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
                    color: Color.fromARGB(255, 250, 182, 127),
                  ),
                  child: Text(
                    "Derecho a una vida libre de violencias para todas las mujeres",
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
                  width: 200,
                  height: 100,
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 0,
                    top: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 182, 127),
                  ),
                  child: Text(
                    "Derecho a viviendas dignas y un hábitat saludable para las mujeres",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 178, 112, 162),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: 170,
                  height: 100,
                  margin: EdgeInsets.only(
                    right: 10,
                    left: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 182, 127),
                    image: new DecorationImage(
                      image: new AssetImage(
                          'assets/images/APPMUJERES/DERECHOS/HOGAR-06.png'),
                    ),
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
                    color: Color.fromARGB(255, 250, 182, 127),
                    image: new DecorationImage(
                      image: new AssetImage(
                          'assets/images/APPMUJERES/DERECHOS/POLITICA-05.png'),
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
                    color: Color.fromARGB(255, 250, 182, 127),
                  ),
                  child: Text(
                    "Derecho a la participación politica y representación de las mujeres",
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
          ],
        ),
      ),
    );
  }
}
