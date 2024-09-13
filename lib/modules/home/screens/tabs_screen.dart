import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/apis/API_Manager.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/source_model.dart';

class TabsScreen extends StatefulWidget {
  final String id;

  const TabsScreen({required this.id, super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.id),
      builder: (context, snapshot) {
        List<Sources> sources = snapshot.data?.sources ?? [];
        return Column(
          children: [
            DefaultTabController(
                length: sources.length,
                child: TabBar(
                    onTap: (value) {
                      selectedTab = value;
                      setState(() {});
                    },
                    labelPadding: EdgeInsets.all(1),
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    tabs: sources.map((e) {
                      return Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectedTab == sources.indexOf(e)
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                e.name ?? "",
                                style: TextStyle(
                                    color: selectedTab != sources.indexOf(e)
                                        ? Colors.green
                                        : Colors.white),
                              )),
                            ),
                          ),
                        ),
                      );
                    }).toList())),
            if (sources.isNotEmpty)
              FutureBuilder(
                future: ApiManager.getNews(sources[selectedTab].id ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("error has occur");
                  } else {
                    List<Articles> articles = snapshot.data?.articles ?? [];
                    return Expanded(
                      child: ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          var article = articles[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: article.urlToImage ?? "",
                                        height: 180,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Center(child: Icon(Icons.error)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(article.source?.name ?? ""),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(article.title ?? ""),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(article.publishedAt
                                                ?.substring(0, 10) ??
                                            ""),
                                      ],
                                    ),
                                  ]),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
          ],
        );
      },
    );
  }
}
