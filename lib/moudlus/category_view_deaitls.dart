import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/moudlus/article_item.dart';
import 'package:newsapp/moudlus/source_data.dart';
import 'package:newsapp/moudlus/tab_item.dart';
import 'package:newsapp/pages/home/manager_article/cubit.dart';
import 'package:newsapp/pages/home/viewModel/article_view_model.dart';

import '../pages/home/manager_article/state.dart';
import 'article_item_details.dart';

class CategoryViewDeaitls extends StatefulWidget {
  final List<Sources> sourceList;

  const CategoryViewDeaitls({super.key, required this.sourceList});

  @override
  State<CategoryViewDeaitls> createState() => _CategoryViewDeaitlsState();
}

class _CategoryViewDeaitlsState extends State<CategoryViewDeaitls> {
  late ArticleViewModel _articleViewModel;
  late ArticlesCubit _articleCubit;
  int selectedIndex = 0; // التاب المختار

  @override
  void initState() {
    //_articleViewModel = ArticleViewModel();
    _articleCubit = ArticlesCubit();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sourceList.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                _articleCubit.getNewsArticlesList(
                  widget.sourceList[selectedIndex].id,
                );
              });
            },
            tabs: widget.sourceList.asMap().entries.map((entry) {
              int index = entry.key;
              Sources source = entry.value;
              return Tab(
                child: TabItem(
                  source: source,
                  isSelected: selectedIndex == index,
                ),
              );
            }).toList(),
          ),

          Expanded(
            child: BlocProvider(
              create: (context) =>
                  _articleCubit
                    ..getNewsArticlesList(widget.sourceList[selectedIndex].id),
              child: BlocConsumer<ArticlesCubit, ArticlesStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = ArticlesCubit.get(context);

                  if (cubit.articlesList.isEmpty) {
                    return const Center(child: Text("No articles found"));
                  }

                  return ListView.builder(
                    itemCount: cubit.articlesList.length,
                    itemBuilder: (context, index) {
                      final article = cubit.articlesList[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ArticleDetailsPage(
                                title: article.title ?? "No Title",
                                image: article.urlToImage ?? "",
                                description: article.description ?? "",
                                source: widget.sourceList[selectedIndex].name,
                                date: article.publishedAt ?? "",
                              ),
                            ),
                          );
                        },
                        child: ArticleItem(
                          titleArticle: article.title ?? "null",
                          imageArticle: article.urlToImage ?? "error",
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*ChangeNotifierProvider(create: (context) =>
        _articleViewModel
          ..getArticleList(widget.sourceList[selectedIndex].id),
          child: Consumer<ArticleViewModel>(builder: (context, vm, _) {
            return Expanded(child: ListView.builder(
              itemCount: vm.articlesList.length, itemBuilder: (context, index) {
              final article = vm.articlesList[index];

              return InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ArticleDetailsPage(
                      title: article.title ?? "No Title",
                      image: article.urlToImage ?? "",
                      description: article.description ?? "No Description",
                      source: widget.sourceList[selectedIndex].name,
                      // أو article.source.name لو متوفر
                      date: article.publishedAt ?? "",),),);
              },

                child: ArticleItem(titleArticle: article.title ?? "null",
                  imageArticle: article.urlToImage ?? "erorr",),);
            },),);
          },),), /* FutureBuilder<List<Article>>(
            future: ApiManager.fetchArticleList(
              widget.sourceList[selectedIndex].id,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorPalette.primaryColor,
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              List<Article> articlesList = snapshot.data ?? [];


            },
          ),*/
      ],),);
  }
*/
