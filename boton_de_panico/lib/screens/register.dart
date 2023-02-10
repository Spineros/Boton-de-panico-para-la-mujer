import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:boton_de_panico/NavBar/screens/home.dart';
import 'package:boton_de_panico/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boton_de_panico/services/AuthProvider.dart';
import 'package:flutter/services.dart';

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
  var updatedPhone;

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
                  context);
            },
            child: Text(
              'CREAR',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 252, 219, 249)),
            ),
          )
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
