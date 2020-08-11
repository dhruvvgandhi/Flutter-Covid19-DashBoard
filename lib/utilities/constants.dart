import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kAppBarMainTitle = 'Coronavirus Tracker';

final kNumberFormat = NumberFormat('#,##0');

final kColourPrimary = Colors.blue[800];
final kColourBackground = Colors.white;

final kColourPieSick = Colors.red[700];
final kColourPieRecovered = Colors.green;
final kColourPieDead = Colors.black;

final kColourAlertBackground = Colors.blue[700];

const kTextStyleAppBar = TextStyle(
  fontFamily: 'Courier-Prime',
);
const kTextStyleDate = TextStyle(
  fontFamily: 'Courier-Prime',
  fontSize: 21.0,
);
const kData = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 15.0,
    textBaseline: TextBaseline.ideographic
);
const kDataActive = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 13.0,
    color: Colors.red,
    fontWeight: FontWeight.bold
);
const kDataDeath = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 13.0,
    color: Colors.black,
    fontWeight: FontWeight.bold
);
const kDataRecoverd = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 13.0,
    color: Colors.green,
    fontWeight: FontWeight.bold
);
const kTextStyleLocationLabel = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  fontSize: 32.0,
);
const kTextStyleTotalLabel = TextStyle(
  fontFamily: 'Courier-Prime',
  fontSize: 21.0,
);
const kTextStyleTotalNumber = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  fontSize: 32.0,
);
const kTextStyleStats = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  fontSize: 21.0,
);
const kTextStyleAlertTitle = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  fontSize: 27,
  color: Colors.white,
);
const kTextStyleAlertText = TextStyle(
  fontFamily: 'Courier-Prime',
  fontSize: 18,
  color: Colors.white,
);
const kTextStyleAlertButton = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  fontSize: 22,
  color: Colors.white,
);
const kTextStyleTextField = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  fontSize: 21,
);
const kTextStyleTextFieldHint = TextStyle(
  fontFamily: 'Courier-Prime',
  fontSize: 21,
);

final kInputDecorationTextField = InputDecoration(
  hintText: 'Enter country name:',
  hintStyle: kTextStyleTextFieldHint,
  filled: true,
  fillColor: Colors.lightBlue,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);
