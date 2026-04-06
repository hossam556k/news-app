import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/api_manager.dart';
import 'package:newsapp/pages/home/manager/state.dart';

import '../../../moudlus/source_data.dart';

class SourcesCubit extends Cubit<SourcesStates> {
  // طريقة سهلة للوصول للCubit من الcontext
  static SourcesCubit get(context) => BlocProvider.of(context);

  SourcesCubit() : super(LoadingSourcesState());

  // قائمة المصادر المخزنة
  List<Sources> _sourcesList = [];
  List<Sources> get sourcesList => _sourcesList;

  // جلب المصادر حسب الفئة
  Future<void> getNewsSourcesList(String categoryID) async {
    emit(LoadingSourcesState()); // ✅ emit تحميل قبل البدء
    try {
      _sourcesList = await ApiManager.fetchSourceList(categoryID);
      emit(SuccessSourcesState());
    } catch (error) {
      emit(ErrorSourcesState()); // 🔹 لو حبيت تضيف رسالة الخطأ
    }
  }
}
