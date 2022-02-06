import 'package:flutter/material.dart';

const InputDecoration kSearchInputDecoration = InputDecoration(
  hintText: "Search...",
  hintStyle: TextStyle(color: Colors.black),
  suffixIcon: Material(
    elevation: 0,
    borderRadius: BorderRadius.all(Radius.circular(30)),
    child: Icon(
      Icons.search,
      color: Colors.grey,
    ),
  ),
  filled: true,
  fillColor: Colors.white,
  border: InputBorder.none,
  contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(width: 1.0, color: Colors.white)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(width: 1.0, color: Colors.white)),
);
const kBorderRadius = BorderRadius.all(Radius.circular((10)));
const MaterialColor primaryThemeColor =
    const MaterialColor(0xFFEAE7E7, colorCodes);
const Map<int, Color> colorCodes = {
  50: Color.fromRGBO(216, 217, 219, .1),
  100: Color.fromRGBO(216, 217, 219, .2),
  200: Color.fromRGBO(216, 217, 219, .3),
  300: Color.fromRGBO(216, 217, 219, .4),
  400: Color.fromRGBO(216, 217, 219, .5),
  500: Color.fromRGBO(216, 217, 219, .6),
  600: Color.fromRGBO(216, 217, 219, .7),
  700: Color.fromRGBO(216, 217, 219, .8),
  800: Color.fromRGBO(216, 217, 219, .9),
  900: Color.fromRGBO(216, 217, 219, 1),
};
const kMainBackGroundColor = Color(0xFFEAE7E7);
const kButtonColor = Color(0xFF1864D6);
const kButtonGradientColor1 = Color(0xFF09B3C4);
const kButtonGradientColor2 = Color(0xFF2D79A0);
const kMainTitleTextStyle =
    TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold);
const kTitleTextStyle =
    TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
const kTitleMediumTextStyle =
    TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold);
const kTitleMediumRedTextStyle = TextStyle(
    fontSize: 16, color: Colors.pinkAccent, fontWeight: FontWeight.bold);
const kLabelTextStyle =
    TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold);
const kLabelHintTextStyle =
    TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold);
const kLabelCategoryTextStyle = TextStyle(
    fontSize: 14, color: Colors.blueGrey, fontWeight: FontWeight.bold);
const kTitleSmallTextStyle =
    TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold);
const kLabelFloatinTextStyle =
    TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold);

const String apiKey = '81c100db66f0bd4548632d68d8e80860';
late bool byRoom = true;
