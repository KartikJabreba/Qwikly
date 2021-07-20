import 'package:flutter/material.dart';
import 'package:qwikly/utils/appColors.dart';
import 'package:qwikly/utils/styles.dart';

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 15, 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              size: 30,
                            )),
                        Text(
                          "Verify Your Number",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                  ]),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(gapPadding: 8),
                  labelText: "Enter OTP recieved on phone",
                  labelStyle: rubikRegular.copyWith(color: AppColors.TextColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter the code we have sent by SMS to 9870897656",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  text: 'Resend OTP in ',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: '10',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
