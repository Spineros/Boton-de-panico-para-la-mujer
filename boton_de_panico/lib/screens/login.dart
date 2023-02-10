import 'package:boton_de_panico/NavBar/fluid_nav_bar.dart';
import 'package:boton_de_panico/NavBar/screens/home.dart';
import 'package:boton_de_panico/models/api_response.dart';
import 'package:boton_de_panico/models/user.dart';
import 'package:boton_de_panico/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.Dart';
import 'package:flutter/services.dart';

import '../constant.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => NavBar()), (route) => false);
  }

  Widget _image() {
    return Container(
        margin: const EdgeInsets.only(right: 90, left: 90),
        width: 40,
        height: 150,
        child: Image.asset('assets/images/LOGOM.png'));
  }

  Widget _logoal() {
    return Container(
        margin: const EdgeInsets.only(right: 0, left: 0),
        width: 600,
        height: 130,
        child: Image.network(
            'https://www.fusagasuga-cundinamarca.gov.co/Style%20Library/images/logo-header.png'));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'BIENVENIDA\n',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 122, 68, 149),
          ),
          children: [
            TextSpan(
                text: "Ingrese sus datos",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 178, 112, 162),
                ))
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            SizedBox(
              height: 80,
            ),
            _image(),
            SizedBox(height: 20),
            _title(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 255, 246, 241),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              margin: const EdgeInsets.only(top: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: txtEmail,
                        validator: (val) =>
                            val!.isEmpty ? 'Invalid email address' : null,
                        decoration: kInputDecoration('Email')),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: txtPassword,
                        obscureText: true,
                        validator: (val) => val!.length < 6
                            ? 'Required at least 6 chars'
                            : null,
                        decoration: kInputDecoration('Password')),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    new InkWell(
                        child: new Text(
                          '¿Olvido su contraseña?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 157, 113)),
                        ),
                        onTap: () => launch(olvidoURL)),
                    SizedBox(
                      height: 20,
                    ),
                    loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : kTextButton('INGRESAR', () {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                                _loginUser();
                              });
                            }
                          }),
                    SizedBox(
                      height: 10,
                    ),
                    kLoginRegisterHint('No tiene cuenta? ', 'Registrar', () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Register()),
                          (route) => false);
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    _logoal(),
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
