import 'package:flutter/material.dart';
import 'package:frest/util/helper.dart';
import 'package:frest/util/contants.dart';
import 'package:frest/widgets/custom_widgets.dart';

class BmiInfoScreen extends StatelessWidget {
  const BmiInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context),
        body: ListView.builder(
          itemCount: bmi_details.length,
          itemBuilder: (context, index) {
            Map ele = bmi_details[index];
            print(ele);
            print(ele["min"]);

            return ListTile(
              title: BmiListItem(
                bmi: ele["bmi_index"],
                min: ele["min"],
                max: ele["max"],
              ),
            );
          },
        ));
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      toolbarHeight: 300,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFC4153), Color(0xFFF7BABA)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
      // centerTitle: true,
      title: Column(
        children: [
          Center(
            child: Text(
              "Information",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          addVerticalSpace(20),
          Row(
            children: [
              Text(
                "Classification of \nWeight Status",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.left,
              )
            ],
          )
        ],
      ),
    );
  }
}
