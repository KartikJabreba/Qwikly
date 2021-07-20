import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:qwikly/utils/appColors.dart';
import 'package:qwikly/utils/styles.dart';
import 'package:qwikly/widget/slider.dart';

class Setup2 extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<Setup2> {
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
                // NumberStepper(
                //   numbers: [
                //     1,
                //     2,
                //     3,
                //     4,
                //     5,
                //   ],

                //   // activeStep property set to activeStep variable defined above.
                //   activeStep: activeStep,

                //   // This ensures step-tapping updates the activeStep.
                //   onStepReached: (index) {
                //     setState(() {
                //       activeStep = index;
                //     });
                //   },
                // ),
                Divider(),
                //header(),
                Expanded(
                  child: Center(
                      child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(12, 18, 12, 22),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_circle_outline_sharp),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("My Apartment"),
                                    ],
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(gapPadding: 8),
                                      labelText: "Your apartment name",
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "This allow you to sell your items locally in your apartments. You will be visible in local search results only.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(12, 18, 12, 22),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              Icons.check_circle_outline_sharp),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("Within Radius"),
                                        ],
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'your store location : ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'Delhi',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SliderExample(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "10km radius from your store",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(),
                                      Text(
                                        "This allow you to sell your items locally in your apartments. You will be visible in local search results only.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(12, 18, 12, 22),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_circle_outline_sharp),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("My City"),
                                    ],
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(gapPadding: 8),
                                      labelText: "Your apartment name",
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "This allow you to sell your items locally in your apartments. You will be visible in local search results only.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(12, 18, 12, 22),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_circle_outline_sharp),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Across India"),
                                    ],
                                  ),
                                  // TextFormField(
                                  //   keyboardType: TextInputType.text,
                                  //   decoration: InputDecoration(
                                  //     // border: OutlineInputBorder(gapPadding: 8),
                                  //     labelText: "Your apartment name",
                                  //     labelStyle: rubikRegular.copyWith(
                                  //         color: AppColors.TextColor),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Text(
                                  //     "This allow you to sell your items locally in your apartments. You will be visible in local search results only."),
                                ]),
                              ),
                            ],
                          ))
                      // Text('$activeStep' + "" + "good"),
                      ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     previousButton(),
                //     nextButton(),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Returns the next button.
  // Widget nextButton() {
  //   return FlatButton(
  //     color: Colors.red,
  //     onPressed: () {
  //       // Increment activeStep, when the next button is tapped. However, check for upper bound.
  //       if (activeStep < upperBound) {
  //         setState(() {
  //           activeStep++;
  //         });
  //       }
  //     },
  //     child: Row(
  //       children: [
  //         Text(
  //           'NEXT',
  //           style: TextStyle(
  //               fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Icon(
  //           Icons.keyboard_arrow_right,
  //           size: 25,
  //           color: Colors.white,
  //         )
  //       ],
  //     ),
  //   );
  // }

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
  // Widget header() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(5),
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(10),
  //           child: Center(
  //             child: Text(
  //               headerText(),
  //               style: TextStyle(
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 20,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Returns the header text based on the activeStep.
  // String headerText() {
  //   switch (activeStep) {
  //     case 1:
  //       return 'Area of Operation';

  //     case 2:
  //       return 'Delivery Settings';

  //     case 3:
  //       return 'About Your Shop';

  //     case 4:
  //       return 'Reviews';

  //     default:
  //       return 'Shop name & Address';
  //   }
  // }
}
