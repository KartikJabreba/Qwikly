import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwikly/screens/sellScreen.dart';
import 'package:qwikly/utils/appColors.dart';
import 'package:qwikly/utils/styles.dart';

import '../addAtributeProvider.dart';

class AddAttributes extends StatefulWidget {
  @override
  _AddAttributesState createState() => _AddAttributesState();
}

class _AddAttributesState extends State<AddAttributes> {
  int weight = 100;
  bool value = false;
  int val = -1;
  TextEditingController _addNewAttribute = TextEditingController();
  List<String> _categories = [
    'A',
    'B',
    'C',
    'D',
  ];
  List<String> _size = [
    'S',
    'M',
    'L',
    'XL',
  ];
  List<String> _tags = ['Jeans', 'Fashion'];
  String? _selectedLocation;

  Widget dropDownItems(
      String hinText, List<String> _listData, AttributesProvider data) {
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
          Container(
            height: 25,
            child: DropdownButtonFormField<String>(
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
              onChanged: (newValue) {
                data.addSize(newValue!);
              },
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

  Widget weightInput(String weightText) {
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
            weightText,
            style: sfMedium.copyWith(
                color: AppColors.LIGHT_GREY,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                '$weight g',
                style: sfMedium.copyWith(
                    color: AppColors.TEXTCOLOR,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      weight = weight + 100;
                    });
                  },
                  icon: Icon(Icons.add_circle_outline)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      weight = weight - 100;
                    });
                  },
                  icon: Icon(Icons.remove_circle_outline))
            ],
          )
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
        appBar: AppBar(
            title: Text(
              'Add Attributes',
              style: sfMedium.copyWith(
                color: Colors.white,
              ),
            ),
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
                child:IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              )
            ]),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
              
                dropDownItems('Stock Status', _categories, data),
                SizedBox(
                  height: 10,
                ),
                dropDownItems('Size', _size, data),
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
                          "Refundable",
                          style: sfMedium.copyWith(
                              color: AppColors.TEXTCOLOR,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        listTile('No'),
                        listTile('Yes'),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                weightInput('Weight'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.BORDER_COLOR,
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Text(
                          'Tags',
                          style: sfMedium.copyWith(
                              color: AppColors.LIGHT_GREY,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Wrap(
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
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.BORDER_COLOR,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: TextFormField(
                          controller: _addNewAttribute,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  data.addAttribute(_addNewAttribute.text);
                                },
                                icon: Icon(Icons.add_circle_outline)),
                            hintText: 'Add New',
                            hintStyle: sfMedium.copyWith(
                                color: AppColors.LIGHT_GREY,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                          ),
                        ),
                        // child: Container(
                        //   height: 20,
                        //   // child: ListTile(
                        //   //   title: TextFormField(
                        //   //     controller: _addNewAttribute,
                        //   //     decoration: InputDecoration(
                        //   //       hintText: 'Add New',
                        //   //       hintStyle: sfMedium.copyWith(
                        //   //           color: AppColors.LIGHT_GREY,
                        //   //           fontSize: 14,
                        //   //           fontWeight: FontWeight.bold),
                        //   //       border: InputBorder.none,
                        //   //     ),
                        //   //   ),
                        //   trailing: IconButton(
                        //       onPressed: () {
                        //         data.addAttribute(_addNewAttribute.text);
                        //       },
                        //       icon: Icon(Icons.add_circle_outline)),
                        // ),
                        // ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Add New Attributes"),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Attributes Name",
                              style: sfMedium.copyWith(
                                  color: AppColors.LIGHT_GREY,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Title"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 1,
                        height: 36,
                        color: AppColors.BORDER_COLOR,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Value",
                              style: sfMedium.copyWith(
                                  color: AppColors.LIGHT_GREY,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Add")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Row listTile(String labelText) {
    return Row(children: [
      Radio(
        value: 1,
        groupValue: val,
        onChanged: (value) {
          setState(() {
            //val = value;
            print(val);
          });
        },
        activeColor: Colors.green,
        toggleable: true,
      ),
      Text(labelText),
    ]);
  }

  Widget tagContainerWidget(String tagName) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.HEADTEXTCOLOR,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
                color: Colors.white,
              )),
          Text(
            tagName,
            style: sfMedium.copyWith(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
