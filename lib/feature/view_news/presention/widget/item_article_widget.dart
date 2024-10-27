import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/ResponseNews.dart';
import '../screen/details_screen.dart';

class ItemArticleWidget extends StatelessWidget {
  Articles articles;

  ItemArticleWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    print("ItemArticleWidget".toLowerCase());
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.nameRoute,arguments: articles);
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: articles.urlToImage ?? "",
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                articles.title ?? "",
                style: const TextStyle(color: Colors.black87, fontSize: 18),
                maxLines: 1,
              ),
              const SizedBox(height: 8),
              Text(
                maxLines: 2,
                articles.content ?? "",
                style: const TextStyle(color: Colors.black45, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                maxLines: 2,
                articles.author ?? "",
                style: const TextStyle(color: Colors.black45, fontSize: 12),
              ),
              Text(
                textAlign: TextAlign.end,
                maxLines: 2,
                articles.publishedAt?.substring(0, 10) ?? "",
                style: const TextStyle(color: Colors.black26, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
