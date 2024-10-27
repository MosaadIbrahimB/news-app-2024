import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2024/feature/view_news/data/model/ResponseNews.dart';
import 'package:news_app_2024/feature/view_news/presention/screen/web_view_screen.dart';
import 'package:news_app_2024/feature/view_news/presention/widget/shape_widget.dart';

class DetailsScreen extends StatelessWidget {
  static const nameRoute = "DetailsScreen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Articles articles;
    var article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        shape: ShapeWidget.getShapeBorderWidget(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          article.title ?? "",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ArticleDetailsWidget(
        article: article,
      ),
    );
  }
}

class ArticleDetailsWidget extends StatelessWidget {
  final Articles article;

  const ArticleDetailsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
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
                  imageUrl: article.urlToImage ?? "",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                maxLines: 2,
                article.author ?? "",
                style: const TextStyle(color: Colors.black45, fontSize: 12),
              ),
              Text(
                article.title ?? "",
                style: const TextStyle(color: Colors.black87, fontSize: 18),
                maxLines: 1,
              ),
              const SizedBox(height: 8),
              Text(
                maxLines: 2,
                article.description ?? "",
                style: const TextStyle(color: Colors.black45, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                textAlign: TextAlign.end,
                maxLines: 2,
                article.publishedAt?.substring(0, 10) ?? "",
                style: const TextStyle(color: Colors.black26, fontSize: 14),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .35),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewScreen(
                          article: article,
                        ),
                      ));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View Full Article",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 35,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
