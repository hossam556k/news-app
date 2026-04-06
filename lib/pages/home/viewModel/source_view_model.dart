import 'package:flutter/cupertino.dart';
import 'package:newsapp/core/api_manager.dart';
import 'package:newsapp/moudlus/source_data.dart';

class SourceViewModel extends ChangeNotifier {
  List<Sources> _sourcesList = [];

  List<Sources> get sourcesList => _sourcesList;
  Future<void> getSourcesList(String categoryID) async {
    _sourcesList = await ApiManager.fetchSourceList(categoryID);
    notifyListeners();
  }
}
