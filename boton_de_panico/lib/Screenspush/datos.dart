import 'package:flutter/material.dart';
import 'package:boton_de_panico/models/api_response.dart';
import 'package:boton_de_panico/models/user.dart';
import 'package:boton_de_panico/services/user_service.dart';
import 'package:boton_de_panico/constant.dart';
import 'package:boton_de_panico/screens/login.dart';
// import 'package:boton_de_panico/provider/BotonProvider.dart';
import 'package:flutter/services.dart';

class Datos extends StatefulWidget {
  const Datos({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _DatosState createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  User? user;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = true;
  TextEditingController user_name = TextEditingController();
  TextEditingController user_phoneNumber = TextEditingController();
  TextEditingController user_tipodocumento = TextEditingController();
  TextEditingController user_documento = TextEditingController();
  TextEditingController user_sexo = TextEditingController();
  TextEditingController user_tipopoblacion = TextEditingController();

  // get user detail
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;
        user_name.text = user!.name ?? '';
        user_phoneNumber.text = user!.phoneNumber ?? '';
        user_tipodocumento.text = user!.tipodocumento ?? '';
        user_documento.text = user!.documento ?? '';
        user_sexo.text = user!.sexo ?? '';
        user_tipopoblacion.text = user!.tipopoblacion ?? '';
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

  //update profile
  void updateProfile() async {
    ApiResponse response = await updateUser(
        user_name.text,
        user_phoneNumber.text,
        user_tipodocumento.text,
        user_documento.text,
        user_sexo.text,
        user_tipopoblacion.text);
    setState(() {
      loading = false;
    });
    if (response.error == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.data}')));
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

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 255, 244, 229),
        elevation: 0.0,
        toolbarHeight: 80,
        title: Text(
          "PERFIL",
          style: TextStyle(
              color: Color.fromARGB(255, 103, 63, 196),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
        child:
      ListView(
        padding: EdgeInsets.only(right: 20, left: 20),
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              width: 200,
              height: 120,
              child: Image.asset('assets/images/LOGOM.png')),
          SizedBox(
            height: 20,
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: kInputDecoration('Nombre'),
                    controller: user_name,
                    validator: (val) => val!.isEmpty ? 'ERROR' : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: kInputDecoration('Celular'),
                    controller: user_phoneNumber,
                    validator: (val) => val!.isEmpty ? 'ERROR' : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: kInputDecoration('Tipo de documento'),
                    controller: user_tipodocumento,
                    validator: (val) => val!.isEmpty ? 'ERROR' : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: kInputDecoration('Documento'),
                    controller: user_documento,
                    validator: (val) => val!.isEmpty ? 'ERROR' : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: kInputDecoration('Sexo'),
                    controller: user_sexo,
                    validator: (val) => val!.isEmpty ? 'ERROR' : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: kInputDecoration('Población vulnerable'),
                    controller: user_tipopoblacion,
                    validator: (val) => val!.isEmpty ? 'ERROR' : null,
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          kTextButton('Update', () {
            if (formKey.currentState!.validate()) {
              setState(() {
                loading = true;
              });
              updateProfile();
            }
          }),

          // profilename(),
          // const SizedBox(
          //   height: 30,
          // ),
          // profileemail(),
          // const SizedBox(
          //   height: 20,
          // ),
          // profilephone(),
          // const SizedBox(
          //   height: 20,
          // ),
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 30),
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

// class FormKey {
//   static const formKey1 = Key('Key1');
//   static const formKey2 = Key('Key2');
//   static const formKey3 = Key('Key3');
// }