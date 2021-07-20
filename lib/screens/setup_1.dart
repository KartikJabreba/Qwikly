import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:qwikly/utils/appColors.dart';
import 'package:qwikly/utils/styles.dart';

class StepperDemo extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<StepperDemo> {
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 4; // upperBound MUST BE total number of icons minus 1.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                NumberStepper(
                  numbers: [
                    1,
                    2,
                    3,
                    4,
                    5,
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
                Divider(),
                header(),
                Expanded(
                  child: Center(
                      child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(gapPadding: 8),
                                  labelText: "Shop name",
                                  labelStyle: rubikRegular.copyWith(
                                      color: AppColors.TextColor),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 180,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(gapPadding: 8),
                                  labelText: "Address",
                                  labelStyle: rubikRegular.copyWith(
                                      color: AppColors.TextColor),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(gapPadding: 8),
                                  labelText: "Links",
                                  labelStyle: rubikRegular.copyWith(
                                      color: AppColors.TextColor),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Enter links for your shop's Facebook page, Instagram page, website, etc"),
                            ],
                          ))
                      // Text('$activeStep' + "" + "good"),
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    previousButton(),
                    nextButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return FlatButton(
      color: Colors.red,
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Row(
        children: [
          Text(
            'NEXT',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.keyboard_arrow_right,
            size: 25,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return FlatButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Row(
        children: [
          Icon(
            Icons.keyboard_arrow_left,
            size: 25,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'PRE',
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                headerText(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Area of Operation';

      case 2:
        return 'Delivery Settings';

      case 3:
        return 'About Your Shop';

      case 4:
        return 'Reviews';

      default:
        return 'Shop name & Address';
    }
  }
}
