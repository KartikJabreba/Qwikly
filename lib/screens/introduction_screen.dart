import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:qwikly/utils/appColors.dart';
import 'package:qwikly/utils/appImages.dart';
import 'package:qwikly/utils/styles.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      AppImages.AppIntro,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  void _showModalSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        context: context,
        builder: (builder) {
          return new Container(
            height: 460.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 15, 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Login or Signup",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close_rounded),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding: 8),
                        labelText: "Registered Phone No.",
                        labelStyle:
                            rubikRegular.copyWith(color: AppColors.TextColor),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We will call or text you to confirm your number.",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Standard message and data rates apply.",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: 400,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Continue',
                              style: rubikBold.copyWith(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                      Text("or"),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        width: 400,
                        height: 45,
                        child: FlatButton(
                          onPressed: () {},
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.facebook_rounded,
                                  size: 25,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  'Continue with Facebook',
                                  style: rubikBold.copyWith(
                                      color: Colors.blueAccent),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        width: 400,
                        height: 45,
                        child: FlatButton(
                          onPressed: () {},
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.g_translate_rounded,
                                  size: 25,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  'Continue with Google',
                                  style: rubikBold.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalFooter: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 30),
        child: SizedBox(
          height: 40,
          width: 350,
          child: ElevatedButton(
            onPressed: _showModalSheet,
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            child: Text(
              "Get in Qwikly",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Start Your Business with Qwikly",
          body: "",
          image: _buildFullscrenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            titleTextStyle: TextStyle(color: Colors.white),
            titlePadding: EdgeInsets.fromLTRB(10, 190, 10, 10),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "Start Your Business with Qwikly",
          body: "",
          image: _buildFullscrenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            titleTextStyle: TextStyle(color: Colors.white),
            titlePadding: EdgeInsets.fromLTRB(10, 140, 10, 10),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "Start Your Business with Qwikly",
          body: "",
          image: _buildFullscrenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            titleTextStyle: TextStyle(color: Colors.white),
            titlePadding: EdgeInsets.fromLTRB(10, 140, 10, 10),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
      ],
      dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.black,
          activeSize: Size(22.0, 10.0),
          activeShape: CircleBorder(),
          activeColor: Color(0xFFBDBDBD)),
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      done: const Text(''),
      skip: const Text(''),
      next: const Text(''),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 10),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
