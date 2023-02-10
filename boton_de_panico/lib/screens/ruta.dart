import 'dart:io';

import 'package:flutter/material.dart';
import 'package:boton_de_panico/screens/location.dart';
import 'package:webview_flutter/webview_flutter.dart';


class RouteC extends StatefulWidget {
    String linkRuta;
   RouteC({Key? key, required this.linkRuta,}) : super(key: key);

  @override
  State<RouteC> createState() => _RouteCState();
  
}

class _RouteCState extends State<RouteC> {
 late String linkRuta;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
      
    }
    determinePosition();
   linkRuta =  getLink(widget.linkRuta);
  }
  @override
  Widget build(BuildContext context) {
   
return  WebView(

       
        initialUrl: linkRuta ,
        javascriptMode: JavascriptMode.unrestricted,

    );
  }
  String getLink(String link){
    return link;

}
}



