import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/modules/home/manager/home_connector.dart';
import '../../../apis/API_Manager.dart';
import '../../../models/category_data_model.dart';

class HomeViewModel extends ChangeNotifier {
  HomeConnector? connector;
  CategoryData? categoryData;
  int selectedTab = 0;
  List<Sources> sources = [];
  List<Articles> articles = [];

  onCategoryTap(cat) {
    categoryData = cat;
    notifyListeners();
  }

  getSources() async {
    connector!.showLoading();
    var data = await ApiManager.getSources(categoryData?.id ?? "");
    sources = data.sources ?? [];
    await getNews();
    connector!.hideLoading();
    notifyListeners();
  }

  getNews() async {
    connector!.showLoading();
    var data = await ApiManager.getNews(sources[selectedTab].id ?? "");
    articles = data.articles ?? [];
    connector!.hideLoading();
    notifyListeners();
  }

  onTabClick(value) {
    selectedTab = value;
    getNews();
    notifyListeners();
  }
}
