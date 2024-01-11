import 'package:flutter/material.dart';
import 'package:frest/pages/info_screen.dart';
import 'package:frest/util/helper.dart';
import 'package:frest/widgets/custom_widgets.dart';

class DetailsScreen extends StatelessWidget {
  final double bmi;

  const DetailsScreen({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Your Result",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              width: 400,
              height: 300,
              child: getSmookyBox(getResultContent(context)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BmiInfoScreen();
                }));
              },
              child: const ButtonBox(
                text: "Detail",
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getResultContent(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          bmi.toStringAsPrecision(2),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          "Your BMI Index",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        addVerticalSpace(40),
        Text(getBmiResult(bmi).toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.green, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
