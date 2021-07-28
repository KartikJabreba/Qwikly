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
     
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 5, right: 0),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.BORDER_COLOR,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            hinText,
            style: sfMedium.copyWith(
                color: AppColors.LIGHT_GREY,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          Container(
           height: 25,
            child: DropdownButtonFormField(
              isExpanded: true,
              icon: Icon(
                Icons.chevron_right,
                color: AppColors.TEXTCOLOR,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,

              
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
          ),
        ],
      ),
    );
  }

  Widget textInputPanel(String hintext) {
    return Container(
      // margin: EdgeInsets.only(bottom: 6, top: 6),
      padding: EdgeInsets.only(left: 6, top: 6),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.BORDER_COLOR,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
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
              isDense: true,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget textButton(String text) {
    return Container(
      height: 50,
      width: 75,
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
      // margin: EdgeInsets.only(bottom: 6, top: 6),
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
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.HEADER_COOR,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SellScreen()),
                  );
                },
                icon: Icon(Icons.keyboard_arrow_left_outlined)),
            actions: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Help  ',
                  style: sfMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              )
            ]),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What will you sell?',
                  style: sfBold.copyWith(
                    color: AppColors.HEADTEXTCOLOR,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Tell us what you will be selling. Be specific and detailed orieted. Dont promise something which you can’t deliver.',
                  style: sfRegular.copyWith(
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
                SizedBox(
                  height: 10,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      images.length == 0
                          ? SizedBox()
                          : Container(
                              height: 60,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: images.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
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
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.CONTAINER_COLOR,
                              ),
                              borderRadius: BorderRadius.circular(6)),
                          height: 60,
                          width: 60,
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
                      Wrap(spacing: 6.0, runSpacing: 6.0, children: [
                        data.sizeTag == null
                            ? SizedBox(
                                height: 0,
                                width: 0,
                              )
                            : Chip(
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
                                label: Text('Size: ' + data.sizeTag),
                              ),
                        Chip(
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
                          label: Text('Color: ' + data.colot),
                        ),
                        Chip(
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
                          label: Text('Waist: ' + data.waist.toString()),
                        )
                      ]),
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
                        'Add tag for search',
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
                        children: List<Widget>.generate(data.attribute.length,
                            (int index) {
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
                  height: 30,
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
                  height: 20,
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
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
