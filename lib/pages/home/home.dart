import 'package:flutter/material.dart';
import 'package:newsapp/moudlus/category_widget.dart';
import 'package:newsapp/moudlus/news_details.dart';

import '../../moudlus/category_data.dart';
import '../../moudlus/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<CategoryData> categoryData = [
      CategoryData(
        image: "assets/images/ball.png",
        category: "Sports",
        categoryID: "Sports",
        backgroundColor: Colors.red,
      ),
      CategoryData(
        image: "assets/images/Politics.png",
        category: "Politics",
        categoryID: "Politics",
        backgroundColor: Color(0xff003e8f),
      ),

      CategoryData(
        image: "assets/images/health.png",
        category: "Health",
        categoryID: "Health",
        backgroundColor: Colors.pinkAccent,
      ),

      CategoryData(
        image: "assets/images/bussines.png",
        category: "Bussines",
        categoryID: "bussines",
        backgroundColor: Colors.brown,
      ),
      CategoryData(
        image: "assets/images/environment.png",
        category: "Environment",
        categoryID: "Environment",
        backgroundColor: Colors.blue,
      ),

      CategoryData(
        image: "assets/images/science.png",
        category: "Science",
        categoryID: "Science",
        backgroundColor: Colors.orangeAccent,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 32,
        ), // ✅ كل أيقونات AppBar تبقى أصفر
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        ),

        /* leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white, size: 30),
          ),
        ),*/
        title: Text(
          selectedCategory == null ? "News App" : selectedCategory!.categoryID,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),

      drawer: Drawer(child: DrawerWidget()),
      body: selectedCategory == null
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Text(
                      "Pick your category\n  of interest",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Color(0xff4F5A69),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Expanded(
                    child: GridView.builder(
                      itemCount: categoryData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 6,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: CategoryWidget(
                            categoryData:
                                categoryData[index], // 👈 هنا مرر الكائن كله
                            categoryDataIndex: index,
                            onSelectedCategory:
                                onSelectedCategory, // 👈 الدالة مباشرة
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : NewsDetails(categoryData: selectedCategory!),
    );
  }

  CategoryData? selectedCategory;

  void onSelectedCategory(CategoryData categoryData) {
    setState(() {
      selectedCategory = categoryData;
      print("hello");
    });
  }
}
