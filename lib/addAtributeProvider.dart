import 'package:flutter/cupertino.dart';

class AttributesProvider extends ChangeNotifier {
  List<String> _attributes = ['Jeans', 'Fashion', 'Fabric'];
  String? _sizeTag;
  String? _colors = 'Blue';
  int? _waist = 34;

  List<String> get attribute => _attributes;
  get sizeTag => _sizeTag;
  get colot => _colors;
  get waist => _waist;

  void addAttribute(String attribute) {
    _attributes.add(attribute);
    notifyListeners();
  }

  void addSize(String size) {
    _sizeTag = size;
    notifyListeners();
  }
}
