import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/apis/API_Manager.dart';
import 'package:news_app/models/news_model.dart';

import '../../../models/source_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  // List<Articles> list;
  // CustomSearchDelegate({required this.list});
  List<String> ids = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Enter a search term'),
      );
    }
    return FutureBuilder(
      future: ApiManager.getSearched(query),
      builder: (context, snapshot) {
        List<Articles> articles = snapshot.data?.articles ?? [];
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.articles?.length,
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
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
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
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

// return FutureBuilder(
//       future: ApiManager.getSources(ids[Random().nextInt(7)]),
//       builder: (context, snapshot) {
//         List<Articles> articles = snapshot.data?.articles ?? [];
//         if (snapshot.hasData) {
//           return Expanded(
//             child: ListView.builder(
//               itemCount: snapshot.data?.articles?.length ,
//               itemBuilder: (context, index) {
//                 var article = articles[index];
//                 return Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: CachedNetworkImage(
//                               imageUrl: article.urlToImage ?? "",
//                               height: 180,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                               placeholder: (context, url) => const Center(
//                                   child:  CircularProgressIndicator()),
//                               errorWidget: (context, url, error) =>
//                               const Center(child: Icon(Icons.error)),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           Text(article.source?.name ?? ""),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           Text(article.title ?? ""),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text(article.publishedAt
//                                   ?.substring(0, 10) ??
//                                   ""),
//                             ],
//                           ),
//                         ]),
//                   ),
//                 );
//               },
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('Error: ${snapshot.error}'),
//           );
//         }
//
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     )
////////////////////////////////
// ListView.builder(
// return Center(
//       child: Text(
//         'Search suggestions for "$query "',
//       ),
//     ) ;
//       itemCount: list.length,
//       itemBuilder: (context, index) {
//         var article = list[index];
//         return Card(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   // image
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: CachedNetworkImage(
//                       imageUrl: article.urlToImage ?? "",
//                       height: 180,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => const  Center(
//                           child: CircularProgressIndicator()),
//                       errorWidget: (context, url, error) =>
//                           const Center(child: Icon(Icons.error)),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   // source name
//                   Text(article.source?.name ?? ""),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   // Title
//                   Text(article.title ?? ""),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   // time
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(article.publishedAt
//                           ?.substring(0, 10) ??
//                           ""),
//                     ],
//                   ),
//                 ]),
//           ),
//         );
//       },
//     )
