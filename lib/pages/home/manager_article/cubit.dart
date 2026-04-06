import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/api_manager.dart';
import 'package:newsapp/pages/home/manager_article/state.dart';

import '../../../moudlus/articles_data.dart';

class ArticlesCubit extends Cubit<ArticlesStates> {
  // طريقة سهلة للوصول للCubit من الcontext
  static ArticlesCubit get(context) => BlocProvider.of(context);

  ArticlesCubit() : super(LoadingArticlesState());

  // قائمة المقالات المخزنة
  List<Article> _articlesList = [];
  List<Article> get articlesList => _articlesList;

  // جلب المقالات حسب الـ source ID
  Future<void> getNewsArticlesList(String sourcesId) async {
    emit(LoadingArticlesState()); // ✅ emit تحميل قبل البدء
    try {
      _articlesList = await ApiManager.fetchArticleList(sourcesId);
      emit(SuccessArticlesState());
    } catch (error) {
      emit(ErrorArticlesState()); // 🔹 لو حبيت تضيف رسالة الخطأ
    }
  }
}
