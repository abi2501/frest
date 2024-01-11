import 'package:flutter/material.dart';
import 'package:frest/pages/details_screen.dart';
import 'package:frest/util/contants.dart';
import 'package:frest/util/helper.dart';
import 'package:frest/widgets/custom_widgets.dart';

int weight = 10;
int age = 20;
double height = 0.0;

void setHeight(double value) {
  height = value;
}

void calculateBMI(context) {
  double h = height * 0.01;
  double bmi = weight / (h * h);
  print("BMI");
  print(bmi);

  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return DetailsScreen(bmi: bmi);
  }));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    int incrementWeight() => weight++;

    int decrementWeight() => weight--;

    int incrementAge() => age++;

    int decrementAge() => age--;

    return Scaffold(
      appBar: AppBar(
          // title: Text("BMI"),
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(child: ButtonBox(text: "BMI Calculator")),
            addHorizontalSpace(20),
            getSmookyBox(getGenderBox(context)),
            getSmookyBox(getHeightBox(context, height)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getSmookyBox(WeightAgeBox(
                  title: "WEIGHT",
                  value: weight,
                  increment: incrementWeight,
                  decrement: decrementWeight,
                )),
                getSmookyBox(
                  WeightAgeBox(
                    title: "AGE",
                    value: age,
                    increment: incrementAge,
                    decrement: decrementAge,
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                calculateBMI(context);
              },
              child: ButtonBox(text: "Calculate"),
            )
          ],
        ),
      ),
    );
  }

  Widget getHeightBox(BuildContext context, double height) {
    return Container(
      width: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Height ", style: Theme.of(context).textTheme.titleMedium),
              const Text('CM', style: superScriptStyle),
            ],
          ),
          addVerticalSpace(5),
          const CustomRangeSlider(
            setHeight: setHeight,
          ),
          // addVerticalSpace(5),
        ],
      ),
    );
  }

  Widget getGenderBox(BuildContext context) {
    return SizedBox(
      width: 300,
      // height: 100,
      child: Column(
        children: [
          const ToggleGenderButtons(),
          // addVerticalSpace(20),
          Center(
            child:
                Text("GENDER", style: Theme.of(context).textTheme.titleMedium),
          )
        ],
      ),
    );
  }
}
