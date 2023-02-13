import 'package:boton_de_panico/models/api_response.dart';
import 'package:boton_de_panico/models/user.dart';
import 'package:boton_de_panico/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:boton_de_panico/constant.dart';
import 'package:boton_de_panico/screens/login.dart';
import 'package:flutter/services.dart';

class AccountContent extends StatefulWidget {
  @override
  _AccountContentState createState() => _AccountContentState();
}

class _AccountContentState extends State<AccountContent> {
  User? user;
  bool loading = true;
  var user_name;
  var user_email;
  var user_phoneNumber;
  var user_tipodocumento;
  var user_documento;
  var user_sexo;
  var user_tipopoblacion;
  // get user detail
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;
        user_name = user?.name;
        user_email = user?.email;
        user_phoneNumber = user?.phoneNumber;
        user_tipodocumento = user?.tipodocumento;
        user_documento = user?.documento;
        user_sexo = user?.sexo;
        user_tipopoblacion = user?.tipopoblacion;
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

  Widget profilephone() => Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 209, 193, 228),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Text(
        'Telefono: $user_phoneNumber',
        style: TextStyle(
            color: Color.fromARGB(255, 255, 225, 191),
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ));

  Widget profileemail() => Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 209, 193, 228),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Text(
        'Email: $user_email',
        style: TextStyle(
            color: Color.fromARGB(255, 255, 225, 191),
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ));

  Widget profilename() => Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 209, 193, 228),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Text(
        'Nombre: $user_name',
        style: TextStyle(
            color: Color.fromARGB(255, 255, 225, 191),
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ));

  // Widget profiletipod() => Container(
  //     width: 100,
  //     height: 50,
  //     decoration: BoxDecoration(
  //       color: Color.fromARGB(255, 209, 193, 228),
  //       borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(10),
  //           topRight: Radius.circular(10),
  //           bottomLeft: Radius.circular(10),
  //           bottomRight: Radius.circular(10)),
  //     ),
  //     child: Text(
  //       'Tipo de documento: $user_tipodocumento',
  //       style: TextStyle(
  //           color: Color.fromARGB(255, 255, 225, 191),
  //           fontSize: 22,
  //           fontWeight: FontWeight.w500),
  //     ));

  Widget profiledocumento() => Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 209, 193, 228),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Text(
        ' $user_tipodocumento: $user_documento',
        style: TextStyle(
            color: Color.fromARGB(255, 255, 225, 191),
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ));

  Widget profilesexo() => Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 209, 193, 228),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Text(
        'Sexo: $user_sexo',
        style: TextStyle(
            color: Color.fromARGB(255, 255, 225, 191),
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ));

  Widget profilepoblacion() => Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 209, 193, 228),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Text(
        'Población vulnerable: $user_tipopoblacion',
        style: TextStyle(
            color: Color.fromARGB(255, 255, 225, 191),
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ));

  //update profile
  // void updateProfile() async {
  //   ApiResponse response = await updateUser(txtNameController.text,
  //       txtEmailController.text, txtphoneNumberController.text);
  //   setState(() {
  //     loading = false;
  //   });
  //   if (response.error == null) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('${response.data}')));
  //   } else if (response.error == unauthorized) {
  //     logout().then((value) => {
  //           Navigator.of(context).pushAndRemoveUntil(
  //               MaterialPageRoute(builder: (context) => Login()),
  //               (route) => false)
  //         });
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('${response.error}')));
  //   }
  // }

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
              fontSize: 25,
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
        child: ListView(
          padding: EdgeInsets.only(right: 20, left: 20),
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                width: 200,
                height: 120,
                child: Image.asset('assets/images/LOGOM.png')),
            SizedBox(
              height: 20,
            ),
            profilename(),
            const SizedBox(
              height: 20,
            ),
            profileemail(),
            const SizedBox(
              height: 20,
            ),
            profilephone(),
            const SizedBox(
              height: 20,
            ),
            // profiletipod(),
            // const SizedBox(
            //   height: 20,
            // ),
            profiledocumento(),
            const SizedBox(
              height: 20,
            ),
            profilesexo(),
            const SizedBox(
              height: 20,
            ),
            profilepoblacion(),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.only(right: 10, left: 10, bottom: 60),
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

class FormKey {
  static const formKey1 = Key('Key1');
  static const formKey2 = Key('Key2');
  static const formKey3 = Key('Key3');
}
