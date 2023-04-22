import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:boton_de_panico/screens/login.dart';
import 'package:boton_de_panico/services/AuthProvider.dart';
import 'package:url_launcher/url_launcher.Dart';
import 'package:boton_de_panico/constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<Register> {
  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController phoneNumber = new TextEditingController();
  String dropdownValue = 'Tarjeta de identidad';
  final TextEditingController documento = new TextEditingController();
  String dropdownValu = 'Femenino';
  String dropdownVal = 'Víctima de conflicto armado';
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmpassword = new TextEditingController();
  final TextEditingController countryCode = new TextEditingController();
  final TextEditingController nombrefamiliar =  TextEditingController();
  final TextEditingController telfamiliar =  TextEditingController();
  var updatedPhone;

  final Uri toLaunch = Uri.parse(
      'http://fusagasuga-cundinamarca.gov.co/Paginas/Politicas-de-Privacidad-y-Condiciones-de-Uso.aspx');

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _entryNameField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 1,
          ),
          //name textfield
          Container(
            child: TextField(
              controller: name,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 173, 130, 184),
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _entryEmailField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 1,
          ),
          //name textfield
          Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 173, 130, 184),
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _entryPhoneField(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
              child: IntlPhoneField(
            controller: phoneNumber,
            decoration: InputDecoration(
              //decoration for Input Field
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'CO', //default contry code, BD for Bangladesh
            onChanged: (phone) {
              updatedPhone = phone.completeNumber.replaceAll('+', '');
              //when phone number country code is changed
              print(phone.completeNumber); //get complete number
              print(phone.countryCode); // get country code only
              print(phone.number); // only phone number
            },
          )),
        ],
      ),
    );
  }

  Widget _entrytipodocumentoField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Tipo de documento'),
          DropdownButton(
            value: dropdownValue,
            underline: Container(
              height: 2,
              color: Color.fromARGB(255, 173, 130, 184),
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                print(dropdownValue);
              });
            },
            items: <String>[
              'Tarjeta de identidad',
              'Cedula de ciudadania',
              'Cedula de extranjería',
              'Pasaporte'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _entrydocumentoField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 1,
          ),
          //name textfield
          Container(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: documento,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 173, 130, 184),
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _entrysexoField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Sexo'),
          DropdownButton(
            value: dropdownValu,
            underline: Container(
              height: 2,
              color: Color.fromARGB(255, 173, 130, 184),
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValu = newValue!;
                print(dropdownValu);
              });
            },
            items: <String>[
              'Femenino',
              'Masculino',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _entrytipopoblacionField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Población vulnerable'),
          DropdownButton(
            value: dropdownVal,
            underline: Container(
              height: 2,
              color: Color.fromARGB(255, 173, 130, 184),
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownVal = newValue!;
                print(dropdownVal);
              });
            },
            items: <String>[
              'Víctima de conflicto armado',
              'Discapacidad',
              'Trabajadora sexual',
              'Población migrante',
              'Ninguna de las anteriores',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _entryPasswordField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 1,
          ),
          //name textfield
          Container(
            child: TextField(
              controller: password,
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: "minimo 8 caracteres",
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 173, 130, 184),
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _entryConfirmPasswordField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 1,
          ),
          //name textfield
          Container(
            child: TextField(
              controller: confirmpassword,
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: "minimo 8 caracteres",
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 173, 130, 184),
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _entrynomfamField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 1,
          ),
          //name textfield
          Container(
            child: TextField(
              controller: nombrefamiliar,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 173, 130, 184),
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _entrytelfamField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 1,
          ),
          //name textfield
          Container(
              child: IntlPhoneField(
            controller: telfamiliar,
            decoration: InputDecoration(
              //decoration for Input Field
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'CO', //default contry code, BD for Bangladesh
            onChanged: (phone) {
              updatedPhone = phone.completeNumber.replaceAll('+', '');
              //when phone number country code is changed
              print(phone.completeNumber); //get complete number
              print(phone.countryCode); // get country code only
              print(phone.number); // only phone number
            },
          )),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 255, 255, 255),
                offset: Offset(2, 4),
                blurRadius: 13,
                spreadRadius: 5)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 147, 112, 180),
                Color.fromARGB(255, 147, 112, 180),
              ])),
      child: Column(
        children: [
          ElevatedButton(
            child: const Text('REGISTRAR'),
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 250, 201, 127),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      title: const Text("¿Permitir que el Botón de pánico guarde sus datos?."),
                      titleTextStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      content: const Text(
                          "Recuerde que sus datos serán tratados según la política de tratamiento de datos y la ley 1581 de 2012, por el cual se dictan disposiciones generales para la protección de datos personales"),
                      contentTextStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      actions: [
                        TextButton(
                            onPressed: () {
                              AuthProvider().register(
                                  name.text,
                                  email.text,
                                  updatedPhone,
                                  dropdownValue.toString(),
                                  documento.text,
                                  dropdownValu.toString(),
                                  dropdownVal.toString(),
                                  password.text,
                                  confirmpassword.text,
                                  'BD',
                                  nombrefamiliar.text.toString(),
                                  telfamiliar.text.toString(),
                                  context);
                              Navigator.of(
                                context,
                                rootNavigator: true,
                              ).pop(
                                context,
                              );
                            },
                            child: const Text("Aceptar",
                                style: TextStyle(color: Color.fromARGB(255, 148, 87, 167)))),
                        TextButton(
                            onPressed: () {
                              _launched = _launchInBrowser(toLaunch);
                              Navigator.of(
                                context,
                                rootNavigator: true,
                              ).pop(
                                context,
                              );
                            },
                            child: const Text("ver términos",
                                style: TextStyle(color: Color.fromARGB(255, 0, 157, 113)))),
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
                                style: TextStyle(color: Color.fromARGB(255, 163, 56, 56)))),
                      ],
                    );
                  });
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 60),
              foregroundColor: const Color.fromARGB(255, 252, 219, 249),
              backgroundColor: Color.fromARGB(255, 147, 112, 180),
              elevation: 0,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: 'Crear su cuenta\n',
          style: TextStyle(
            color: Color.fromARGB(255, 122, 68, 149),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextSpan(
          text: 'Registre su cuenta para accerder',
          style: TextStyle(
              color: Color.fromARGB(255, 178, 112, 162), fontSize: 15),
        ),
      ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          _entryNameField("Nombre"),
          _entryEmailField("Email"),
          _entryPhoneField("Telefono"),
          _entrytipodocumentoField("Tipo de documento"),
          _entrydocumentoField("Documento"),
          _entrysexoField("Sexo"),
          _entrytipopoblacionField("Población vulnerable"),
          _entryPasswordField("Contraseña", isPassword: true),
          _entryConfirmPasswordField("Confirmar contraseña", isPassword: true),
          Container(
                  width: 270,
                  height: 80,
                  margin: const EdgeInsets.only(
                    left: 0,
                    right: 0,
                    top: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 178, 112, 162),
                  ),
                  child: Text(
                    "NOTA: Por favor ingresar el nombre y telefono de una persona de confianza",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
          _entrynomfamField("Nombre familiar"),
          _entrytelfamField("Telefono familiar"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              // Colors.purple,
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ])),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color.fromARGB(255, 100, 10, 128),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: _title(),
                )
              ],
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 249, 241),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  margin: const EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _emailPasswordWidget(),
                        SizedBox(
                          height: 1,
                        ),
                        _submitButton(),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
