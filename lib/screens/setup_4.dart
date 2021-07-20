// import 'package:flutter/material.dart';
// import 'package:html_editor/html_editor.dart';

// class Setup4 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Add Notes'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   GlobalKey<HtmlEditorState> keyEditor = GlobalKey();
//   String result = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(widget.title),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//         elevation: 0,
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 15),
//                   child: Row(
//                     children: [
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Title',
//                           labelStyle: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               HtmlEditor(
//                 showBottomToolbar: false,
//                 useBottomSheet: false,
//                 hint: "Your text here...",
//                 key: keyEditor,
//                 height: 400,
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 8, 8, 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     FlatButton(
//                       color: Colors.blue,
//                       onPressed: () async {
//                         final txt = await keyEditor.currentState!.getText();
//                         setState(() {
//                           result = txt;
//                         });
//                       },
//                       child: Text(
//                         "Submit",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Flexible(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         RichText(
//                           textAlign: TextAlign.end,
//                           text: TextSpan(
//                             text: 'last modified at: ',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.w400),
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: '2021-06-24 10:34:21',
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ],
//                           ),
//                         ),
//                         RichText(
//                           textAlign: TextAlign.end,
//                           text: TextSpan(
//                             text: 'last created at: ',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.w400),
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: '2021-06-24 10:34:21',
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

//void main() => runApp(MyApp());

class MyAppp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'About your shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 30,
            )),
        centerTitle: true,
        title: Text(widget.title),
        elevation: 0,
        // actions: [
        //   IconButton(
        //       icon: Icon(Icons.refresh),
        //       onPressed: () {
        //         if (kIsWeb) {
        //           controller.reloadWeb();
        //         } else {
        //           controller.editorController!.reload();
        //         }
        //       })
        // ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Text("\<\\\>",
      //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      //   onPressed: () {
      //     controller.toggleCodeView();
      //   },
      // ),
      bottomSheet: Container(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        fit: FlexFit.loose,
                        child: FractionallySizedBox(
                          widthFactor: 1.0,
                          child: RaisedButton(
                            color: Colors.red,
                            padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
                            onPressed: () async {
                              String? txt = await controller.getText();
                              // if (txt!.contains("<img src=\"data:image>")) {
                              //   txt =
                              //       "<text removed due to base-64 image data, displaying the text could cause the app to crash>";
                              // }
                              setState(() {
                                // result = txt!;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              child: Text(
                                "ADD",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                            //  color: Theme.of(context).colorScheme.secondary,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HtmlEditor(
              options: HtmlEditorOptions(
                darkMode: false,
                showBottomToolbar: false,
              ),
              controller: controller,
              hint: "Your text here...",
              //value: "text content initial, if any",
              //height: 400,
              callbacks: Callbacks(
                // onChange: (String changed) {
                //   print("content changed to $changed");
                // },
                onEnter: () {
                  print("enter/return pressed");
                },
                onFocus: () {
                  print("editor focused");
                },
                onBlur: () {
                  print("editor unfocused");
                },
                onBlurCodeview: () {
                  print("codeview either focused or unfocused");
                },
                onKeyDown: (keyCode) {
                  print("$keyCode key downed");
                },
                onKeyUp: (keyCode) {
                  print("$keyCode key released");
                },
                onPaste: () {
                  print("pasted into editor");
                },
              ),
              plugins: [
                // SummernoteEmoji(),
                // AdditionalTextTags(),
                // SummernoteClasses(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // TextButton(
                  //   style:
                  //       TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                  //   onPressed: () {
                  //     controller.undo();
                  //   },
                  //   child: Text("Undo", style: TextStyle(color: Colors.white)),
                  // ),
                  SizedBox(
                    width: 16,
                  ),
                  // TextButton(
                  //   style:
                  //       TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                  //   onPressed: () {
                  //     controller.clear();
                  //   },
                  //   child: Text("Reset", style: TextStyle(color: Colors.white)),
                  // ),
                  SizedBox(
                    width: 16,
                  ),
                  // TextButton(
                  //   style: TextButton.styleFrom(
                  //       backgroundColor: Theme.of(context).accentColor),
                  //   onPressed: () async {
                  //     String? txt = await controller.getText();
                  //     if (txt!.contains("<img src=\"data:image")) {
                  //       txt =
                  //           "<text removed due to base-64 image data, displaying the text could cause the app to crash>";
                  //     }
                  //     setState(() {
                  //       result = txt!;
                  //     });
                  //   },
                  //   child: Text(
                  //     "Submit",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 16,
                  // ),
                  // TextButton(
                  //   style: TextButton.styleFrom(
                  //       backgroundColor: Theme.of(context).accentColor),
                  //   onPressed: () {
                  //     controller.redo();
                  //   },
                  //   child: Text(
                  //     "Redo",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(result),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style:
            //             TextButton.styleFrom(backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.disable();
            //         },
            //         child:
            //             Text("Disable", style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).accentColor),
            //         onPressed: () async {
            //           controller.enable();
            //         },
            //         child: Text(
            //           "Enable",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).accentColor),
            //         onPressed: () {
            //           controller.insertText("Google");
            //         },
            //         child: Text("Insert Text",
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).accentColor),
            //         onPressed: () {
            //           controller.insertHtml(
            //               "<p style=\"color: blue \">Google in blue</p>");
            //         },
            //         child: Text("Insert HTML",
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).accentColor),
            //         onPressed: () async {
            //           controller.insertLink(
            //               "Google linked", "https://google.com", true);
            //         },
            //         child: Text(
            //           "Insert Link",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).accentColor),
            //         onPressed: () {
            //           controller.insertNetworkImage(
            //               "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png",
            //               filename: "Google network image");
            //         },
            //         child: Text(
            //           "Insert network image",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
          ],
        ),
      ),
      // ],
      // ),
      // ),
    );
  }
}
