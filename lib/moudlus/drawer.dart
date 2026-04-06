import 'package:flutter/material.dart';
import 'package:newsapp/core/color-pattles.dart';
import 'package:newsapp/core/page_route_name.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    var theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: mediaquery.size.height * 0.18,
            width: double.infinity,

            decoration: BoxDecoration(color: ColorPalette.primaryColor),
            child: Center(
              child: Text(
                "News App!",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          Row(
            children: [
              SizedBox(width: 10),

              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, PageRouteNames.home);
                },
                child: Icon(Icons.menu_open_rounded, size: 40),
              ),
              SizedBox(width: 10),

              Text("Categories", style: theme.textTheme.titleMedium),
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: [
              SizedBox(width: 10),

              Icon(Icons.settings, size: 40),
              SizedBox(width: 10),
              Text("Settings", style: theme.textTheme.titleMedium),
            ],
          ),
        ],
      ),
    );
  }
}
