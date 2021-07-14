import 'package:flutter/material.dart';
import 'package:qwikly/utils/appColors.dart';
import 'package:qwikly/utils/styles.dart';

class TextInput extends StatelessWidget {
  String lable;
  TextEditingController textEditingController;

  TextInput({required this.lable, required this.textEditingController});
  //const TextInput({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Card(
        shape: OutlineInputBorder(),
        elevation: 9,

*/
    //child: TextFormField(
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter $lable";
        } else
          return null;
      },
      // controller: textEditingController,
      onChanged: (value) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        //border: InputBorder.none,

        labelText: lable,
        labelStyle: rubikRegular.copyWith(color: AppColors.TextColor),
      ),
    );

    //);
  }
}
