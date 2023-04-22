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
                "Acuerdo 01 de 2023 POLÍTICA PÚBLICA DE MUJER Y EQUIDAD DE GÉNERO. \nEn ella se priorizan los siquientes derechos:",
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
                  child: InkWell(
                    onTap: (() => _trabajo(context)),
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
                  child: InkWell(
                    onTap: (() => _trabajo(context)),
                    child: Text(
                    "\nTrabajo digno y autonomía de las mujeres",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 178, 112, 162),
                      ),
                      textAlign: TextAlign.left,
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
                        'assets/images/APPMUJERES/DERECHOS/SALUD-02.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: (() => _salud(context)),
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
                  child: InkWell(
                    onTap: (() => _salud(context)),
                    child: Text(
                    "\nSalud integral libre e informada",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 178, 112, 162),
                      ),
                      textAlign: TextAlign.left,
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
                  child: InkWell(
                    onTap: (() => _educacion(context)),
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
                  child: InkWell(
                    onTap: (() => _educacion(context)),
                      child: Text(
                    "\nEducación equitativa e incluyente",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 178, 112, 162),
                      ),
                      textAlign: TextAlign.left,
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
                  child: InkWell(
                    onTap: (() => _libre(context)),
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
                  child: InkWell(
                    onTap: (() => _libre(context)),
                    child: Text(
                    "\nTrato equitativo y escenarios libres de discriminación",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 178, 112, 162),
                      ),
                      textAlign: TextAlign.left,
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
                        'assets/images/APPMUJERES/DERECHOS/VIOLENCIA-04.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: (() => _violencia(context)),
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
                  child: InkWell(
                    onTap: (() => _violencia(context)),
                    child: Text(
                    "\nVida libre de violencias",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 178, 112, 162),
                      ),
                      textAlign: TextAlign.left,
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
                        'assets/images/APPMUJERES/DERECHOS/HOGAR-06.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: (() => _vivienda(context)),
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
                  child: InkWell(
                    onTap: (() => _vivienda(context)),
                    child: Text(
                    "\nVivienda digna y hábitat saludable",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 178, 112, 162),
                      ),
                      textAlign: TextAlign.left,
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
                  child: InkWell(
                    onTap: (() => _politica(context)),
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
                  child: InkWell(
                    onTap: (() => _politica(context)),
                    child: Text(
                    "\nParticipación política y representación de las mujeres",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 178, 112, 162),
                      ),
                      textAlign: TextAlign.left,
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
                        'assets/images/stitch.webp'),
                    ),
                  ),
                  child: InkWell(
                    onTap: (() => _paz(context)),
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
                  child: InkWell(
                    onTap: (() => _paz(context)),
                    child: Text(
                    "\nPaz y convivencia con equidad de género",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 178, 112, 162),
                      ),
                      textAlign: TextAlign.left,
                    ),
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
Future<void> _trabajo(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Color.fromARGB(255, 122, 68, 149),
            title: const Text('TRABAJO DIGNO Y AUTONOMÍA DE LAS MUJERES'),
            titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 97, 201, 132),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
            content: const Text(
                'Busca garantizar el ejercicio pleno de los derechos económicos de las mujeres de todas las edades y condiciones, y el acceso a un trabajo en condiciones de equidad y dignidad, así como el reconocimiento de su aporte a la vida económica del municipio'),
                contentTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR', style: TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

Future<void> _salud(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Color.fromARGB(255, 122, 68, 149),
            title: const Text('SALUD INTEGRAL Y SALUD SEXUAL Y REPRODUCTIVA LIBRE E INFORMADA'),
            titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 97, 201, 132),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
            content: const Text(
                'A través de este derecho se busca reconocer, restituir y garantizar el ejercicio del derecho de las mujeres a disfrutar de una salud plena, acceder a servicios de salud que consulten sus necesidades e intereses y participar en la incorporación de un enfoque de género en los programas del Sistema de Salud Municipal.'),
                contentTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR', style: TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

Future<void> _educacion(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Color.fromARGB(255, 122, 68, 149),
            title: const Text('EDUCACIÓN EQUITATIVA E INCLUYENTE'),
            titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 97, 201, 132),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
            content: const Text(
                'A través de este derecho se busca promover el desarrollo de prácticas educativas no sexistas que fortalezcan la formación personal y favorezcan la interacción familiar y comunitaria sin discriminación por razones de género, con la generación de espacios de sensibilización, capacitación, promoción y participación.'),
                contentTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR', style: TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

Future<void> _libre(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Color.fromARGB(255, 122, 68, 149),
            title: const Text('TRATO EQUITATIVO Y ESCENARIOS LIBRES DE DISCRIMINACIONES'),
            titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 97, 201, 132),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
            content: const Text(
                'Garantizar la participación de la mujer en los espacios políticos y de incidencia pública y social, a través de la aplicabilidad de la ley, y de la implementación de procesos de formación y capacitación para el liderazgo de la mujer.'),
                contentTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR', style: TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

Future<void> _violencia(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Color.fromARGB(255, 122, 68, 149),
            title: const Text('VIDA LIBRE DE VIOLENCIAS'),
            titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 97, 201, 132),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
            content: const Text(
                'Desarrollar acciones de prevención y atención de las diversas formas de violencias basadas en género que impiden a las mujeres el goce efectivo de sus derechos.'),
                contentTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR', style: TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

Future<void> _vivienda(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Color.fromARGB(255, 122, 68, 149),
            title: const Text('VIVIENDAS DIGNAS Y UN HABITAT SALUDABLE PARA LAS MUJERES'),
            titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 97, 201, 132),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
            content: const Text(
                'Diseñar e implementar procesos de participación para que las mujeres se involucren en la construcción de programas de vivienda digna y la configuración de un espacio público seguro, equitativo, incluyente y libre de discriminación.'),
                contentTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR', style: TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _politica(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Color.fromARGB(255, 122, 68, 149),
            title: const Text('PARTICIPACIÓN POLÍTICA Y REPRESENTACIÓN DE LAS MUJERES'),
            titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 97, 201, 132),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
            content: const Text(
                'A través de este derecho se pretende propiciar el desarrollo de prácticas sociales, culturales, institucionales y políticas que aporten a la eliminación de discriminaciones por motivos de género, raza, etnia y religión.'),
                contentTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR', style: TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _paz(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:Color.fromARGB(255, 122, 68, 149),
            title: const Text('A LA PAZ Y LA CONVIVENCIA CON EQUIDAD DE GÉNERO'),
            titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 97, 201, 132),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
            content: const Text(
                'Reconocer la participación de las mujeres en las diferentes dinámicas que intervienen en la construcción de paz, el mantenimiento de la paz, la seguridad y la integridad en el territorio, a partir de sus agendas y su armonización con todos los aspectos de prevención y resolución de conflictos, la protección y atención a necesidades de las mujeres y niñas. De igual norma, pretende visibilizar sus logros en procesos organizativos y sus luchas por la garantía y restablecimiento de los derechos de las mujeres dentro y fuera del conflicto armado en sus diferentes vértices.'),
                contentTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR', style: TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }