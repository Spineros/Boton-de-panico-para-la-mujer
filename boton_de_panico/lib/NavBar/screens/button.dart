import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:boton_de_panico/services/user_service.dart';
import 'package:boton_de_panico/services/post_service.dart';
// import 'package:boton_de_panico/provider/BotonProvider.dart';
import 'package:boton_de_panico/models/api_response.dart';
import 'package:boton_de_panico/models/user.dart';
import 'package:boton_de_panico/constant.dart';
import 'package:boton_de_panico/screens/login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

class ButtonContent extends StatefulWidget {
  const ButtonContent({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ButtonpageState createState() => _ButtonpageState();
}

class _ButtonpageState extends State<ButtonContent> {
  User? user;
  bool loading = true;
  var user_id;
  var user_name;
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;
        user_id = user?.id;
        user_name = user?.name;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  String location = 'Null, Press Button';
  // ignore: non_constant_identifier_names
  var Address;
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

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
          "BOTON DE PANICO",
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
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 244, 229)),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Utilizar solo en caso de emergencia',
                      style: TextStyle(
                          color: Color.fromARGB(255, 103, 63, 196),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      child: const Text('¡AYUDA!'),
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 250, 201, 127),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                title: const Text("Aviso"),
                                titleTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                content: const Text(
                                    "Botón de pánico recoge datos de la ubicación para facilitar el uso del aplicativo, aunque este se encuentre cerrado o no este en uso."),
                                contentTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.of(
                                        context,
                                        rootNavigator: true,
                                      ).pop(
                                        context,
                                      );
                                      Position position =
                                          await _getGeoLocationPosition();
                                      location =
                                          '${position.latitude},${position.longitude}';
                                      List<Placemark> placemarks =
                                          await placemarkFromCoordinates(
                                              position.latitude,
                                              position.longitude);
                                      print(placemarks);
                                      Placemark place = placemarks[0];
                                      Address =
                                          '${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.street}, ${place.locality}, ${place.name}, ${place.thoroughfare}, ${place.subThoroughfare}';
                                      setState(() {});
                                      // ignore: use_build_context_synchronously
                                      PostProvider().registro(
                                          Address.toString(),
                                          location,
                                          user_id,
                                          user_name,
                                          context);
                                    },
                                    child: const Text("Confirmar",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 148, 87, 167))),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).pop(
                                          context,
                                        );
                                      },
                                      child: const Text("Cancelar",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 163, 56, 56)))),
                                ],
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(230, 100),
                        foregroundColor:
                            const Color.fromARGB(255, 252, 219, 249),
                        backgroundColor: Color.fromARGB(255, 142, 76, 168),
                        shadowColor: const Color.fromARGB(255, 85, 25, 75),
                        elevation: 10,
                        textStyle: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        color: Color.fromARGB(255, 250, 182, 127),
                        width: 400,
                        height: 75,
                        child: Text(
                          'El botón de pánico está directamente asociado a la Policía Nacional y sus cuadrantes de policía, quienes llegarán por georreferenciación al alugar dónde se esta el Riesgo de Feminicidio',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Color.fromARGB(255, 97, 22, 78),
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 250,
                      height: 250,
                      color: Color.fromARGB(255, 241, 205, 255),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 0.8,
                          enlargeCenterPage: true,
                        ),
                        items: [
                          'assets/images/VIOLENTÓMETRO.png',
                          'assets/images/linea-de-atencion-a-mujeres.png'
                        ].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration:
                                      BoxDecoration(color: Colors.amber),
                                  child: GestureDetector(
                                      child: Image.asset(i, fit: BoxFit.fill),
                                      onTap: () {
                                        Navigator.push<Widget>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ImageScreen(i),
                                          ),
                                        );
                                      }));
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        width: 300,
                        height: 230,
                        child: Image.network(
                            'https://www.fusagasuga-cundinamarca.gov.co/Style%20Library/images/logo-header.png')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget ImageScreen(String url) {
  return Dialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(30)),
    ),
    insetAnimationCurve: Curves.decelerate,
  );
}
