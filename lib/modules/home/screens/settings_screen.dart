import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/BgWidget.dart';
import 'package:news_app/modules/home/screens/search_delegate.dart';

import 'home_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String routeName = "settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late String selectedLang = "English";
  List<String> langs = ["English", "Arabic"];

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "Settings",
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
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
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
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
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
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Language",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButton(
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 30,
                          isExpanded: true,
                          hint: Text(
                            selectedLang,
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                          items: langs
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLang = value.toString();
                            });
                          }),
                    ),
                  ))
            ])));
  }
}
