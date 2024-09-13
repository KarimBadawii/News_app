import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/BgWidget.dart';
import 'package:news_app/models/category_data_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/modules/home/screens/category_screen.dart';
import 'package:news_app/modules/home/screens/search_delegate.dart';
import 'package:news_app/modules/home/screens/settings_screen.dart';
import 'package:news_app/modules/home/screens/tabs_screen.dart';
import 'package:news_app/modules/home/widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    NewsModel? newsModel;
    return BgWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "News App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 30,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
            backgroundColor: Colors.green,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            )),
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Center(
                      child: Text(
                    "News App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ))),
              ListTile(
                onTap: () {
                  categoryData = null;
                  setState(() {});
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.menu,
                  size: 35,
                  color: Colors.green,
                ),
                title: const Text(
                  "Categories",
                  style: TextStyle(fontSize: 25),
                ),
                splashColor: Colors.transparent,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
                leading: const Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.green,
                ),
                title: const Text(
                  "Settings",
                  style: TextStyle(fontSize: 25),
                ),
                splashColor: Colors.transparent,
              ),
            ],
          ),
        ),
        body: categoryData == null
            ? CategoryScreen(onTap: onCategoryTap)
            : TabsScreen(id: categoryData!.id),
      ),
    );
  }

  CategoryData? categoryData;

  onCategoryTap(cat) {
    categoryData = cat;
    setState(() {});
  }
}
