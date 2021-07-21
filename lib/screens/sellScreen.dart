import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qwikly/utils/appColors.dart';
import 'package:qwikly/utils/styles.dart';

import '../addAtributeProvider.dart';
import 'addAtributes.dart';

class SellScreen extends StatefulWidget {
 

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  List<String> _categories = ['A', 'B', 'C', 'D']; // Option 2
  String? _selectedLocation;
  List<XFile> images = [];
  final ImagePicker _imagePicker = ImagePicker();
  List<String> attributes = [];

  Future pickImage() async {
    await _imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      print(value!.path.toString());
      setState(() {
        images.add(value);
      });
    });
  }

  Widget dropDownItems(String hinText, List<String> _listData) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.BORDER_COLOR,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hinText,
            style: sfMedium.copyWith(
                color: AppColors.LIGHT_GREY,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          DropdownButtonFormField(
            icon: Icon(
              Icons.chevron_right,
              color: AppColors.TEXTCOLOR,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,

              // labelText: hinText,
              // labelStyle: sfMedium.copyWith(
              //     color: AppColors.LIGHT_GREY,
              //     fontSize: 12,
              //     fontWeight: FontWeight.bold),
              hintText: 'Choose',
              hintStyle: sfMedium.copyWith(
                color: AppColors.TEXTCOLOR,
              ),
            ),
            value: _selectedLocation,
            onChanged: (newValue) {},
            items: _listData.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget textInputPanel(String hintext) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.BORDER_COLOR,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintext,
            style: sfMedium.copyWith(
                color: AppColors.LIGHT_GREY,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget textButton(String text) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.RED, borderRadius: BorderRadius.circular(6)),
      child: Center(
          child: Text(
        text,
        style: sfMedium.copyWith(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
      )),
    );
  }

  Widget addAttributeWidget(String hintext) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.BORDER_COLOR,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintext,
            style: sfMedium.copyWith(
                color: AppColors.LIGHT_GREY,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   
    return Consumer<AttributesProvider>(builder: (context, data, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Help',
                      style: sfMedium.copyWith(
                        color: AppColors.TEXTCOLOR,
                      ),
                    )),
                Text(
                  'What will you sell?',
                  style: sfBold.copyWith(
                    color: AppColors.HEADTEXTCOLOR,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Tell us what you will be selling. Be specific and detailed orieted. Dont promise something which you can’t deliver.',
                  style: sfMedium.copyWith(
                    color: AppColors.TEXTCOLOR,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // ListView.builder(
                //   itemBuilder:(context,index){
                //   return
                // })
                Text(
                  'Add Photos/Videos',
                  style: sfMedium.copyWith(
                      color: AppColors.LIGHT_GREY,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      images.length == 0
                          ? SizedBox()
                          : Container(
                              height: 90,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: images.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.file(
                                        File(images[index].path),
                                      ),
                                    );
                                  }),
                            ),
                      GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          height: 60,
                          width: 60,
                          color: AppColors.CONTAINER_COLOR,
                          child: Icon(
                            Icons.add,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                        child: dropDownItems('Item Category', _categories)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: dropDownItems('Type', _categories)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                textInputPanel('Your Item Name'),
                SizedBox(
                  height: 10,
                ),
                textInputPanel('Describe your item. be specific!'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.BORDER_COLOR,
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Attributes',
                        style: sfMedium.copyWith(
                            color: AppColors.LIGHT_GREY,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        child: Text(
                          '+ Add New',
                          style: sfMedium.copyWith(
                            color: AppColors.TEXTCOLOR,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAttributes()),
                          );
                        },
                      ),
                      Divider(),
                      Wrap(
                        spacing: 6.0,
                        runSpacing: 6.0,
                        children: List<Widget>.generate(
                            data.attribute .length, (int index) {
                          return Chip(
                            avatar: Icon(Icons.clear, color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            )),
                            side: BorderSide(),
                            backgroundColor: Colors.black,
                            labelStyle: sfMedium.copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                            label: Text(data.attribute[index]),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      child: textInputPanel('Price (Indian Rs.)'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: textInputPanel('Discount'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                dropDownItems('Area of Operation', _categories),
                SizedBox(
                  height: 10,
                ),
                dropDownItems('Delivery details', _categories),
                SizedBox(
                  height: 10,
                ),
                dropDownItems('Offers', _categories),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Add another varient',
                    style: sfMedium.copyWith(
                        color: AppColors.RED,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Text(
                  'If this product has another variant such as Colour or size, you can easily update the fields with different details.',
                  style: sfMedium.copyWith(
                      color: AppColors.LIGHT_GREY,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(child: textButton('Save')),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: textButton('Save & New')),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
