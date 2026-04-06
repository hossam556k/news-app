import 'package:flutter/widgets.dart';
import 'package:newsapp/moudlus/articles_data.dart';

import '../../../core/api_manager.dart';

class ArticleViewModel extends ChangeNotifier {
  List<Article> _articlesList = [];
  List<Article> get articlesList => _articlesList;
  Future<void> getArticleList(String sourcesId) async {
    _articlesList = await ApiManager.fetchArticleList(sourcesId);
    notifyListeners();
  }
}
