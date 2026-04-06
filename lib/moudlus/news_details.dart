import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/api_manager.dart';
import 'package:newsapp/moudlus/category_data.dart';
import 'package:newsapp/moudlus/category_view_deaitls.dart';
import 'package:newsapp/moudlus/source_data.dart';
import 'package:newsapp/pages/home/manager/cubit.dart';
import 'package:newsapp/pages/home/manager/state.dart';

import '../core/color-pattles.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails({super.key, required this.categoryData});

  CategoryData categoryData;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SourcesCubit()..getNewsSourcesList(widget.categoryData.categoryID),
      child: BlocConsumer<SourcesCubit, SourcesStates>(
        builder: (context, state) {
          var cubit = SourcesCubit.get(context);

          if (cubit.sourcesList.isEmpty) {
            return const Scaffold(
              body: Center(child: Text("No sources found")),
            );
          }

          return CategoryViewDeaitls(sourceList: cubit.sourcesList);
        },
        listener: (context, state) {},
      ),
    );

    /* return ChangeNotifierProvider(
      create: (context) =>
          SourceViewModel()..getSourcesList(widget.categoryData.categoryID),
      child: Consumer<SourceViewModel>(
        builder: (context, vm, _) {
          if (vm.sourcesList.isEmpty) {
            return Text("Loading Data...");
          }
          return CategoryViewDeaitls(sourceList: vm.sourcesList);
        },
      ),
    );*/
    return FutureBuilder<List<Sources>>(
      future: ApiManager.fetchSourceList(widget.categoryData.categoryID),
      // هنا صح
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: ColorPalette.primaryColor),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        List<Sources> sourceList = snapshot.data ?? [];

        return CategoryViewDeaitls(sourceList: sourceList);
      },
    );
  }
}
