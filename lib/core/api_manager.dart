import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:newsapp/core/api_constant.dart';
import 'package:newsapp/moudlus/articles_data.dart';
import 'package:newsapp/moudlus/source_data.dart';

class ApiManager {
  // جلب قائمة المصادر حسب الفئة
  static Future<List<Sources>> fetchSourceList(String categoryID) async {
    var url = Uri.https(ApiConstant.domain, "v2/top-headlines/sources", {
      "apiKey": ApiConstant.apiKey,
      "category": categoryID,
    });

    final response = await https.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      SourceModel sourceModel = SourceModel.fromJson(data);
      return sourceModel.sources;
    } else {
      throw Exception('Failed to load sources');
    }
  }

  // جلب قائمة المقالات حسب الـ source ID
  static Future<List<Article>> fetchArticleList(String sourcesId) async {
    var url = Uri.https(ApiConstant.domain, "v2/top-headlines", {
      "apiKey": ApiConstant.apiKey,
      "sources": sourcesId,
    });

    final response = await https.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      ArticleModel articleModel = ArticleModel.fromJson(data);
      return articleModel.articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
