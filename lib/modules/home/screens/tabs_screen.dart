import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/home/manager/home_view_model.dart';

class TabsScreen extends StatefulWidget {
  final HomeViewModel viewModel;

  const TabsScreen({required this.viewModel, super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.viewModel.getSources();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.viewModel.sources.length,
            child: TabBar(
                onTap: widget.viewModel.onTabClick,
                labelPadding: const EdgeInsets.all(1),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.viewModel.sources.map((e) {
                  return Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: widget.viewModel.selectedTab ==
                                    widget.viewModel.sources.indexOf(e)
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
                                color: widget.viewModel.selectedTab !=
                                        widget.viewModel.sources.indexOf(e)
                                    ? Colors.green
                                    : Colors.white),
                          )),
                        ),
                      ),
                    ),
                  );
                }).toList())),
        if (widget.viewModel.sources.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: widget.viewModel.articles.length,
              itemBuilder: (context, index) {
                var article = widget.viewModel.articles[index];
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
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.green,
                              )),
                              errorWidget: (context, url, error) =>
                                  const Center(child: Icon(Icons.error)),
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
                              Text(article.publishedAt?.substring(0, 10) ?? ""),
                            ],
                          ),
                        ]),
                  ),
                );
              },
            ),
          )
      ],
    );
  }
}
