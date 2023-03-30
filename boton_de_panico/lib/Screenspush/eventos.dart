import 'package:boton_de_panico/models/calendario.dart';
import 'package:flutter/material.dart';
import 'package:boton_de_panico/screens/ruta.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:boton_de_panico/services/calendario_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:boton_de_panico/constant.dart';
// import 'package:boton_de_panico/provider/BotonProvider.dart';

class Eventos extends StatefulWidget {
  const Eventos({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _EventosState createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  // Widget _imagenevento() {
  //   return Container(
  //     width: 250,
  //     height: 250,
  //     color: Color.fromARGB(255, 255, 248, 241),
  //     child: CarouselSlider(
  //       options: CarouselOptions(
  //         autoPlay: true,
  //         aspectRatio: 2.0,
  //         enlargeCenterPage: true,
  //       ),
  //       items: [
  //         element.multimedia,
  //       ],
  //     ),
  //   );
  // }

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
          "EVENTOS",
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
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: FutureBuilder(
                      future: ConnectionCalendario().getCalendario(),
                      builder: (context,
                          AsyncSnapshot<List<Calendario>> asyncSnapshot) {
                        if (asyncSnapshot.hasData) {
                          return Column(
                              children:
                                  listItems(asyncSnapshot.data!, context));
                        } else {
                          return const Center(
                            child: Text('No se logró cargar la información'),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
                SizedBox(
                  height: 0,
                ),
                Container(
                    margin:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 30),
                    width: 300,
                    height: 230,
                    child: Image.network(
                        'https://www.fusagasuga-cundinamarca.gov.co/Style%20Library/images/logo-header.png')),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> listItems(List<Calendario> data, BuildContext context) {
    List<Widget> listItems = [];

    data.forEach((element) {
      //VALIDACION QUE RED SOCIAL ES

      listItems.add(Column(
        children: [
          //cafe name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ExpandableText(
                    element.titulo.toUpperCase(),
                    expandText: 'Ver más',
                    collapseText: 'Ver menos',
                    maxLines: 2,
                    linkColor: Color.fromARGB(255, 243, 135, 33),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 85, 40, 122),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Expanded(
                  child: ExpandableText(
                    element.fecha.toUpperCase(),
                    expandText: 'Ver más',
                    collapseText: 'Ver menos',
                    maxLines: 2,
                    linkColor: Color.fromARGB(255, 243, 135, 33),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 85, 40, 122),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                // Text(
                //   element.title,
                //   style: const TextStyle(
                //       fontWeight: FontWeight.w700,
                //       fontSize: 18.0,
                //       shadows: [
                //         Shadow(
                //           blurRadius: 18.0,
                //           color: Color.fromARGB(255, 27, 116, 116),
                //           offset: Offset(0, 1.0),
                //         )
                //       ]),
                // ),
                TextButton(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.navigation_rounded,
                          color: Color.fromARGB(255, 67, 211, 115),
                        ),
                        Text(
                          'Ir al evento',
                          style: TextStyle(
                              color: Color.fromARGB(255, 67, 211, 115)),
                        )
                      ]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                RouteC(linkRuta: element.ruta))));
                  },
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // if you need this
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              eventosURL + element.multimedia,
                              scale: 0.5),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          //Restaurant Image
          // ListaImagenes(element.imagenes, context),

          const Divider(
            color: Color.fromARGB(255, 67, 211, 115),
          ),

          Text('Descripción del Evento'.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0)),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              child: Card(
                  color: Color.fromARGB(255, 250, 182, 127),
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // if you need this
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ExpandableText(
                      element.descripcion,
                      expandText: 'Ver más',
                      collapseText: 'Ver menos',
                      maxLines: 10,
                      linkColor: Color.fromARGB(255, 60, 202, 103),
                      textAlign: TextAlign.justify,
                    ),
                  )),
            ),
          )
        ],
      ));
    });

    return listItems;
  }
}
