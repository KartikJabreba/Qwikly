import 'package:flutter/cupertino.dart';

class AttributesProvider extends ChangeNotifier {
  List<String> _attributes = ['Jeans', 'Fashion', 'Fabric'];

  List<String> get attribute => _attributes;

  void addAttribute(String attribute) {
    _attributes.add(attribute);
    notifyListeners();
  }
}
