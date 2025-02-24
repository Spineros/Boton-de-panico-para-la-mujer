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
        backgroundColor: Color.fromARGB(255, 255, 244, 229),
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
                    color: Color.fromARGB(255, 250, 182, 127),
                    image: new DecorationImage(
                      image: new AssetImage(
                          'assets/images/APPMUJERES/VIOLENCIA/PSICOLOGICA-08.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: (() => _psicologica(context)),
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
                    onTap: (() => _psicologica(context)),
                    child: Text(
                      "\nVIOLENCIA PSICOLÓGICA",
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
                          'assets/images/APPMUJERES/VIOLENCIA/FISICA-09.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: (() => _fisica(context)),
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
                    onTap: (() => _fisica(context)),
                    child: Text(
                      "\nVIOLENCIA FÍSICA",
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
                          'assets/images/APPMUJERES/VIOLENCIA/SEXUAL-10.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: (() => _sexual(context)),
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
                    onTap: (() => _sexual(context)),
                    child: Text(
                      "\nVIOLENCIA SEXUAL",
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
                          'assets/images/APPMUJERES/VIOLENCIA/ECONOMICA-11.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: (() => _economica(context)),
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
                    onTap: (() => _economica(context)),
                    child: Text(
                      "\nVIOLENCIA ECONÓMICA Y/O PATRIMONIAL",
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
                          'assets/images/APPMUJERES/VIOLENCIA/SIMBOLICA-12.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: (() => _simbolica(context)),
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
                    onTap: (() => _simbolica(context)),
                    child: Text(
                      "\nVIOLENCIA SIMBÓLICA",
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
          ],
        ),
      ),
    );
  }

  Future<void> _psicologica(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 122, 68, 149),
            title: const Text('VIOLENCIA PSICOLÓGICA'),
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 97, 201, 132),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            content: const Text(
                'Es una forma grave de agresión que no utiliza el contacto físico pero puede dejar graves secuelas en la psique de la víctima ya que es una modalidad muy efectiva de ejercer poder sobre otro.\n'
                'EJEMPLOS\n'
                'Amenaza, Chantaje, Humillación, Insultos, Control\n'
                '\n'
                'Si eres víctima de ésta violencia en el entorno familiar asiste a la Comisaría de Familia - Calle 18 No. 11-116 Edificio Copacabana, Barrio Balmoral, Fusagasugá.',
                textAlign: TextAlign.justify),
            contentTextStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 13,
                fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR',
                    style:
                        TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _fisica(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 122, 68, 149),
            title: const Text('VIOLENCIA FÍSICA'),
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 97, 201, 132),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            content: const Text(
                'Es la forma de violencia que atañe al cuerpo y a la fuerza física; el castigo corporal, capaz de ocasionar dolor o incluso la muerte, así como sentimientos traumáticos y de humillación.\n'
                'EJEMPLOS\n'
                'Golpizas, Disparos, Violaciones, Castigos físicos que infringen dolor\n'
                '\n'
                'Si eres víctima de ésta violencia asiste lo más pronto posible a la Clínica Belén (Transversal 12 # 17-01) o el Hospital San Rafael de Fusagasugá (Diagonal 23 12 – 64)',
                textAlign: TextAlign.justify),
            contentTextStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 13,
                fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR',
                    style:
                        TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _sexual(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 122, 68, 149),
            title: const Text('VIOLENCIA SEXUAL'),
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 97, 201, 132),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            content: const Text(
                'Es cualquier actividad o contacto sexual que ocurre sin su consentimiento. Puede involucrar fuerza física o amenaza de fuerza. También puede ocurrir debido a coerción o amenazas.\n'
                'EJEMPLOS\n'
                'Violación, Esclavitud sexual, Prostitución forzada, Embarazo forzado, Esterilización forzada\n'
                '\n'
                'Si eres víctima de ésta violencia asiste lo más pronto posible a la Clínica Belén (Transversal 12 # 17-01) o el Hospital San Rafael de Fusagasugá (Diagonal 23 12 – 64)',
                textAlign: TextAlign.justify),
            contentTextStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 13,
                fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR',
                    style:
                        TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _economica(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 122, 68, 149),
            title: const Text('VIOLENCIA ECONOMICA y PATRIMONIO'),
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 97, 201, 132),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            content: const Text(
                'Se manifiesta a través de la limitación de recursos económicos, del acceso al mercado laboral formal, de la toma de decisiones, del control de los ingresos, y de la privación de las pensiones alimenticias para los hijos.\n'
                '\n'
                'Si eres víctima de ésta violencia en el entorno familiar asiste a la Comisaría de Familia - Calle 18 No. 11-116 Edificio Copacabana, Barrio Balmoral, Fusagasugá.\n'
                '\n'
                'Si NO es en el contexto intrafamiliar recuerda asistir a Fiscalía (Diagonal 16 #12-2) Fusagasugá',
                textAlign: TextAlign.justify),
            contentTextStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 13,
                fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR',
                    style:
                        TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _simbolica(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 122, 68, 149),
            title: const Text('VIOLENCIA SIMBOLICA'),
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 97, 201, 132),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            content: const Text(
                'La que a través de patrones estereotipados, mensajes, valores, íconos o signos, transmita y reproduzca dominación, desigualdad y discriminación en las relaciones sociales, naturalizando la subordinación de la mujer en la sociedad.',
                textAlign: TextAlign.justify),
            contentTextStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 13,
                fontWeight: FontWeight.bold),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('CERRAR',
                    style:
                        TextStyle(color: Color.fromARGB(255, 104, 182, 134))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
