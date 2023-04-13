import 'package:flutter/material.dart';
import 'package:newapp/pages/home.dart';
import 'package:newapp/pages/sidemenu.dart';
import 'package:newapp/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => sidemenu()
      },
      debugShowCheckedModeBanner: false,
    ));
