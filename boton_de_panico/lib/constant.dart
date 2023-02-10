// ----- STRINGS ------
import 'package:flutter/material.dart';

const baseURL = 'http://172.17.180.89:8000/api';
// const baseURL = 'http://172.17.100.15:8000/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const postsURL = baseURL + '/registros';
const calendarioURL = baseURL + '/show';
const olvidoURL = 'http://172.17.100.89:8000/forgot-password';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = '¡Algo salio mal, Intenet de nuevo!';

// --- input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
      filled: true,
      fillColor: Color.fromARGB(255, 214, 193, 228),
      labelText: label,
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 20)));
}

// button

TextButton kTextButton(String label, Function onPressed) {
  return TextButton(
    child: Text(
      label,
      style: TextStyle(color: Color.fromARGB(255, 252, 219, 249), fontSize: 20),
    ),
    style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => Color.fromARGB(255, 147, 83, 231)),
        padding: MaterialStateProperty.resolveWith(
            (states) => EdgeInsets.symmetric(vertical: 10, horizontal: 20))),
    onPressed: () => onPressed(),
  );
}

// loginRegisterHint
Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
          child: Text(label,
              style: TextStyle(color: Color.fromARGB(255, 0, 157, 113))),
          onTap: () => onTap())
    ],
  );
}

// likes and comment btn

Expanded kLikeAndComment(
    int value, IconData icon, Color color, Function onTap) {
  return Expanded(
    child: Material(
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: color,
              ),
              SizedBox(width: 4),
              Text('$value')
            ],
          ),
        ),
      ),
    ),
  );
}
