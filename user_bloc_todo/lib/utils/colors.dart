import 'package:flutter/material.dart';

const  cardcolor1= Color.fromARGB(255, 197, 229, 227);
const  cardcolor2= Colors.pink;
const  cardcolor3= Colors.lightBlue;
const  cardcolor4= Color.fromARGB(255, 255, 117, 140);
const  cardcolor5= Color.fromARGB(255, 255, 126, 179);
const  cardcolor6= Color.fromARGB(255, 250, 208, 196);
const  cardcolor7= Color.fromARGB(255, 255, 154, 158);

const Gradient cardgrad1 = LinearGradient(
  colors: [Colors.white,Color.fromARGB(255, 241, 241, 241)],
  begin: Alignment.topCenter,
  end: Alignment.bottomRight,
);

const Gradient background = LinearGradient(
  colors: [Color.fromARGB(255, 255, 229, 222), 
    Color.fromRGBO(254, 250, 251, 1),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const Gradient cardgrad2 = LinearGradient(
  colors: [Color.fromARGB(255, 255, 216, 208), Color.fromARGB(255, 255, 210, 211)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);