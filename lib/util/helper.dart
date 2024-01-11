import 'package:flutter/material.dart';
import 'package:frest/util/contants.dart';

Widget getSmookyBox(Widget contentItems) {
  return Container(
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.only(left: 10, top: 25, bottom: 25, right: 10),
    decoration: BoxDecoration(
        color: COLOR_SMOOKY_BOX, borderRadius: BorderRadius.circular(15)),
    child: contentItems,
  );
}

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

String getBmiResult(double bmi) {
  if (bmi < 18.5) {
    return "Underweight";
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    return "Normal";
  } else if (bmi >= 25.0 && bmi <= 29.9) {
    return "Overweight";
  } else if (bmi >= 30) {
    return "Obese";
  } else {
    return "";
  }
}
