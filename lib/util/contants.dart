import 'dart:ui';

import 'package:flutter/material.dart';

const COLOR_WHITE = Color(0xFFFFFFFF);
const COLOR_SMOOKY_BOX = Color(0xFFFDF0F0);
const COLOR_SMOOKY_GREEN = Color(0xFF59C3C3);
const COLOR_SMOOKY_LIGHT_GREEN = Color(0xFFdbf0f1);
const COLOR_BLUE = Color(0xFF4062BB);

ThemeData lightTheme = ThemeData(
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 96, fontWeight: FontWeight.w300, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 60, fontWeight: FontWeight.w400, color: Colors.black),
    displaySmall: TextStyle(
        fontSize: 48, fontWeight: FontWeight.w400, color: Colors.black),
    headlineLarge: TextStyle(
        fontSize: 40, fontWeight: FontWeight.w600, color: Colors.black),
    headlineMedium: TextStyle(
        fontSize: 34, fontWeight: FontWeight.w400, color: Colors.black),
    headlineSmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
    titleMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF)),
    bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
  ),
);

const superScriptStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontFamily: 'Poppins',
  fontFeatures: [FontFeature.superscripts()],
);

List bmi_details = [
  {
    "bmi_index": "Underweight",
    "min": 0.0,
    "max": 18.5,
  },
  {
    "bmi_index": "Normal",
    "min": 18.5,
    "max": 24.9,
  },
  {
    "bmi_index": "Overweight",
    "min": 25.0,
    "max": 29.9,
  },
  {
    "bmi_index": "Obese",
    "min": 0.0,
    "max": 30.0,
  },
];
