import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frest/util/contants.dart';
import 'package:frest/util/helper.dart';

class ButtonBox extends StatelessWidget {
  const ButtonBox({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      // padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF45B69),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class ToggleGenderButtons extends StatefulWidget {
  const ToggleGenderButtons({super.key});

  @override
  State<ToggleGenderButtons> createState() => _ToggleGenderButtonsState();
}

class _ToggleGenderButtonsState extends State<ToggleGenderButtons> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [isMaleSelected, isFemaleSelected];

    return ToggleButtons(
      renderBorder: false,
      isSelected: isSelected,
      onPressed: (index) {
        setState(() {
          if (index == 0) {
            isMaleSelected = true;
            isFemaleSelected = false;
          } else {
            isMaleSelected = false;
            isFemaleSelected = true;
          }
        });
      },
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: RoundedIcon(
            iconColor: isMaleSelected ? COLOR_WHITE : COLOR_SMOOKY_GREEN,
            iconItem: const Icon(
              Icons.male,
              size: 50,
            ),
            width: 70,
            height: 70,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RoundedIcon(
            iconColor: isFemaleSelected ? COLOR_WHITE : COLOR_SMOOKY_GREEN,
            iconItem: const Icon(
              Icons.female,
              size: 50,
            ),
            width: 70,
            height: 70,
          ),
        ),
      ],
    );
  }
}

class RoundedIcon extends StatelessWidget {
  const RoundedIcon(
      {super.key,
      required this.iconColor,
      required this.iconItem,
      required this.width,
      required this.height});

  final Icon iconItem;
  final Color iconColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: iconColor,
      ),
      child: iconItem,
    );
  }
}

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({super.key, required this.setHeight});
  final Function(double value) setHeight;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  double start = 0.0;
  double end = 20.0;
  double value = 0.0;
  TextEditingController heightTxtController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    heightTxtController.text = "0";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    heightTxtController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.black),
            controller: heightTxtController,
          ),
        ),
        addVerticalSpace(30),
        Slider(
          min: 0,
          max: 250,
          value: value,
          label: '${value.round()}',
          // divisions: 5,
          onChanged: (double values) {
            print('onChanged');
            setState(() {
              print(values);
              value = values;
              // _rangeValues = values;
              widget.setHeight(values);
              heightTxtController.text = values.round().toString();
            });
          },
        )
      ],
    );
  }
}

class WeightAgeBox extends StatefulWidget {
  WeightAgeBox(
      {super.key,
      required this.title,
      required this.value,
      required this.increment,
      required this.decrement});

  final String title;
  final int value;
  int Function() increment;
  int Function() decrement;

  @override
  State<WeightAgeBox> createState() => _WeightAgeBoxState();
}

class _WeightAgeBoxState extends State<WeightAgeBox> {
  String displayValue = "";
  @override
  Widget build(BuildContext context) {
    if (displayValue == "") {
      displayValue = widget.value.toString();
    }

    return Container(
      width: 150,
      child: Column(
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          // addVerticalSpace(5),
          Text(
            displayValue,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          // addVerticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  int val = widget.decrement();
                  setState(() {
                    displayValue = val.toString();
                  });
                },
                child: const RoundedIcon(
                  iconColor: COLOR_SMOOKY_GREEN,
                  iconItem: Icon(
                    Icons.remove,
                    color: COLOR_WHITE,
                  ),
                  width: 40,
                  height: 40,
                ),
              ),
              addHorizontalSpace(10),
              InkWell(
                onTap: () {
                  int val = widget.increment();
                  setState(() {
                    displayValue = val.toString();
                  });
                },
                child: const RoundedIcon(
                  iconColor: COLOR_SMOOKY_GREEN,
                  iconItem: Icon(
                    Icons.add,
                    color: COLOR_WHITE,
                  ),
                  width: 40,
                  height: 40,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BmiListItem extends StatelessWidget {
  const BmiListItem(
      {super.key, required this.bmi, required this.min, required this.max});

  final String bmi;
  final double min;
  final double max;

  @override
  Widget build(BuildContext context) {
    String txt = (min != 0.0 && max != 0.0) ? "-" : "";
    String minRange = min == 0.0 ? "<" : "$min $txt";
    String maxRange = max == 0.0 ? ">" : "$max";

    return getBmiInfoCard(context, minRange, maxRange);
  }

  Card getBmiInfoCard(BuildContext context, String minRange, String maxRange) {
    return Card(
      color: COLOR_SMOOKY_LIGHT_GREEN,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bmi,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Where your body mass index",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: const Color(0xFF999DA9)),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text("$minRange $maxRange",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: COLOR_BLUE,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                    addVerticalSpace(5),
                    Row(
                      children: [
                        Text("Kg/m",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: COLOR_BLUE,
                                    fontWeight: FontWeight.bold)),
                        Text("2",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontFeatures: const [
                              FontFeature.superscripts()
                            ], color: COLOR_BLUE, fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
